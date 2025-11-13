---
layout: page
title: Statistics Overview
permalink: /resource_pages/statistics.html
nav_exclude: true
---

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

<table>
  <thead>
    <tr>
      <th><strong>Category</strong></th>
      <th><strong>Statistic</strong></th>
      <th><strong>Description</strong></th>
      <th><strong>Formula / Calculation</strong></th>
      <th><strong>When to Use</strong></th>
      <th><strong>Python Implementation</strong></th>
    </tr>
  </thead>
  <tbody>
    {% for category_group in site.data.statistics_tables.descriptive_statistics %}
      {% for stat in category_group.statistics %}
        <tr>
          {% if forloop.first %}
            <td rowspan="{{ category_group.statistics.size }}"><strong>{{ category_group.category }}</strong></td>
          {% endif %}
          <td><strong>{{ stat.name }}</strong></td>
          <td>{{ stat.description }}</td>
          <td>{{ stat.formula }}</td>
          <td>{{ stat.when_to_use }}</td>
          <td>{{ stat.python }}</td>
        </tr>
      {% endfor %}
    {% endfor %}
  </tbody>
</table>

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

<table>
  <thead>
    <tr>
      <th><strong>Type</strong></th>
      <th><strong>Distribution</strong></th>
      <th><strong>Parameters</strong></th>
      <th><strong>Description</strong></th>
      <th><strong>Python Implementation</strong></th>
      <th><strong>Distribution Shape</strong></th>
    </tr>
  </thead>
  <tbody>
    {% assign base_url = "https://gperdrizet.github.io/FSA_devops/assets/distribution_plots/" %}
    {% for type_group in site.data.statistics_tables.probability_distributions %}
      {% for dist in type_group.distributions %}
        <tr>
          {% if forloop.first %}
            <td rowspan="{{ type_group.distributions.size }}"><strong>{{ type_group.type }}</strong></td>
          {% endif %}
          <td><strong>{{ dist.name }}</strong></td>
          <td>{{ dist.parameters }}</td>
          <td>{{ dist.description }}</td>
          <td>{{ dist.python }}</td>
          <td><a href="{{ base_url }}{{ dist.image }}" target="_blank"><img src="{{ base_url }}{{ dist.image }}" alt="{{ dist.name }}"></a></td>
        </tr>
      {% endfor %}
    {% endfor %}
  </tbody>
</table>

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
- Memoryless property: P(X > s+t \| X > s) = P(X > t)

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

<table>
  <thead>
    <tr>
      <th><strong>Independent Variable Type</strong></th>
      <th><strong>Dependent Variable Type</strong></th>
      <th><strong>Situation</strong></th>
      <th><strong>Parametric Test</strong></th>
      <th><strong>Non-Parametric Test</strong></th>
      <th><strong>P-value Interpretation</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="4"><strong>None</strong></td>
      <td rowspan="3"><strong>Continuous</strong></td>
      <td>Comparing one sample to a known value</td>
      <td>One-sample T-test / Z-test</td>
      <td>Wilcoxon signed-rank test</td>
      <td>Low p-value: Sample mean significantly differs from known value</td>
    </tr>
    <tr>
      <td>Testing normality of data</td>
      <td>Shapiro-Wilk test</td>
      <td>Kolmogorov-Smirnov test</td>
      <td>Low p-value: Data significantly deviates from normal distribution</td>
    </tr>
    <tr>
      <td>Comparing sample distribution to theoretical distribution</td>
      <td>N/A</td>
      <td>Kolmogorov-Smirnov test</td>
      <td>Low p-value: Sample distribution differs from theoretical distribution</td>
    </tr>
    <tr>
      <td><strong>Categorical</strong></td>
      <td>Comparing distributions of categorical variables</td>
      <td>Chi-square test</td>
      <td>Fisher's exact test (for small samples)</td>
      <td>Low p-value: Observed distribution differs from expected</td>
    </tr>
    <tr>
      <td rowspan="7"><strong>Categorical</strong></td>
      <td rowspan="6"><strong>Continuous</strong></td>
      <td>Comparing two independent groups</td>
      <td>Independent samples T-test / Two-sample Z-test</td>
      <td>Mann-Whitney U test (Wilcoxon rank-sum test)</td>
      <td>Low p-value: Significant difference between the two groups</td>
    </tr>
    <tr>
      <td>Comparing two paired/dependent groups</td>
      <td>Paired T-test</td>
      <td>Wilcoxon signed-rank test</td>
      <td>Low p-value: Significant change between paired observations</td>
    </tr>
    <tr>
      <td>Comparing three or more independent groups</td>
      <td>One-way ANOVA</td>
      <td>Kruskal-Wallis H test</td>
      <td>Low p-value: At least one group differs from the others</td>
    </tr>
    <tr>
      <td>Comparing three or more paired/dependent groups</td>
      <td>Repeated measures ANOVA</td>
      <td>Friedman test</td>
      <td>Low p-value: Significant differences across repeated measurements</td>
    </tr>
    <tr>
      <td>Testing effects of two or more factors</td>
      <td>Two-way ANOVA / Factorial ANOVA</td>
      <td>Scheirer-Ray-Hare test</td>
      <td>Low p-value: Significant main effects or interaction effects</td>
    </tr>
    <tr>
      <td>Comparing variances between two groups</td>
      <td>F-test (Levene's test)</td>
      <td>Levene's test / Fligner-Killeen test</td>
      <td>Low p-value: Variances significantly differ between groups</td>
    </tr>
    <tr>
      <td><strong>Categorical</strong></td>
      <td>Testing independence of two categorical variables</td>
      <td>Chi-square test of independence</td>
      <td>Fisher's exact test</td>
      <td>Low p-value: Variables are dependent (not independent)</td>
    </tr>
    <tr>
      <td rowspan="1"><strong>Continuous</strong></td>
      <td rowspan="1"><strong>Continuous</strong></td>
      <td>Testing relationship between two continuous variables</td>
      <td>Pearson correlation</td>
      <td>Spearman rank correlation / Kendall's tau</td>
      <td>Low p-value: Significant correlation exists between variables</td>
    </tr>
  </tbody>
</table>

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
   - Python: `multipletests(pvals, method='bonferroni')`

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
