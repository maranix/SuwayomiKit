.PHONY: apollo-cli schema generate config format lint test

API_DIR := Sources/API
PACKAGE_DIR := Sources/SuwayomiKit
TESTS_DIR   := Tests
APOLLO_CLI  := .build/apollo-ios-cli

GRAPHQL_DIR    := GraphQL
CODEGEN_CONFIG := $(GRAPHQL_DIR)/apollo-codegen-config.json

apollo-cli: $(APOLLO_CLI)

$(APOLLO_CLI):
	@mkdir -p $(dir $@)
	@if [ -f $(API_DIR)/apollo-ios-cli ]; then \
		cp -f $(API_DIR)/apollo-ios-cli $@ && rm -f $(API_DIR)/apollo-ios-cli; \
	elif [ -f apollo-ios-cli ]; then \
		cp -f apollo-ios-cli $@ && rm -f apollo-ios-cli; \
	else \
		(cd $(API_DIR) && swift package --allow-writing-to-package-directory --allow-network-connections all apollo-cli-install) && \
		if [ -f $(API_DIR)/apollo-ios-cli ]; then SRC=$(API_DIR)/apollo-ios-cli; else SRC=apollo-ios-cli; fi && \
		cp -f "$$SRC" $@ && rm -f "$$SRC"; \
	fi
	@chmod +x $@
	@./$@ --version

schema: apollo-cli
	@./$(APOLLO_CLI) fetch-schema --path $(CODEGEN_CONFIG)

config: apollo-cli
	@./$(APOLLO_CLI) init \
		--schema-namespace API \
		--module-type other \
		--path $(CODEGEN_CONFIG)

generate: apollo-cli
	@./$(APOLLO_CLI) generate --path $(CODEGEN_CONFIG)

format: 
	@swift format \
		--in-place \
		--recursive \
		--ignore-unparsable-files \
		$(PACKAGE_DIR) $(TESTS_DIR)

lint: 
	@swift format lint \
		--recursive \
		--ignore-unparsable-files \
		$(PACKAGE_DIR) $(TESTS_DIR)

test:
	@swift test \
		--package-path $(PACKAGE_DIR) \
		--parallel
