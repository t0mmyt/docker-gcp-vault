REGISTRY ?= australia-southeast1-docker.pkg.dev/tom-taylor-1/chr
VAULT_VER ?=1.7.3
REPO ?= $(REGISTRY)/vault:$(VAULT_VER)

.PHONY: build
build:
	docker build -t $(REPO) .

