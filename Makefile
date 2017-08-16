.PHONY:help dev dist packaging fmt test deps
.DEFAULT_GOAL := help

# This is a magic code to output help message at default
# see https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Create RPM packages
	@bash -c $(CURDIR)/build_scripts/build.sh

clean: ## Clean cache and output files
	rm -rf ./cache/*
	rm -rf ./build_scripts/output/*

updaterepo: ## update YUM repository
	cp -pr ./build_scripts/outputs/el6/RPMS/x86_64/* ./el6-x86_64/ && ./build_scripts/createrepo -v el6-x86_64
	cp -pr ./build_scripts/outputs/el7/RPMS/x86_64/* ./el7-x86_64/ && ./build_scripts/createrepo -v el7-x86_64
