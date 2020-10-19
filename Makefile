-include .env

define main_title
	@{ \
    set -e ;\
    msg="Make $@";\
    echo "\n\033[34m$$msg" ;\
    for i in $$(seq 1 $${#msg}) ; do printf '=' ; done ;\
    echo "\033[0m\n" ;\
    }
endef

#
##@ uilicious
#
backup: ## backup tests
	uilicious-cli download --key $(UILICIOUS_KEY) "$(UILICIOUS_PROJECT)" $(BACKUP_FOLDER)

list: ## list uilicious tests
	@(uilicious-cli download --key $(UILICIOUS_KEY) "$(UILICIOUS_PROJECT)" /tmp | grep 'Downloaded file' | sed 's/Downloaded file - \/tmp\///g' | sed 's/.test.js//g' | sort) 2>/dev/null

test: ## launch uilicious tests
	uilicious-cli run '$(UILICIOUS_PROJECT)' '$(TEST_TO_RUN)' --key $(UILICIOUS_KEY)

all-tests: ## launch all tests
	@./scripts/all-tests.sh
##@ Helpers

.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help
