package main

import (
	"fmt"
	"log"
	"os"
	"sort"
	"strings"
	"text/template"

	"golang.org/x/text/cases"
	"golang.org/x/text/language"
	"gopkg.in/yaml.v2"
)

type Resource struct {
	Name   string  `yaml:"name"`
	Length *Length `yaml:"length,omitempty"`
	Regex  *string `yaml:"regex,omitempty"`
	Scope  *string `yaml:"scope,omitempty"`
	Slug   *string `yaml:"slug,omitempty"`
	Dashes bool    `yaml:"dashes"`
}

type Length struct {
	Min int `yaml:"min"`
	Max int `yaml:"max"`
}

func main() {
	if err := processResources(); err != nil {
		log.Fatalf("Error processing resources: %v", err)
	}
}

func processResources() error {
	files, err := getTemplateFiles("templates")
	if err != nil {
		return err
	}

	parsedTemplate, err := createTemplate(files)
	if err != nil {
		return err
	}

	data, err := loadResourceData("resourceDefinition.yaml", "resourceDefinition_out_of_docs.yaml")
	if err != nil {
		return err
	}

	sort.Slice(data, func(i, j int) bool {
		return data[i].Name < data[j].Name
	})

	if err := generateFile("main.tf", parsedTemplate, "main", data); err != nil {
		return err
	}

	if err := generateFile("outputs.tf", parsedTemplate, "outputs", data); err != nil {
		return err
	}

	uniqueCount := countUniqueResources("resourceDefinition.yaml")
	fmt.Printf("Number of unique resources in resourceDefinition.yaml: %d\n", uniqueCount)

	return nil
}

func getTemplateFiles(dir string) ([]string, error) {
	files, err := os.ReadDir(dir)
	if err != nil {
		return nil, err
	}

	var fileNames []string
	for _, file := range files {
		fileNames = append(fileNames, dir+"/"+file.Name())
	}
	return fileNames, nil
}

func createTemplate(files []string) (*template.Template, error) {
	caser := cases.Title(language.AmericanEnglish)
	return template.New("templates").Funcs(template.FuncMap{
		"escapeTerraformString": func(s string) string {
			s = strings.ReplaceAll(s, `\`, `\\`)
			return strings.ReplaceAll(s, `"`, `\"`)
		},
		"replace": strings.ReplaceAll,
		"title":   caser.String,
	}).ParseFiles(files...)
}

func loadResourceData(mainFile, undocumentedFile string) ([]Resource, error) {
	var data []Resource

	if err := loadYAMLFile(mainFile, &data); err != nil {
		return nil, err
	}

	var undocumentedData []Resource
	if err := loadYAMLFile(undocumentedFile, &undocumentedData); err != nil {
		return nil, err
	}

	return append(data, undocumentedData...), nil
}

func loadYAMLFile(filename string, data interface{}) error {
	content, err := os.ReadFile(filename)
	if err != nil {
		return err
	}
	return yaml.Unmarshal(content, data)
}

func generateFile(filename string, tmpl *template.Template, templateName string, data interface{}) error {
	file, err := os.OpenFile(filename, os.O_TRUNC|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		return err
	}
	defer file.Close()

	return tmpl.ExecuteTemplate(file, templateName, data)
}

func countUniqueResources(filename string) int {
	var resources []Resource
	if err := loadYAMLFile(filename, &resources); err != nil {
		log.Printf("Error loading resource file: %v", err)
		return 0
	}

	uniqueNames := make(map[string]bool)
	for _, resource := range resources {
		uniqueNames[resource.Name] = true
	}

	return len(uniqueNames)
}
