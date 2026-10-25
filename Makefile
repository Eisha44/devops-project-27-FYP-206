SRC_DIR := src
OUT_DIR := out

SOURCES := $(wildcard $(SRC_DIR)/*.md)
OUTPUTS := $(patsubst $(SRC_DIR)/%.md,$(OUT_DIR)/%.html,$(SOURCES))

.PHONY: all check build deps test package clean ci

all: build

check:
	@test -n "$(SOURCES)" || (echo "No Markdown sources found"; exit 1)

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

node_modules: package-lock.json
	@npm ci
	@touch node_modules

deps: node_modules

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md package-lock.json | $(OUT_DIR) node_modules
	@echo "BUILD $< -> $@"
	@npm run --silent build -- $< $@

build: $(OUTPUTS)

test: build
	@npm test --silent

package: test
	@npm pack

clean:
	@rm -rf $(OUT_DIR) *.tgz

ci: clean deps check test package
