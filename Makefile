.PHONY: all install build generate init format validate docs

all: build init format validate docs
	@echo "Cleaning up initialization files..."
	@rm -rf .terraform
	@rm -f terraform.tfstate
	@rm -f terraform.tfstate.backup
	@rm -f .terraform.lock.hcl

TEST_ARGS := $(if $(skip-destroy),-skip-destroy=$(skip-destroy)) \
             $(if $(exception),-exception=$(exception)) \
             $(if $(example),-example=$(example)) \
             $(if $(local),-local=$(local))

test:
	cd tests && go test -v -timeout 60m -run '^TestApplyNoError$$' -args $(TEST_ARGS) .

test-sequential:
	cd tests && go test -v -timeout 60m -run '^TestApplyAllSequential$$' -args $(TEST_ARGS) .

test-parallel:
	cd tests && go test -v -timeout 60m -run '^TestApplyAllParallel$$' -args $(TEST_ARGS) .

test-local:
	cd tests && go test -v -timeout 60m -run '^TestApplyAllLocal$$' -args $(TEST_ARGS) .

install:
	@command -v terraform >/dev/null 2>&1 || go install github.com/hashicorp/terraform@v1.2.5
	@command -v terraform-docs >/dev/null 2>&1 || go install github.com/terraform-docs/terraform-docs@latest

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
	@terraform-docs markdown document --output-file README.md --output-mode inject . --hide modules

