---
layout: page
title: Plotting
permalink: /resource_pages/plotting.html
nav_exclude: true
---

# Plotting Overview

## Introduction

Data visualization is essential for exploring, understanding, and communicating insights from data. This guide covers common plot types, their purposes, and when to use them.

## Table of Contents
1. [Plot Selection Guide](#1-plot-selection-guide)
   - [By Analysis Goal](#11-by-analysis-goal)
   - [By Data Type Combination](#12-by-data-type-combination)
2. [Best Practices](#2-best-practices)
   - [General Guidelines](#21-general-guidelines)
   - [Common Mistakes to Avoid](#22-common-mistakes-to-avoid)
3. [Common Plot Types by Data Type and Purpose](#3-common-plot-types-by-data-type-and-purpose)
   - [Univariate Plots (Single Variable)](#31-univariate-plots-single-variable)
   - [Bivariate Plots (Two Variables)](#32-bivariate-plots-two-variables)
   - [Multivariate Plots (Three or More Variables)](#33-multivariate-plots-three-or-more-variables)
   - [Specialized Statistical Plots](#34-specialized-statistical-plots)
   - [Time Series Plots](#35-time-series-plots)
4. [Additional Resources](#4-additional-resources)
   - [Python Visualization Libraries](#41-python-visualization-libraries)
   - [Recommended Reading](#42-recommended-reading)
   - [Color Palettes](#43-color-palettes)


---

## 1. Plot Selection Guide

### 1.1. By Analysis Goal

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

### 1.2. By Data Type Combination

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

## 2. Best Practices

### 2.1. General Guidelines

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

### 2.2. Common Mistakes to Avoid

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


---

## 3. Common Plot Types by Data Type and Purpose

### 3.1. Univariate Plots (Single Variable)

| **Plot Type** | **Example** | **Data Type** | **Purpose** | **Key Features** | **Python Implementation** |
|---------------|-------------|---------------|-------------|------------------|---------------------------|
| **Histogram** | [![Histogram](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/histogram.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/histogram.png){:target="_blank"} | Continuous | Show distribution and frequency of values | Bins group continuous data; bar heights show frequency | `plt.hist(data, bins=30)` or `sns.histplot(data)` |
| **Box Plot (Box-and-Whisker)** | [![Box Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/boxplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/boxplot.png){:target="_blank"} | Continuous | Display distribution summary (quartiles, median, outliers) | Shows Q1, median, Q3, whiskers (1.5×IQR), and outliers as points | `plt.boxplot(data)` or `sns.boxplot(data)` |
| **Violin Plot** | [![Violin Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/violinplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/violinplot.png){:target="_blank"} | Continuous | Combination of box plot and density plot | Wider sections indicate higher density; includes median marker | `sns.violinplot(x=data)` |
| **Density Plot (KDE)** | [![Density Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/densityplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/densityplot.png){:target="_blank"} | Continuous | Smooth estimate of probability density function | Smooth curve showing probability density | `sns.kdeplot(data)` or `data.plot(kind='kde')` |
| **Bar Chart** | [![Bar Chart](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/barchart.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/barchart.png){:target="_blank"} | Categorical | Compare frequencies or values across categories | Each bar represents a category; height shows value/count | `plt.bar(categories, values)` or `sns.barplot(x, y)` |
| **Count Plot** | [![Count Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/countplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/countplot.png){:target="_blank"} | Categorical | Show frequency of categorical values | Specialized bar chart for counts | `sns.countplot(x=category)` |
| **Pie Chart** | [![Pie Chart](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/piechart.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/piechart.png){:target="_blank"} | Categorical | Show proportions of a whole | Circular chart divided into slices; each slice represents proportion | `plt.pie(values, labels=labels)` |
| **Strip Plot** | [![Strip Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/stripplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/stripplot.png){:target="_blank"} | Continuous (grouped by category) | Show individual data points along one axis | Points plotted along axis; shows each individual value | `sns.stripplot(x=category, y=values)` |
| **Swarm Plot** | [![Swarm Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/swarmplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/swarmplot.png){:target="_blank"} | Continuous (grouped by category) | Like strip plot but points don't overlap | Non-overlapping points; good for seeing density | `sns.swarmplot(x=category, y=values)` |

### 3.2. Bivariate Plots (Two Variables)

| **Plot Type** | **Example** | **X-axis Type** | **Y-axis Type** | **Purpose** | **Key Features** | **Python Implementation** |
|---------------|-------------|-----------------|-----------------|-------------|------------------|---------------------------|
| **Scatter Plot** | [![Scatter Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/scatterplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/scatterplot.png){:target="_blank"} | Continuous | Continuous | Show relationship between two continuous variables | Each point represents one observation | `plt.scatter(x, y)` or `sns.scatterplot(x, y)` |
| **Line Plot** | [![Line Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/lineplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/lineplot.png){:target="_blank"} | Continuous/Time | Continuous | Show trends over continuous variable (often time) | Points connected by lines | `plt.plot(x, y)` or `data.plot()` |
| **Bar Chart** | [![Bar Chart](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/barchart.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/barchart.png){:target="_blank"} | Categorical | Continuous | Compare continuous values across categories | Bars represent values for each category | `plt.bar(categories, values)` or `sns.barplot(x, y)` |
| **Box Plot (Grouped)** | [![Grouped Box Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/grouped_boxplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/grouped_boxplot.png){:target="_blank"} | Categorical | Continuous | Compare distributions across categories | Multiple box plots side by side | `sns.boxplot(x=category, y=values)` |
| **Violin Plot (Grouped)** | [![Grouped Violin Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/grouped_violinplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/grouped_violinplot.png){:target="_blank"} | Categorical | Continuous | Compare distribution shapes across categories | Multiple violin plots side by side | `sns.violinplot(x=category, y=values)` |
| **Heatmap** | [![Heatmap](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/heatmap.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/heatmap.png){:target="_blank"} | Categorical/Discrete | Categorical/Discrete | Show magnitude of values in two-dimensional space | Color intensity represents value magnitude | `sns.heatmap(data, annot=True)` |
| **Hexbin Plot** | [![Hexbin Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/hexbinplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/hexbinplot.png){:target="_blank"} | Continuous | Continuous | Show density of points in 2D space | Hexagonal bins; color shows point density | `plt.hexbin(x, y, gridsize=30)` |
| **2D Density Plot** | [![2D Density Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/density2d.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/density2d.png){:target="_blank"} | Continuous | Continuous | Show probability density in 2D space | Contour lines or color gradients show density | `sns.kdeplot(x=x, y=y)` |
| **Joint Plot** | [![Joint Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/jointplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/jointplot.png){:target="_blank"} | Continuous | Continuous | Combine scatter plot with marginal distributions | Central scatter with histograms/KDEs on margins | `sns.jointplot(x=x, y=y)` |

### 3.3. Multivariate Plots (Three or More Variables)

| **Plot Type** | **Example** | **Purpose** | **Key Features** | **Python Implementation** |
|---------------|-------------|-------------|------------------|---------------------------|
| **Pair Plot (Scatter Matrix)** | [![Pair Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/pairplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/pairplot.png){:target="_blank"} | Show all pairwise relationships in dataset | Grid of scatter plots; diagonal shows distributions | `sns.pairplot(dataframe)` |
| **3D Scatter Plot** | [![3D Scatter Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/scatter3d.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/scatter3d.png){:target="_blank"} | Show relationship between three continuous variables | Points plotted in 3D space | `from mpl_toolkits.mplot3d import Axes3D` then `ax.scatter3D(x, y, z)` |
| **Bubble Chart** | [![Bubble Chart](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/bubblechart.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/bubblechart.png){:target="_blank"} | Show three continuous variables (x, y, size) | Like scatter plot but point size represents third variable | `plt.scatter(x, y, s=sizes)` |
| **Facet Grid (Small Multiples)** | [![Facet Grid](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/facetgrid.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/facetgrid.png){:target="_blank"} | Show subsets of data in separate subplots | Multiple plots arranged in grid | `sns.FacetGrid(data, col='category').map(plt.scatter, 'x', 'y')` |
| **Parallel Coordinates** | [![Parallel Coordinates](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/parallelcoordinates.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/parallelcoordinates.png){:target="_blank"} | Compare multiple variables across observations | Lines connect values across parallel axes | `pd.plotting.parallel_coordinates(df, 'class_column')` |
| **Correlation Heatmap** | [![Correlation Heatmap](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/correlation_heatmap.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/correlation_heatmap.png){:target="_blank"} | Show correlation between all variable pairs | Color-coded correlation matrix | `sns.heatmap(df.corr(), annot=True)` |

### 3.4. Specialized Statistical Plots

| **Plot Type** | **Example** | **Purpose** | **Key Features** | **Python Implementation** |
|---------------|-------------|-------------|------------------|---------------------------|
| **Q-Q Plot (Quantile-Quantile)** | [![Q-Q Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/qqplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/qqplot.png){:target="_blank"} | Test if data follows theoretical distribution | Points should follow diagonal line if normally distributed | `stats.probplot(data, dist="norm", plot=plt)` |
| **Residual Plot** | [![Residual Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/residualplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/residualplot.png){:target="_blank"} | Diagnose regression model fit | Plot residuals vs fitted values; should show random pattern | `sns.residplot(x=predictions, y=residuals)` |
| **ROC Curve** | [![ROC Curve](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/roc_curve.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/roc_curve.png){:target="_blank"} | Evaluate binary classifier performance | Plots True Positive Rate vs False Positive Rate | `from sklearn.metrics import roc_curve` then `plt.plot(fpr, tpr)` |
| **Confusion Matrix** | [![Confusion Matrix](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/confusion_matrix.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/confusion_matrix.png){:target="_blank"} | Show classification results | Matrix showing predicted vs actual classes | `sns.heatmap(confusion_matrix, annot=True, fmt='d')` |
| **Error Bars** | [![Error Bars](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/errorbars.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/errorbars.png){:target="_blank"} | Show uncertainty or variability | Bars extend from points to show range | `plt.errorbar(x, y, yerr=errors)` |
| **Regression Plot** | [![Regression Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/regressionplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/regressionplot.png){:target="_blank"} | Show linear relationship and confidence interval | Scatter plot with fitted line and confidence band | `sns.regplot(x=x, y=y)` |

### 3.5. Time Series Plots

| **Plot Type** | **Example** | **Purpose** | **Key Features** | **Python Implementation** |
|---------------|-------------|-------------|------------------|---------------------------|
| **Line Plot** | [![Time Series Line Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/timeseries_line.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/timeseries_line.png){:target="_blank"} | Show values changing over time | X-axis is time; y-axis is value | `plt.plot(dates, values)` or `data.plot()` |
| **Area Plot** | [![Area Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/areaplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/areaplot.png){:target="_blank"} | Show cumulative totals over time | Filled area under line(s) | `data.plot.area()` or `plt.fill_between(x, y)` |
| **Stacked Area Plot** | [![Stacked Area Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/stacked_area.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/stacked_area.png){:target="_blank"} | Show multiple time series composition | Multiple series stacked on top of each other | `data.plot.area(stacked=True)` |
| **Seasonal Plot** | [![Seasonal Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/seasonalplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/seasonalplot.png){:target="_blank"} | Show patterns that repeat over time | Multiple lines for each season/cycle | Manually create with groupby and plot |
| **Autocorrelation Plot** | [![Autocorrelation Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/autocorrelation.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/autocorrelation.png){:target="_blank"} | Show correlation of series with lagged versions | Correlation at different lag values | `pd.plotting.autocorrelation_plot(data)` |
| **Lag Plot** | [![Lag Plot](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/lagplot.png)](https://gperdrizet.github.io/FSA_devops/assets/plot_examples/lagplot.png){:target="_blank"} | Check for randomness in time series | Current value vs lagged value | `pd.plotting.lag_plot(data)` |


---

## 4. Additional Resources

### 4.1. Python Visualization Libraries

| **Library** | **Strengths** | **Best For** | **Import Statement** |
|-------------|---------------|--------------|---------------------|
| **Matplotlib** | Highly customizable, fine control | Publication-quality plots, custom visualizations | `import matplotlib.pyplot as plt` |
| **Seaborn** | Beautiful defaults, statistical plots | Exploratory data analysis, statistical visualization | `import seaborn as sns` |
| **Pandas** | Integrated with DataFrames | Quick exploration, simple plots | Built-in: `df.plot()` |
| **Plotly** | Interactive plots, 3D support | Dashboards, web applications, interactive exploration | `import plotly.express as px` |
| **Bokeh** | Interactive web-ready plots | Interactive dashboards, streaming data | `from bokeh.plotting import figure` |

### 4.2. Recommended Reading

- <a href="https://www.edwardtufte.com/tufte/books_vdqi" target="_blank">**"The Visual Display of Quantitative Information"**</a> by Edward Tufte
- <a href="https://clauswilke.com/dataviz/" target="_blank">**"Fundamentals of Data Visualization"**</a> by Claus O. Wilke
- <a href="https://www.storytellingwithdata.com/" target="_blank">**"Storytelling with Data"**</a> by Cole Nussbaumer Knaflic

### Online Tools
- <a href="https://colorbrewer2.org/" target="_blank">**ColorBrewer**</a>: Color schemes for maps and data visualization
- <a href="https://seaborn.pydata.org/examples/index.html" target="_blank">**Seaborn Gallery**</a>: Examples of statistical plots
- <a href="https://matplotlib.org/stable/gallery/index.html" target="_blank">**Matplotlib Gallery**</a>: Comprehensive plot examples
- <a href="https://www.python-graph-gallery.com/" target="_blank">**Python Graph Gallery**</a>: Collection of plot types with code

### 4.3. Color Palettes

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
