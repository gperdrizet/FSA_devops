# Makefile for FSA_devops Jekyll site build automation
# This file provides targets for building, testing, and deploying the Jekyll site

.PHONY: help install clean copy-notebooks copy-data copy-resources copy-all build-github build-render serve-local validate-links

# Default target - show help
help:
	@echo "Available targets:"
	@echo "  install          - Install Ruby dependencies via bundle install"
	@echo "  clean            - Remove built site and copied assets"
	@echo "  copy-notebooks   - Copy notebook files to site/assets/notebooks"
	@echo "  copy-data        - Copy data files to site/assets/data"
	@echo "  copy-resources   - Copy resources.md to site directory"
	@echo "  copy-all         - Run all copy targets"
	@echo "  build-github     - Build site for GitHub Pages (with baseurl)"
	@echo "  build-render     - Build site for Render.com (without baseurl)"
	@echo "  serve-local      - Serve site locally (matches GitHub Pages config)"
	@echo "  validate-links   - Check for broken internal links using linkchecker"

# Install dependencies
install:
	@echo "Installing Ruby dependencies..."
	cd site && bundle install

# Clean built site and copied assets
clean:
	@echo "Cleaning built site and copied assets..."
	rm -rf site/_site
	rm -rf site/assets/notebooks
	rm -rf site/assets/data
	rm -f site/resources.md

# Copy notebooks to site assets
copy-notebooks:
	@echo "Copying notebooks to site/assets/notebooks..."
	mkdir -p site/assets/notebooks
	cp -r notebooks/* site/assets/notebooks/
	mkdir -p site/_data
	cp notebooks/notebooks.yml site/_data/

# Copy data files to site assets
copy-data:
	@echo "Copying data files to site/assets/data..."
	mkdir -p site/assets/data
	cp -r data/* site/assets/data/
	mkdir -p site/_data
	cp data/datasets.yml site/_data/

# Copy resources.md to site directory
copy-resources:
	@echo "Copying resources.md to site..."
	cp resources.md site/

# Copy all assets
copy-all: copy-notebooks copy-data copy-resources
	@echo "All assets copied successfully"

# Build for GitHub Pages (with baseurl)
build-github: copy-all
	@echo "Building site for GitHub Pages..."
	cd site && bundle exec jekyll build

# Build for Render.com (merged config without baseurl)
build-render: copy-all
	@echo "Building site for Render.com..."
	cd site && bundle exec jekyll build --config _config.yml,_config_render.yml

# Serve site locally (matches GitHub Pages production config)
serve-local: copy-all
	@echo "Starting local Jekyll server..."
	cd site && bundle exec jekyll serve --livereload

# Validate links (internal only, no external link checking)
validate-links:
	@echo "Validating internal links..."
	@if ! command -v linkchecker &> /dev/null; then \
		echo "Error: linkchecker not found. Install with: pip install linkchecker"; \
		exit 1; \
	fi
	linkchecker --check-extern=no site/_site
