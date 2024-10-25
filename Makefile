.PHONY: install nuke
.DEFAULT_GOAL := help

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

brew: ## Install Homebrew packages
	brew bundle --file=Brewfile.arm64

link: ## Link dotfiles
	./scripts/link.sh

install: brew link ## Install Homebrew packages and link dotfiles

nuke: ## Nuke symlinks so you may start over
	./scripts/unlink.sh

