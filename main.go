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

type ResourceLoader interface {
	LoadResources() ([]Resource, error)
	CountUniqueResources() (int, error)
}

type TemplateProcessor interface {
	LoadTemplates() (*template.Template, error)
	GenerateFiles([]Resource) error
}

type FileSystem interface {
	ReadFile(string) ([]byte, error)
	WriteFile(string, []byte, os.FileMode) error
	ReadDir(string) ([]os.DirEntry, error)
}

type DefaultFileSystem struct{}

func (fs DefaultFileSystem) ReadFile(name string) ([]byte, error) {
	return os.ReadFile(name)
}

func (fs DefaultFileSystem) WriteFile(name string, data []byte, mode os.FileMode) error {
	return os.WriteFile(name, data, mode)
}

func (fs DefaultFileSystem) ReadDir(name string) ([]os.DirEntry, error) {
	return os.ReadDir(name)
}

type YAMLResourceLoader struct {
	mainFile   string
	undocFile  string
	fileSystem FileSystem
}

func NewYAMLResourceLoader(mainFile, undocFile string, fs FileSystem) *YAMLResourceLoader {
	return &YAMLResourceLoader{
		mainFile:   mainFile,
		undocFile:  undocFile,
		fileSystem: fs,
	}
}

func (l *YAMLResourceLoader) LoadResources() ([]Resource, error) {
	var mainResources, undocResources []Resource

	if err := l.loadYAMLFile(l.mainFile, &mainResources); err != nil {
		return nil, fmt.Errorf("failed to load main resource file: %w", err)
	}

	if err := l.loadYAMLFile(l.undocFile, &undocResources); err != nil {
		return nil, fmt.Errorf("failed to load undocumented resource file: %w", err)
	}

	resources := append(mainResources, undocResources...)
	sort.Slice(resources, func(i, j int) bool {
		return resources[i].Name < resources[j].Name
	})

	return resources, nil
}

func (l *YAMLResourceLoader) CountUniqueResources() (int, error) {
	var resources []Resource
	if err := l.loadYAMLFile(l.mainFile, &resources); err != nil {
		return 0, fmt.Errorf("failed to count resources: %w", err)
	}

	uniqueNames := make(map[string]bool)
	for _, resource := range resources {
		uniqueNames[resource.Name] = true
	}
	return len(uniqueNames), nil
}

func (l *YAMLResourceLoader) loadYAMLFile(filename string, data any) error {
	content, err := l.fileSystem.ReadFile(filename)
	if err != nil {
		return fmt.Errorf("failed to read file %s: %w", filename, err)
	}

	if err := yaml.Unmarshal(content, data); err != nil {
		return fmt.Errorf("failed to unmarshal YAML from %s: %w", filename, err)
	}

	return nil
}

type DefaultTemplateProcessor struct {
	templateDir   string
	fileSystem    FileSystem
	templateFuncs template.FuncMap
}

func NewTemplateProcessor(templateDir string, fs FileSystem) *DefaultTemplateProcessor {
	caser := cases.Title(language.AmericanEnglish)
	return &DefaultTemplateProcessor{
		templateDir: templateDir,
		fileSystem:  fs,
		templateFuncs: template.FuncMap{
			"escapeTerraformString": func(s string) string {
				s = strings.ReplaceAll(s, `\`, `\\`)
				return strings.ReplaceAll(s, `"`, `\"`)
			},
			"replace": strings.ReplaceAll,
			"title":   caser.String,
		},
	}
}

func (p *DefaultTemplateProcessor) LoadTemplates() (*template.Template, error) {
	files, err := p.getTemplateFiles()
	if err != nil {
		return nil, err
	}

	tmpl := template.New("templates").Funcs(p.templateFuncs)
	return tmpl.ParseFiles(files...)
}

func (p *DefaultTemplateProcessor) getTemplateFiles() ([]string, error) {
	files, err := p.fileSystem.ReadDir(p.templateDir)
	if err != nil {
		return nil, fmt.Errorf("failed to read template directory: %w", err)
	}

	var fileNames []string
	for _, file := range files {
		fileNames = append(fileNames, fmt.Sprintf("%s/%s", p.templateDir, file.Name()))
	}
	return fileNames, nil
}

func (p *DefaultTemplateProcessor) GenerateFiles(resources []Resource) error {
	tmpl, err := p.LoadTemplates()
	if err != nil {
		return err
	}

	outputs := map[string]string{
		"main.tf":    "main",
		"outputs.tf": "outputs",
	}

	for filename, templateName := range outputs {
		if err := p.generateFile(filename, templateName, tmpl, resources); err != nil {
			return fmt.Errorf("failed to generate %s: %w", filename, err)
		}
	}

	return nil
}

func (p *DefaultTemplateProcessor) generateFile(filename, templateName string, tmpl *template.Template, data any) error {
	var output strings.Builder
	if err := tmpl.ExecuteTemplate(&output, templateName, data); err != nil {
		return fmt.Errorf("failed to execute template %s: %w", templateName, err)
	}

	return p.fileSystem.WriteFile(filename, []byte(output.String()), 0644)
}

type ResourceProcessor struct {
	loader    ResourceLoader
	processor TemplateProcessor
}

func NewResourceProcessor(loader ResourceLoader, processor TemplateProcessor) *ResourceProcessor {
	return &ResourceProcessor{
		loader:    loader,
		processor: processor,
	}
}

func (rp *ResourceProcessor) Process() error {
	resources, err := rp.loader.LoadResources()
	if err != nil {
		return fmt.Errorf("failed to load resources: %w", err)
	}

	if err := rp.processor.GenerateFiles(resources); err != nil {
		return fmt.Errorf("failed to generate files: %w", err)
	}

	uniqueCount, err := rp.loader.CountUniqueResources()
	if err != nil {
		return fmt.Errorf("failed to count unique resources: %w", err)
	}

	fmt.Printf("Number of unique resources: %d\n", uniqueCount)
	return nil
}

func main() {
	fs := DefaultFileSystem{}

	loader := NewYAMLResourceLoader(
		"resourceDefinition.yaml",
		"resourceDefinition_out_of_docs.yaml",
		fs,
	)

	processor := NewTemplateProcessor("templates", fs)

	rp := NewResourceProcessor(loader, processor)

	if err := rp.Process(); err != nil {
		log.Fatalf("Error processing resources: %v", err)
	}
}
