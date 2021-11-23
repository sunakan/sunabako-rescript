.PHONY: re-version
re-version: ## rescript -version
	./node_modules/.bin/rescript -version

.PHONY: re-help
re-help: ## rescript -help
	./node_modules/.bin/rescript -help

.PHONY: re-build-watch
re-build-watch: ## rescript build -w
	./node_modules/.bin/rescript build -w

.PHONY: re-clean
re-clean: ## rescript clean
	./node_modules/.bin/rescript clean

.PHONY: up
up: ## start express web server
	./node_modules/.bin/nodemon lib/js/src/Index.bs.js

.PHONY: test
test: ## test
	bash ./test.sh

################################################################################
# Utility-Command tree
################################################################################
.PHONY: tree
tree: ## Tree ツリー構造で表現
	tree -a -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N

################################################################################
# Utility-Command help
################################################################################
.DEFAULT_GOAL := help

################################################################################
# マクロ
################################################################################
# $(1): Makefile名
# Makefileの中身を抽出してhelpとして1行で出す
# $(1): Makefile名
define help
  grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(1) \
  | grep --invert-match "## non-help" \
  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
endef
################################################################################
# タスク
################################################################################
.PHONY: help
help: ## Make タスク一覧
	@echo '######################################################################'
	@echo '# Makeタスク一覧'
	@echo '# $$ make XXX'
	@echo '# or'
	@echo '# $$ make XXX --dry-run'
	@echo '######################################################################'
	@echo $(MAKEFILE_LIST) \
	| tr ' ' '\n' \
	| xargs -I {included-makefile} $(call help,{included-makefile})
