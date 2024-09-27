.PHONY: all install build generate init format validate docs

all: build init format validate docs
	@echo "Cleaning up initialization files..."
	@rm -rf .terraform
	@rm -f terraform.tfstate
	@rm -f terraform.tfstate.backup
	@rm -f .terraform.lock.hcl

install:
	@command -v terraform >/dev/null 2>&1 || go install github.com/hashicorp/terraform@v1.2.5
	@command -v terraform-docs >/dev/null 2>&1 || go install github.com/terraform-docs/terraform-docs@v0.16.0

build: install generate

generate:
	@go run main.go

init:
	@terraform init -input=false

format:
	@terraform fmt

validate:
	@terraform fmt --check
	@terraform validate -no-color

docs:
	@terraform-docs markdown table --output-file README.md --output-mode inject .

