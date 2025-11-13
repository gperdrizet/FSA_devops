---
layout: page
title: Statistics
permalink: /resource_pages/statistics.html
nav_exclude: true
---

# Statistics Overview

Statistics is the foundation of data science, providing the mathematical framework for analyzing data, quantifying uncertainty, and making informed decisions. This guide covers essential descriptive statistics, probability distributions, and hypothesis testing methods used in data analysis.

## Table of Contents
1. [Common Descriptive Statistics](#1-common-descriptive-statistics)
   - [Measures of Central Tendency, Spread, and Shape](#11-measures-of-central-tendency-spread-and-shape)
   - [Interpretation Guidelines](#12-interpretation-guidelines)
   - [Choosing the Right Statistic](#13-choosing-the-right-statistic)
   - [Important Notes](#14-important-notes)
2. [Common Probability Distributions](#2-common-probability-distributions)
   - [Discrete and Continuous Probability Distributions](#21-discrete-and-continuous-probability-distributions)
   - [Key Properties by Distribution](#13-key-properties-by-distribution)
3. [Statistical Test Selection Guide](#3-statistical-test-selection-guide)
   - [Hypothesis Testing by Scenario](#31-hypothesis-testing-by-scenario)
   - [Test Assumptions Checklist](#32-test-assumptions-checklist)
   - [Multiple Testing Correction](#33-multiple-testing-correction)

---

## 1. Common Descriptive Statistics

Descriptive statistics summarize and describe the main features of a dataset. They are divided into three main categories based on what aspect of the data they measure.

### 1.1. Measures of Central Tendency, Spread, and Shape

| **Category** | **Statistic** | **Description** | **Formula / Calculation** | **When to Use** | **Python Implementation** |
|--------------|---------------|-----------------|---------------------------|-----------------|---------------------------|
| **Central Tendency** | **Mean (μ or x̄)** | Average of all values; sum divided by count | μ = Σx / n | Symmetric distributions without outliers | `np.mean(data)` or `data.mean()` |
| **Central Tendency** | **Median** | Middle value when data is ordered; 50th percentile | Middle value or average of two middle values | Skewed distributions or data with outliers | `np.median(data)` or `data.median()` |
| **Central Tendency** | **Mode** | Most frequently occurring value(s) | Value with highest frequency | Categorical data or multimodal distributions | `statistics.mode(data)` or `data.mode()` |
| **Central Tendency** | **Trimmed Mean** | Mean after removing extreme values (e.g., top/bottom 5%) | Mean of remaining values after trimming | Data with outliers but want mean-like measure | `scipy.stats.trim_mean(data, 0.05)` |
| **Spread** | **Range** | Difference between maximum and minimum values | Range = max - min | Quick measure of spread; sensitive to outliers | `np.ptp(data)` or `max(data) - min(data)` |
| **Spread** | **Variance (σ² or s²)** | Average squared deviation from the mean | σ² = Σ(x - μ)² / n | Understanding variability; basis for other stats | `np.var(data)` or `data.var()` |
| **Spread** | **Standard Deviation (σ or s)** | Square root of variance; typical distance from mean | σ = √(Σ(x - μ)² / n) | Most common spread measure; same units as data | `np.std(data)` or `data.std()` |
| **Spread** | **Interquartile Range (IQR)** | Difference between 75th and 25th percentiles | IQR = Q3 - Q1 | Robust to outliers; used in boxplots | `scipy.stats.iqr(data)` or `data.quantile(0.75) - data.quantile(0.25)` |
| **Spread** | **Mean Absolute Deviation (MAD)** | Average absolute deviation from the mean | MAD = Σ\|x - μ\| / n | Less sensitive to outliers than variance | `np.mean(np.abs(data - np.mean(data)))` |
| **Spread** | **Coefficient of Variation (CV)** | Relative standard deviation (standardized measure) | CV = (σ / μ) × 100% | Comparing variability across different scales | `(np.std(data) / np.mean(data)) * 100` |
| **Shape** | **Skewness** | Measure of asymmetry in the distribution | Positive: right tail; Negative: left tail; 0: symmetric | Assessing distribution symmetry | `scipy.stats.skew(data)` or `data.skew()` |
| **Shape** | **Kurtosis** | Measure of tailedness (outlier propensity) | Positive: heavy tails; Negative: light tails; 0: normal | Identifying presence of outliers | `scipy.stats.kurtosis(data)` or `data.kurtosis()` |

### 1.2. Interpretation Guidelines

#### Central Tendency
- **Mean = Median = Mode**: Perfectly symmetric distribution
- **Mean > Median**: Right-skewed (positive skew) distribution
- **Mean < Median**: Left-skewed (negative skew) distribution

#### Spread
- **Low variance/SD**: Data points cluster closely around the mean
- **High variance/SD**: Data points are widely dispersed
- **IQR**: Contains the middle 50% of the data
- **CV < 15%**: Low variability; CV > 30%: High variability

#### Shape
- **Skewness**:
  - Between -0.5 and 0.5: Approximately symmetric
  - Between -1 and -0.5 or 0.5 and 1: Moderately skewed
  - Less than -1 or greater than 1: Highly skewed

- **Kurtosis** (Excess Kurtosis):
  - Approximately 0: Normal distribution
  - Greater than 0: Heavy tails, more outliers
  - Less than 0: Light tails, fewer outliers

### 1.3. Choosing the Right Statistic

1. **For symmetric data without outliers**: Use mean and standard deviation
2. **For skewed data or data with outliers**: Use median and IQR
3. **For comparing variability across different scales**: Use coefficient of variation
4. **For understanding distribution shape**: Calculate skewness and kurtosis
5. **For categorical data**: Use mode and frequency tables

### 1.4. Important Notes

- Always visualize your data (histograms, boxplots, Q-Q plots) before choosing statistics
- Report multiple measures to give a complete picture of your data
- Consider the context and purpose of your analysis when selecting statistics
- Remember that descriptive statistics can be misleading without understanding the underlying distribution

---

## 2. Common Probability Distributions

Probability distributions describe the likelihood of different outcomes in a random process. They are fundamental to statistical inference, hypothesis testing, and predictive modeling.

### 2.1. Discrete and Continuous Probability Distributions

| **Type** | **Distribution** | **Parameters** | **Description** | **Python Implementation** | **Distribution Shape** |
|----------|------------------|----------------|-----------------|---------------------------|------------------------|
| **Discrete** | **Bernoulli** | p (probability of success) | Single trial with two outcomes (success/failure) | `stats.bernoulli.pmf(k, p)` | [![Bernoulli](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/bernoulli.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/bernoulli.png){:target="_blank"} |
| **Discrete** | **Binomial** | n (trials), p (probability) | Number of successes in n independent Bernoulli trials | `stats.binom.pmf(k, n, p)` | [![Binomial](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/binomial.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/binomial.png){:target="_blank"} |
| **Discrete** | **Poisson** | λ (lambda, rate) | Number of events in fixed time/space interval | `stats.poisson.pmf(k, mu)` | [![Poisson](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/poisson.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/poisson.png){:target="_blank"} |
| **Discrete** | **Geometric** | p (probability of success) | Number of trials until first success | `stats.geom.pmf(k, p)` | [![Geometric](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/geometric.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/geometric.png){:target="_blank"} |
| **Continuous** | **Uniform** | a (min), b (max) | All values in interval [a, b] equally likely | `stats.uniform.pdf(x, a, b-a)` | [![Uniform](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/uniform.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/uniform.png){:target="_blank"} |
| **Continuous** | **Normal (Gaussian)** | μ (mean), σ (std dev) | Symmetric bell curve; most common distribution | `stats.norm.pdf(x, mu, sigma)` | [![Normal](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/normal.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/normal.png){:target="_blank"} |
| **Continuous** | **Exponential** | λ (rate) | Time between events in Poisson process | `stats.expon.pdf(x, scale=1/lambda)` | [![Exponential](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/exponential.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/exponential.png){:target="_blank"} |
| **Continuous** | **Gamma** | k (shape), θ (scale) | Generalizes exponential; sum of k exponential variables | `stats.gamma.pdf(x, k, scale=theta)` | [![Gamma](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/gamma.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/gamma.png){:target="_blank"} |
| **Continuous** | **Beta** | α (alpha), β (beta) | Distribution on interval [0, 1] | `stats.beta.pdf(x, alpha, beta)` | [![Beta](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/beta.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/beta.png){:target="_blank"} |
| **Continuous** | **Chi-Square (χ²)** | df (degrees of freedom) | Sum of squared standard normal variables | `stats.chi2.pdf(x, df)` | [![Chi-Square](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/chi_square.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/chi_square.png){:target="_blank"} |
| **Continuous** | **Student's t** | df (degrees of freedom) | Similar to normal but with heavier tails | `stats.t.pdf(x, df)` | [![t-Distribution](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/t_distribution.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/t_distribution.png){:target="_blank"} |
| **Continuous** | **F-Distribution** | df1, df2 (degrees of freedom) | Ratio of two chi-square distributions | `stats.f.pdf(x, df1, df2)` | [![F-Distribution](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/f_distribution.png)](https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/f_distribution.png){:target="_blank"} |

### 1.3. Key Properties by Distribution

#### 1.3.1. Discrete Distributions

**Bernoulli Distribution**
- Mean: E[X] = p
- Variance: Var(X) = p(1-p)
- Use when: Single binary trial

**Binomial Distribution**
- Mean: E[X] = np
- Variance: Var(X) = np(1-p)
- Use when: Counting successes in fixed number of trials
- Approximates normal when np > 5 and n(1-p) > 5

**Poisson Distribution**
- Mean: E[X] = λ
- Variance: Var(X) = λ
- Use when: Counting rare events in time/space
- Approximates binomial when n is large and p is small

**Geometric Distribution**
- Mean: E[X] = 1/p
- Variance: Var(X) = (1-p)/p²
- Memoryless property: P(X > s+t | X > s) = P(X > t)

#### 1.3.2. Continuous Distributions

**Uniform Distribution**
- Mean: E[X] = (a+b)/2
- Variance: Var(X) = (b-a)²/12
- Use when: All outcomes equally likely

**Normal Distribution**
- Mean: E[X] = μ
- Variance: Var(X) = σ²
- 68-95-99.7 rule: 68% within ±1σ, 95% within ±2σ, 99.7% within ±3σ
- Central Limit Theorem: Sum/average of many random variables → Normal

**Exponential Distribution**
- Mean: E[X] = 1/λ
- Variance: Var(X) = 1/λ²
- Memoryless property like geometric
- Use when: Time between Poisson events

**Gamma Distribution**
- Mean: E[X] = kθ
- Variance: Var(X) = kθ²
- Special case: k=1 gives exponential distribution

**Beta Distribution**
- Mean: E[X] = α/(α+β)
- Variance: Var(X) = αβ/[(α+β)²(α+β+1)]
- Flexible shape: can be uniform, U-shaped, or skewed
- Conjugate prior for binomial/Bernoulli

**Chi-Square Distribution**
- Mean: E[X] = df
- Variance: Var(X) = 2·df
- Always positive, right-skewed
- Approaches normal as df increases

**Student's t-Distribution**
- Mean: E[X] = 0 (for df > 1)
- Variance: Var(X) = df/(df-2) (for df > 2)
- Approaches standard normal as df → ∞
- Use when: Population variance unknown, small samples

**F-Distribution**
- Always positive, right-skewed
- Used for comparing variances
- F = (χ²₁/df₁)/(χ²₂/df₂)

---

## 3. Statistical Test Selection Guide

This comprehensive guide helps you choose the appropriate statistical test based on your research question, variable types, and data characteristics.

**Note**: Parametric tests assume normally distributed data and equal variances, while non-parametric tests make no assumptions about the underlying distribution and are more robust to outliers. A "low p-value" typically means p < 0.05 (or your chosen significance level α).

### 3.1. Test Assumptions Checklist

Before conducting any statistical test, verify the following assumptions:

#### Parametric Test Assumptions
- **Normality**: Data follows a normal distribution
  - **Shapiro-Wilk test**: Best for small to medium samples (n < 5000)
    - `stat, p = stats.shapiro(data)`
    - Low p-value → reject normality assumption
  - **Kolmogorov-Smirnov test**: Better for larger samples, can test against any distribution
    - `stat, p = stats.kstest(data, 'norm', args=(mean, std))`
    - Low p-value → distribution differs from specified distribution
  - **Q-Q plots**: Visual assessment of normality
- **Independence**: Observations are independent of each other
- **Homogeneity of variance**: Equal variances across groups (use Levene's test)
  - `stat, p = stats.levene(group1, group2, group3)`
- **Sample size**: Generally n ≥ 30 for Central Limit Theorem to apply

#### When to Use Non-Parametric Tests
- Small sample sizes (n < 30)
- Non-normal distributions that cannot be transformed
- Ordinal data or ranks
- Presence of significant outliers
- Violations of parametric test assumptions

### 3.2. Hypothesis Testing by Scenario

| **Situation** | **Independent Variable Type** | **Dependent Variable Type** | **Parametric Test** | **Non-Parametric Test** | **P-value Interpretation** |
|---------------|-------------------------------|----------------------------|---------------------|-------------------------|----------------------------|
| **Comparing one sample to a known value** | None (fixed value) | Continuous | One-sample T-test / Z-test | Wilcoxon signed-rank test | Low p-value: Sample mean significantly differs from known value |
| **Comparing two independent groups** | Categorical (2 groups) | Continuous | Independent samples T-test / Two-sample Z-test | Mann-Whitney U test (Wilcoxon rank-sum test) | Low p-value: Significant difference between the two groups |
| **Comparing two paired/dependent groups** | Categorical (2 conditions) | Continuous | Paired T-test | Wilcoxon signed-rank test | Low p-value: Significant change between paired observations |
| **Comparing three or more independent groups** | Categorical (3+ groups) | Continuous | One-way ANOVA | Kruskal-Wallis H test | Low p-value: At least one group differs from the others |
| **Comparing three or more paired/dependent groups** | Categorical (3+ conditions) | Continuous | Repeated measures ANOVA | Friedman test | Low p-value: Significant differences across repeated measurements |
| **Testing relationship between two continuous variables** | Continuous | Continuous | Pearson correlation | Spearman rank correlation / Kendall's tau | Low p-value: Significant correlation exists between variables |
| **Comparing distributions of categorical variables** | None (comparing to expected) | Categorical | Chi-square test | Fisher's exact test (for small samples) | Low p-value: Observed distribution differs from expected |
| **Testing independence of two categorical variables** | Categorical | Categorical | Chi-square test of independence | Fisher's exact test | Low p-value: Variables are dependent (not independent) |
| **Comparing variances between two groups** | Categorical (2 groups) | Continuous (variance) | F-test (Levene's test) | Levene's test / Fligner-Killeen test | Low p-value: Variances significantly differ between groups |
| **Testing effects of two or more factors** | Categorical (2+ factors) | Continuous | Two-way ANOVA / Factorial ANOVA | Scheirer-Ray-Hare test | Low p-value: Significant main effects or interaction effects |
| **Testing normality of data** | None (single sample) | Continuous | Shapiro-Wilk test | Kolmogorov-Smirnov test | Low p-value: Data significantly deviates from normal distribution |
| **Comparing sample distribution to theoretical distribution** | None (comparing distributions) | Continuous | N/A | Kolmogorov-Smirnov test | Low p-value: Sample distribution differs from theoretical distribution |

### 3.3. Multiple Testing Correction

#### The Multiple Comparisons Problem

When performing multiple statistical tests simultaneously, the probability of obtaining at least one false positive (Type I error) increases dramatically. This is known as the **multiple comparisons problem** or **multiple testing problem**.

**Example**: If you conduct 20 independent tests at α = 0.05, the probability of at least one false positive is approximately 64%, not 5%!

#### Why It Matters

- **Inflated Type I Error Rate**: Each additional test increases the family-wise error rate (FWER)
- **False Discoveries**: You're more likely to identify "significant" results that are actually due to chance
- **Reproducibility Issues**: Results that appear significant may not replicate in future studies

#### Common Correction Methods

Multiple testing correction methods are available in the `multipletests` class from the `statsmodels.stats.multitest` module in the Statsmodels Python library.

1. **Bonferroni Correction**
   - Most conservative approach
   - Adjusted α = α / number of tests
   - Example: For 10 tests at α = 0.05, use α = 0.005 for each test
   - Best for: Small number of tests, when minimizing false positives is critical
   - Python: ``multipletests(pvals, method='bonferroni')`

2. **Holm-Bonferroni (Sequential Bonferroni)**
   - Less conservative than Bonferroni
   - Orders p-values and applies sequential testing
   - More powerful while controlling FWER
   - Python: `multipletests(pvals, method='holm')`

3. **False Discovery Rate (FDR) - Benjamini-Hochberg**
   - Controls the proportion of false positives among rejected hypotheses
   - Less conservative than Bonferroni
   - Best for: Exploratory research, large numbers of tests
   - Python: `multipletests(pvals, method='fdr_bh')`

4. **Post-hoc Tests**
   - Used after ANOVA when comparing specific group pairs
   - Methods: Tukey's HSD, Dunnett's test, Scheffé's test
   - Built-in corrections for multiple pairwise comparisons
   - Python: `from statsmodels.stats.multicomp import pairwise_tukeyhsd`

#### Best Practices

- **Plan Ahead**: Define your hypotheses before collecting data to minimize unnecessary tests
- **Adjust When Needed**: Always apply corrections when testing multiple hypotheses in the same dataset
- **Report Transparently**: Clearly state which correction method (if any) was used
- **Consider Context**: Balance between Type I and Type II errors based on your research goals
- **Use Post-hoc Tests**: After ANOVA, use appropriate post-hoc tests rather than multiple t-tests

**Remember**: Failing to account for multiple testing can lead to spurious findings and undermine the validity of your research conclusions.
