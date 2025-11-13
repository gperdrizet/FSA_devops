---
layout: page
title: Statistics
permalink: /resource_pages/plotting.html
nav_exclude: true
---

# Plotting Overview

## Introduction

Data visualization is essential for exploring, understanding, and communicating insights from data. This guide covers common plot types, their purposes, and when to use them.

## Table of Contents
1. [Common Plot Types by Data Type and Purpose](#1-common-plot-types-by-data-type-and-purpose)
   - [Univariate Plots (Single Variable)](#11-univariate-plots-single-variable)
   - [Bivariate Plots (Two Variables)](#12-bivariate-plots-two-variables)
   - [Multivariate Plots (Three or More Variables)](#13-multivariate-plots-three-or-more-variables)
   - [Specialized Statistical Plots](#14-specialized-statistical-plots)
   - [Time Series Plots](#15-time-series-plots)
2. [Plot Selection Guide](#2-plot-selection-guide)
   - [By Analysis Goal](#21-by-analysis-goal)
   - [By Data Type Combination](#22-by-data-type-combination)
3. [Best Practices](#3-best-practices)
   - [General Guidelines](#31-general-guidelines)
   - [Common Mistakes to Avoid](#32-common-mistakes-to-avoid)
   - [Python Visualization Libraries](#33-python-visualization-libraries)
4. [Quick Reference Code Examples](#4-quick-reference-code-examples)
   - [Matplotlib Basics](#41-matplotlib-basics)
   - [Seaborn Examples](#42-seaborn-examples)
   - [Pandas Plotting](#43-pandas-plotting)
5. [Additional Resources](#5-additional-resources)

---

## 1. Common Plot Types by Data Type and Purpose

### 1.1. Univariate Plots (Single Variable)

| **Plot Type** | **Data Type** | **Purpose** | **Best For** | **Key Features** | **Python Implementation** |
|---------------|---------------|-------------|--------------|------------------|---------------------------|
| **Histogram** | Continuous | Show distribution and frequency of values | Understanding data distribution, identifying skewness, detecting outliers | Bins group continuous data; bar heights show frequency | `plt.hist(data, bins=30)` or `sns.histplot(data)` |
| **Box Plot (Box-and-Whisker)** | Continuous | Display distribution summary (quartiles, median, outliers) | Comparing distributions, identifying outliers, seeing spread | Shows Q1, median, Q3, whiskers (1.5×IQR), and outliers as points | `plt.boxplot(data)` or `sns.boxplot(data)` |
| **Violin Plot** | Continuous | Combination of box plot and density plot | Showing distribution shape and density, comparing groups | Wider sections indicate higher density; includes median marker | `sns.violinplot(x=data)` |
| **Density Plot (KDE)** | Continuous | Smooth estimate of probability density function | Visualizing distribution shape without binning | Smooth curve showing probability density | `sns.kdeplot(data)` or `data.plot(kind='kde')` |
| **Bar Chart** | Categorical | Compare frequencies or values across categories | Showing counts, comparing categories, discrete comparisons | Each bar represents a category; height shows value/count | `plt.bar(categories, values)` or `sns.barplot(x, y)` |
| **Count Plot** | Categorical | Show frequency of categorical values | Counting occurrences in categorical data | Specialized bar chart for counts | `sns.countplot(x=category)` |
| **Pie Chart** | Categorical | Show proportions of a whole | Displaying percentage composition (use sparingly) | Circular chart divided into slices; each slice represents proportion | `plt.pie(values, labels=labels)` |
| **Strip Plot** | Continuous (grouped by category) | Show individual data points along one axis | Displaying all observations, small datasets | Points plotted along axis; shows each individual value | `sns.stripplot(x=category, y=values)` |
| **Swarm Plot** | Continuous (grouped by category) | Like strip plot but points don't overlap | Showing distribution of small-medium datasets | Non-overlapping points; good for seeing density | `sns.swarmplot(x=category, y=values)` |

### 1.2. Bivariate Plots (Two Variables)

| **Plot Type** | **X-axis Type** | **Y-axis Type** | **Purpose** | **Best For** | **Key Features** | **Python Implementation** |
|---------------|-----------------|-----------------|-------------|--------------|------------------|---------------------------|
| **Scatter Plot** | Continuous | Continuous | Show relationship between two continuous variables | Identifying correlations, patterns, clusters, outliers | Each point represents one observation | `plt.scatter(x, y)` or `sns.scatterplot(x, y)` |
| **Line Plot** | Continuous/Time | Continuous | Show trends over continuous variable (often time) | Time series data, showing trends and patterns | Points connected by lines | `plt.plot(x, y)` or `data.plot()` |
| **Bar Chart** | Categorical | Continuous | Compare continuous values across categories | Comparing means, totals, or other aggregates by category | Bars represent values for each category | `plt.bar(categories, values)` or `sns.barplot(x, y)` |
| **Box Plot (Grouped)** | Categorical | Continuous | Compare distributions across categories | Comparing multiple groups, seeing differences in spread | Multiple box plots side by side | `sns.boxplot(x=category, y=values)` |
| **Violin Plot (Grouped)** | Categorical | Continuous | Compare distribution shapes across categories | Detailed distribution comparison across groups | Multiple violin plots side by side | `sns.violinplot(x=category, y=values)` |
| **Heatmap** | Categorical/Discrete | Categorical/Discrete | Show magnitude of values in two-dimensional space | Correlation matrices, confusion matrices, pivot tables | Color intensity represents value magnitude | `sns.heatmap(data, annot=True)` |
| **Hexbin Plot** | Continuous | Continuous | Show density of points in 2D space | Large datasets where scatter plots become cluttered | Hexagonal bins; color shows point density | `plt.hexbin(x, y, gridsize=30)` |
| **2D Density Plot** | Continuous | Continuous | Show probability density in 2D space | Understanding joint distributions | Contour lines or color gradients show density | `sns.kdeplot(x=x, y=y)` |
| **Joint Plot** | Continuous | Continuous | Combine scatter plot with marginal distributions | Comprehensive view of bivariate relationship | Central scatter with histograms/KDEs on margins | `sns.jointplot(x=x, y=y)` |

### 1.3. Multivariate Plots (Three or More Variables)

| **Plot Type** | **Purpose** | **Best For** | **Key Features** | **Python Implementation** |
|---------------|-------------|--------------|------------------|---------------------------|
| **Pair Plot (Scatter Matrix)** | Show all pairwise relationships in dataset | Exploratory data analysis, finding correlations | Grid of scatter plots; diagonal shows distributions | `sns.pairplot(dataframe)` |
| **3D Scatter Plot** | Show relationship between three continuous variables | Visualizing 3D relationships | Points plotted in 3D space | `from mpl_toolkits.mplot3d import Axes3D` then `ax.scatter3D(x, y, z)` |
| **Bubble Chart** | Show three continuous variables (x, y, size) | Adding third dimension to scatter plot | Like scatter plot but point size represents third variable | `plt.scatter(x, y, s=sizes)` |
| **Facet Grid (Small Multiples)** | Show subsets of data in separate subplots | Comparing patterns across categories | Multiple plots arranged in grid | `sns.FacetGrid(data, col='category').map(plt.scatter, 'x', 'y')` |
| **Parallel Coordinates** | Compare multiple variables across observations | Comparing multivariate profiles, clustering | Lines connect values across parallel axes | `pd.plotting.parallel_coordinates(df, 'class_column')` |
| **Correlation Heatmap** | Show correlation between all variable pairs | Identifying multicollinearity, feature selection | Color-coded correlation matrix | `sns.heatmap(df.corr(), annot=True)` |

### 1.4. Specialized Statistical Plots

| **Plot Type** | **Purpose** | **Best For** | **Key Features** | **Python Implementation** |
|---------------|-------------|--------------|------------------|---------------------------|
| **Q-Q Plot (Quantile-Quantile)** | Test if data follows theoretical distribution | Checking normality assumption | Points should follow diagonal line if normally distributed | `stats.probplot(data, dist="norm", plot=plt)` |
| **Residual Plot** | Diagnose regression model fit | Checking regression assumptions | Plot residuals vs fitted values; should show random pattern | `sns.residplot(x=predictions, y=residuals)` |
| **ROC Curve** | Evaluate binary classifier performance | Comparing classification models | Plots True Positive Rate vs False Positive Rate | `from sklearn.metrics import roc_curve` then `plt.plot(fpr, tpr)` |
| **Confusion Matrix** | Show classification results | Evaluating classifier accuracy by class | Matrix showing predicted vs actual classes | `sns.heatmap(confusion_matrix, annot=True, fmt='d')` |
| **Error Bars** | Show uncertainty or variability | Displaying confidence intervals, standard errors | Bars extend from points to show range | `plt.errorbar(x, y, yerr=errors)` |
| **Regression Plot** | Show linear relationship and confidence interval | Visualizing regression fit | Scatter plot with fitted line and confidence band | `sns.regplot(x=x, y=y)` |

### 1.5. Time Series Plots

| **Plot Type** | **Purpose** | **Best For** | **Key Features** | **Python Implementation** |
|---------------|-------------|--------------|------------------|---------------------------|
| **Line Plot** | Show values changing over time | General time series visualization | X-axis is time; y-axis is value | `plt.plot(dates, values)` or `data.plot()` |
| **Area Plot** | Show cumulative totals over time | Stacked time series, showing composition | Filled area under line(s) | `data.plot.area()` or `plt.fill_between(x, y)` |
| **Stacked Area Plot** | Show multiple time series composition | Visualizing parts of a whole over time | Multiple series stacked on top of each other | `data.plot.area(stacked=True)` |
| **Seasonal Plot** | Show patterns that repeat over time | Identifying seasonal patterns | Multiple lines for each season/cycle | Manually create with groupby and plot |
| **Autocorrelation Plot** | Show correlation of series with lagged versions | Detecting seasonality, patterns | Correlation at different lag values | `pd.plotting.autocorrelation_plot(data)` |
| **Lag Plot** | Check for randomness in time series | Identifying patterns, testing randomness | Current value vs lagged value | `pd.plotting.lag_plot(data)` |

---

## 2. Plot Selection Guide

### 2.1. By Analysis Goal

| **Goal** | **Recommended Plot Types** |
|----------|---------------------------|
| **Understand distribution of single variable** | Histogram, Box plot, Violin plot, Density plot |
| **Compare groups** | Box plot, Violin plot, Bar chart, Strip plot |
| **Find relationships between variables** | Scatter plot, Line plot, Regression plot, Heatmap |
| **Show composition** | Pie chart, Stacked bar chart, Area plot |
| **Analyze time series** | Line plot, Area plot, Seasonal plot |
| **Detect outliers** | Box plot, Scatter plot, Strip plot |
| **Explore multivariate data** | Pair plot, Correlation heatmap, Facet grid |
| **Check statistical assumptions** | Q-Q plot, Residual plot, Histogram |
| **Show uncertainty** | Error bars, Confidence bands, Violin plots |

### 2.2. By Data Type Combination

| **X Variable** | **Y Variable** | **Z Variable (optional)** | **Recommended Plots** |
|----------------|----------------|---------------------------|----------------------|
| Continuous | None | None | Histogram, Box plot, Violin plot, Density plot |
| Categorical | None | None | Bar chart, Pie chart, Count plot |
| Continuous | Continuous | None | Scatter plot, Line plot, Hexbin, 2D density |
| Categorical | Continuous | None | Box plot, Violin plot, Bar chart, Strip plot |
| Categorical | Categorical | None | Heatmap, Stacked bar chart, Grouped bar chart |
| Continuous | Continuous | Continuous | 3D scatter, Bubble chart, Contour plot |
| Continuous | Continuous | Categorical | Scatter with hue, Facet grid |

---

## 3. Best Practices

### 3.1. General Guidelines

1. **Choose the right plot for your data type and message**
   - Match plot type to data structure (categorical vs continuous)
   - Consider what you want to communicate

2. **Keep it simple**
   - Avoid unnecessary 3D effects
   - Remove chart junk (excessive gridlines, decorations)
   - Use appropriate aspect ratios

3. **Use color effectively**
   - Use color to encode information, not just for decoration
   - Ensure accessibility (colorblind-friendly palettes)
   - Maintain consistency across related plots

4. **Label clearly**
   - Always include axis labels with units
   - Add informative titles
   - Include legends when needed
   - Annotate important points

5. **Consider your audience**
   - Technical vs general audience
   - Level of detail appropriate for context
   - Medium of presentation (paper, screen, presentation)

### 3.2. Common Mistakes to Avoid

| **Mistake** | **Problem** | **Solution** |
|-------------|-------------|--------------|
| **Starting y-axis at non-zero** | Exaggerates differences | Start at zero for bar charts; flexible for line plots |
| **Too many categories** | Cluttered, hard to read | Limit to 7-10 categories; consider grouping or filtering |
| **3D when 2D suffices** | Distorts perception, hard to read | Use 2D alternatives with color or size |
| **Pie charts with many slices** | Hard to compare angles | Use bar chart instead |
| **Dual y-axes** | Can be misleading | Use separate plots or normalize scales |
| **Missing error bars** | Unclear uncertainty | Add error bars or confidence intervals |
| **Poor color choices** | Not colorblind-safe, poor contrast | Use established palettes (ColorBrewer, Seaborn) |
| **Overplotting** | Too many overlapping points | Use transparency, jitter, hexbin, or sample data |

### 3.3. Python Visualization Libraries

| **Library** | **Strengths** | **Best For** | **Import Statement** |
|-------------|---------------|--------------|---------------------|
| **Matplotlib** | Highly customizable, fine control | Publication-quality plots, custom visualizations | `import matplotlib.pyplot as plt` |
| **Seaborn** | Beautiful defaults, statistical plots | Exploratory data analysis, statistical visualization | `import seaborn as sns` |
| **Pandas** | Integrated with DataFrames | Quick exploration, simple plots | Built-in: `df.plot()` |
| **Plotly** | Interactive plots, 3D support | Dashboards, web applications, interactive exploration | `import plotly.express as px` |
| **Bokeh** | Interactive web-ready plots | Interactive dashboards, streaming data | `from bokeh.plotting import figure` |

---

## 5. Additional Resources

### Recommended Reading
- <a href="https://www.edwardtufte.com/tufte/books_vdqi" target="_blank">**"The Visual Display of Quantitative Information"**</a> by Edward Tufte
- <a href="https://clauswilke.com/dataviz/" target="_blank">**"Fundamentals of Data Visualization"**</a> by Claus O. Wilke
- <a href="https://www.storytellingwithdata.com/" target="_blank">**"Storytelling with Data"**</a> by Cole Nussbaumer Knaflic

### Online Tools
- <a href="https://colorbrewer2.org/" target="_blank">**ColorBrewer**</a>: Color schemes for maps and data visualization
- <a href="https://seaborn.pydata.org/examples/index.html" target="_blank">**Seaborn Gallery**</a>: Examples of statistical plots
- <a href="https://matplotlib.org/stable/gallery/index.html" target="_blank">**Matplotlib Gallery**</a>: Comprehensive plot examples
- <a href="https://www.python-graph-gallery.com/" target="_blank">**Python Graph Gallery**</a>: Collection of plot types with code

### Color Palettes
```python
# Colorblind-friendly palettes
sns.color_palette("colorblind")
sns.color_palette("Set2")

# Diverging (for correlation matrices)
sns.color_palette("RdBu_r", as_cmap=True)
sns.color_palette("coolwarm", as_cmap=True)

# Sequential (for heatmaps)
sns.color_palette("YlOrRd", as_cmap=True)
sns.color_palette("viridis", as_cmap=True)
```
