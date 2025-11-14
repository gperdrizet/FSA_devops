# Fullstack Academy AI/ML

[![Pages](https://github.com/gperdrizet/FSA_devops/actions/workflows/deploy-gh-pages.yml/badge.svg)](https://github.com/gperdrizet/FSA_devops/actions/workflows/deploy-gh-pages.yml) [![Pages test](https://github.com/gperdrizet/FSA_devops/actions/workflows/test-gh-pages.yml/badge.svg)](https://github.com/gperdrizet/FSA_devops/actions/workflows/test-gh-pages.yml)

[GitHub Pages blog](https://gperdrizet.github.io/FSA_devops/) for updates, additional resources and how-to guides related to the Fullstack Academy AI/ML program, cohort 2510-FTB-CT-AIM-PT.

## Overview

This repository powers a Jekyll-based GitHub Pages site that serves as a central hub for bootcamp materials, including:

- **Blog posts**: Updates, announcements, and educational content
- **Jupyter notebooks**: Interactive coding exercises and demonstrations
- **Datasets**: CSV files and data resources for student activities
- **DevOps guides**: Setup instructions for Git, Python, and VS Code on Windows and macOS
- **External resources**: Curated links to documentation, tutorials, and tools

The project implements a data-driven architecture using YAML configuration files and Liquid templating to minimize maintenance overhead and enable rapid content updates.

## Architecture

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

## CI/CD Pipeline

### Dual-Workflow Strategy

The repository implements two GitHub Actions workflows for different deployment scenarios:

#### 1. Production Deployment (`deploy-gh-pages.yml`)

**Trigger**: Pushes to `main` branch or manual dispatch

**Process**:
1. **Checkout**: Clones repository with full history
2. **Asset Staging**: Copies notebooks, datasets, and configuration files into the Jekyll source directory (`site/`)
   - Notebooks → `site/assets/notebooks/`
   - Datasets → `site/assets/data/`
   - YAML configs → `site/_data/`
   - Resources page → `site/`
3. **Jekyll Build**: Compiles site using `actions/jekyll-build-pages@v1` with Minima theme
4. **Artifact Upload**: Packages the `_site` directory for deployment
5. **Deployment**: Publishes to GitHub Pages using `actions/deploy-pages@v4`

**Permissions**: Requires `pages: write` and `id-token: write` for GitHub Pages deployment

**Concurrency**: Prevents concurrent deployments to avoid conflicts (`cancel-in-progress: false` preserves in-flight builds)

#### 2. Pull Request Preview (`test-gh-pages.yml`)

**Trigger**: PR creation/reopening or manual dispatch

**Purpose**: Validates that site builds successfully before merging to `main`

**Process**: Identical build steps to production workflow but deploys to `github-pages-test` environment

**Benefits**:
- Catches Jekyll build errors early in the development cycle
- Validates YAML syntax and Liquid template logic
- Ensures asset copying and file structure integrity
- Provides build status checks on PRs via badges

### Build Optimization

The workflows use specific versions of GitHub Actions:
- `actions/checkout@v4`: Fast, secure repository cloning
- `actions/configure-pages@v5`: Configures Pages settings and environment
- `actions/jekyll-build-pages@v1`: Official Jekyll build action with theme support
- `actions/upload-pages-artifact@v3`: Efficient artifact compression and upload
- `actions/deploy-pages@v4`: Atomic deployment to GitHub Pages

## Development Workflow

### Branch Strategy

- **`main`**: Production branch - triggers automatic deployment to GitHub Pages
- **`dev`**: Development branch - used for feature work and testing
- **Feature branches**: Created as needed for specific enhancements

### Local Development

The repository includes a dev container configuration for consistent development environments.

Jekyll's incremental build feature enables rapid iteration - most changes appear on local development server within seconds of saving files:

```bash
# Start local Jekyll server
cd site && bundle exec jekyll serve

# Site available at http://localhost:4000
```

### Content Updates

**Adding Notebooks**:
1. Place `.ipynb` file in appropriate `notebooks/unit*/lesson*/` directory
2. Add metadata entry to `notebooks/notebooks.yml`
3. Commit and push - workflow automatically copies to build directory

**Adding Datasets**:
1. Place CSV file in `data/` directory
2. Add metadata to `data/datasets.yml`
3. Workflow handles asset copying during build

**Writing Blog Posts**:
1. Create markdown file in `site/_posts/` using naming convention: `YYYY-MM-DD-title.md`
2. Include YAML front matter with `layout`, `title`, `date`, and optional `categories`
3. Jekyll automatically includes posts in chronological order on homepage

### Quality Assurance

- **Build status badges**: README displays real-time workflow status
- **PR checks**: Test workflow must pass before merging
- **Local testing**: Jekyll server provides immediate feedback during development
- **Git LFS**: Large files (notebooks, datasets) tracked via LFS for efficient repository management

