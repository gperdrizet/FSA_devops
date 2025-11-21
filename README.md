# Fullstack Academy AI/ML

[![Pages](https://github.com/gperdrizet/FSA_devops/actions/workflows/deploy-gh-pages.yml/badge.svg)](https://github.com/gperdrizet/FSA_devops/actions/workflows/deploy-gh-pages.yml) [![Pages test](https://github.com/gperdrizet/FSA_devops/actions/workflows/test-gh-pages.yml/badge.svg)](https://github.com/gperdrizet/FSA_devops/actions/workflows/test-gh-pages.yml)

[GitHub Pages blog](https://gperdrizet.github.io/FSA_devops/) for updates, additional resources and how-to guides related to the Fullstack Academy AI/ML program, cohort 2510-FTB-CT-AIM-PT.

## 1. Overview

This repository powers a Jekyll-based GitHub Pages site that serves as a central hub for bootcamp materials, including:

- **Blog posts**: Updates, announcements, and educational content
- **Jupyter notebooks**: Interactive coding exercises and demonstrations
- **Datasets**: CSV files and data resources for student activities
- **DevOps guides**: Setup instructions for Git, Python, and VS Code on Windows and macOS
- **External resources**: Curated links to documentation, tutorials, and tools

The project implements a data-driven architecture using YAML configuration files and Liquid templating to minimize maintenance overhead and enable rapid content updates.

## 2. Architecture

### Repository Structure

```
FSA_devops/
├── .github/workflows/      # CI/CD pipeline definitions
│   ├── deploy-gh-pages.yml # Production deployment workflow
│   └── test-gh-pages.yml   # PR preview workflow
├── site/                   # Jekyll source files
│   ├── _config.yml         # Jekyll configuration
│   ├── _data/              # YAML data files
│   │   ├── notebooks.yml   # Notebook metadata
│   │   └── datasets.yml    # Dataset metadata
│   ├── _includes/          # Reusable components
│   ├── _layouts/           # Page templates
│   ├── _posts/             # Blog posts (markdown)
│   ├── assets/             # Static assets (CSS, JS, images)
│   ├── devops_pages/       # Setup guides
│   ├── resource_pages/     # Resource documentation
│   ├── notebooks.md        # Notebook listing page
│   ├── datasets.md         # Dataset listing page
│   └── index.md            # Homepage
├── notebooks/              # Jupyter notebook files
│   └── unit*/lesson*/      # Organized by unit and lesson
├── data/                   # CSV datasets
├── scripts/                # Bash utilities (git-me, git-me-started)
└── resources.md            # Resource links (copied to site/)
```

### Jekyll Site Implementation

**Theme**: Uses the [Minima theme](https://github.com/jekyll/minima) via remote theme configuration for consistent styling and layout.

**Data-Driven Content**: The site leverages Jekyll's data files feature to separate content from presentation:

- `_data/notebooks.yml`: Contains structured metadata for all Jupyter notebooks (units, lessons, GitHub links, Colab links)
- `_data/datasets.yml`: Defines dataset information including descriptions and download links
- Liquid templating in `notebooks.md` and `datasets.md` dynamically generates tables from YAML data

This approach reduces maintenance burden by significantly. Adding new content requires only YAML edits rather than manual HTML/Markdown updates.

**Custom Components**: The `_includes/header.html` file implements navigation filtering to exclude pages with `nav_exclude: true` in their front matter, enabling draft pages and hidden content.

## 3. CI/CD Pipeline

The main branch has protections in place that prevent direct pushes without a pull request. To merge a pull request into main, a test build and preview deployment must first complete successfully.

### 3.1. Pull Request Preview Workflow

When you open a PR from `dev` to `main`, two automated processes run:

#### GitHub Actions Build (`test-gh-pages.yml`)
- **Trigger**: PR opened/reopened/synchronized or manual dispatch
- **Purpose**: Validates that site builds successfully with the Makefile-based workflow
- **Process**: 
  1. Checks out repository code
  2. Sets up Ruby environment
  3. Runs `make build-github` to build site with production config
  4. Posts comment on PR with Render preview URL
- **Output**: Build status check on PR

#### Render.com Preview Deployment
- **Trigger**: PR opened from `dev` branch (automatic via Render PR preview feature)
- **Purpose**: Creates a live preview of changes before merging to production
- **Process**:
  1. Installs Ruby dependencies: `cd site && bundle install`
  2. Builds site with Render config: `make build-render` (uses merged `_config.yml` + `_config_render.yml`)
  3. Deploys to temporary preview URL: `fsa-devops-preview-pr-{NUMBER}.onrender.com`
- **URL Format**: Each PR gets a unique preview URL (e.g., `fsa-devops-preview-pr-42.onrender.com`)
- **Lifecycle**: Preview deployment is automatically deleted when PR is closed/merged
- **Config Files**:
  - `site/_config.yml`: Production config with `baseurl: "/FSA_devops"`
  - `site/_config_render.yml`: Override config with empty baseurl for root-level deployment

**Why Two Configs?**
- GitHub Pages deploys to a subpath: `gperdrizet.github.io/FSA_devops/`
- Render deploys to root: `fsa-devops-preview-pr-42.onrender.com/`
- Jekyll's `relative_url` filter uses `baseurl` to generate correct URLs for each environment

### 3.2. Production Deployment (`deploy-gh-pages.yml`)

- **Trigger**: Pushes to `main` branch or manual dispatch
- **Process**:
   1. **Checkout**: Clones repository with full history
   2. **Asset Staging**: Copies notebooks, datasets, and configuration files into the Jekyll source directory (`site/`)
      - Notebooks → `site/assets/notebooks/`
      - Datasets → `site/assets/data/`
      - YAML configs → `site/_data/`
      - Resources page → `site/`
   3. **Jekyll Build**: Compiles site using `actions/jekyll-build-pages@v1` with Minima theme
   4. **Artifact Upload**: Packages the `_site` directory for deployment
   5. **Deployment**: Publishes to GitHub Pages using `actions/deploy-pages@v4`

### Benefits:
- Catches Jekyll build errors early in the development cycle
- Validates YAML syntax and Liquid template logic
- Ensures asset copying and file structure integrity
- Provides build status checks on PRs via badges
- Enables visual review of changes before production deployment
- Supports collaborative review with live preview links

## 4. Build System

The repository uses a Makefile-based build system for consistent asset management and Jekyll compilation across environments.

### Available Make Targets

```bash
make help              # Show all available targets
make install           # Install Ruby dependencies (bundle install)
make clean             # Remove built site and copied assets
make copy-notebooks    # Copy notebooks to site/assets/notebooks
make copy-data         # Copy datasets to site/assets/data
make copy-resources    # Copy resources.md to site/
make copy-all          # Run all copy targets
make build-github      # Build for GitHub Pages (with baseurl)
make build-render      # Build for Render.com (without baseurl)
make serve-local       # Start local Jekyll server
make validate-links    # Check for broken internal links
```

### Multi-Environment Support

The build system supports two deployment targets:

**GitHub Pages** (`make build-github`):
- Uses `site/_config.yml` only
- Sets `baseurl: "/FSA_devops"` for subpath deployment
- URLs generated as: `/FSA_devops/path/to/resource`

**Render.com** (`make build-render`):
- Merges `site/_config.yml` + `site/_config_render.yml`
- Overrides baseurl to empty string for root deployment
- URLs generated as: `/path/to/resource`

All internal URLs use Jekyll's `relative_url` filter, which automatically adjusts based on the `baseurl` setting.

## 5. Development Workflow

## 5. Development Workflow

### Branch Strategy

- **`main`**: Production branch - triggers automatic deployment to GitHub Pages
- **`dev`**: Development branch - used for feature work and testing
- **Feature branches**: Created as needed for specific enhancements

### Pull Request Process

1. **Create PR**: Open pull request from `dev` to `main` on GitHub
2. **Automated Checks**: 
   - GitHub Actions builds site and reports status
   - Render creates preview deployment (link posted in PR comment)
3. **Review Changes**: Visit preview URL to verify changes work correctly
4. **Merge**: Once approved and checks pass, merge to `main`
5. **Deploy**: Production deployment to GitHub Pages triggers automatically
6. **Cleanup**: Render automatically deletes preview deployment

### Local Development

The repository includes a dev container configuration for consistent development environments.

Jekyll's live reload enables rapid iteration - most changes appear in your browser within seconds:

```bash
# Start local Jekyll server (matches GitHub Pages config)
make serve-local

# Site available at http://localhost:4000/FSA_devops
# Automatically rebuilds on file changes
```

**Note**: Local server uses production config with baseurl, so URLs will include `/FSA_devops` prefix.

### Content Updates

**Adding Notebooks**:
1. Place `.ipynb` file in appropriate `notebooks/unit*/lesson*/` directory
2. Add metadata entry to `notebooks/notebooks.yml`
3. Commit and push - build process automatically copies to site assets

**Adding Datasets**:
1. Place CSV file in `data/` directory
2. Add metadata to `data/datasets.yml`
3. Build process handles asset copying during deployment

**Writing Blog Posts**:
1. Create markdown file in `site/_posts/` using naming convention: `YYYY-MM-DD-title.md`
2. Include YAML front matter with `layout`, `title`, `date`, and optional `categories`
3. Use `{{ '/path/to/resource' | relative_url }}` for any internal links
4. Jekyll automatically includes posts in chronological order on homepage

**Updating Resources**:
1. Edit `resources.md` in repository root
2. Use `{{ '/path' | relative_url }}` filter for all internal links
3. Build process copies file to `site/` directory

