---
layout: page
title: Regression overview
permalink: /resource_pages/regression.html
nav_exclude: true
---

Regression models predict continuous target variables by learning relationships between input features and outputs. This guide covers essential regression techniques, evaluation metrics, and best practices for building effective predictive models.

## Table of contents

1. [Best practices](#1-best-practices)
   - [General guidelines](#11-general-guidelines)
   - [Common pitfalls](#12-common-pitfalls)
2. [Regression workflow](#2-regression-workflow)
3. [Model selection guide](#3-model-selection-guide)
4. [Performance metrics](#4-performance-metrics)
   - [Metric comparison](#41-metric-comparison)
   - [When to use each metric](#42-when-to-use-each-metric)
5. [Core regression techniques](#5-core-regression-techniques)
   - [Regularization methods](#51-regularization-methods)
   - [Cross-validation](#52-cross-validation)
   - [Hyperparameter tuning](#53-hyperparameter-tuning)

---

## 1. Best practices

### 1.1. General guidelines

1. **Start Simple**
   - Begin with linear regression
   - Add complexity only when justified
   - Compare models systematically

2. **Always Split Your Data**
   - Use train-test split (70-30 or 80-20)
   - Set `random_state` for reproducibility
   - Never fit scalers/transformers on test data

3. **Scale Your Features**
   - Essential for regularized regression
   - Use `StandardScaler` after train-test split
   - Apply same transformation to test data

4. **Use Cross-Validation**
   - Provides robust performance estimates
   - K-Fold (k=5 or k=10) is standard
   - Use `cross_val_score()` for quick evaluation

5. **Monitor Overfitting**
   - Compare training vs test performance
   - Large gap indicates overfitting
   - Use regularization if needed

6. **Leverage Pipelines**
   - Combine preprocessing and modeling
   - Prevents data leakage
   - Simplifies deployment
   - Use `sklearn.pipeline.Pipeline`

7. **Document Everything**
   - Track preprocessing steps
   - Record hyperparameters
   - Note performance metrics

### 1.2. Common pitfalls

| **Pitfall** | **Problem** | **Solution** |
|-------------|-------------|--------------|
| **Not splitting data** | Can't evaluate generalization | Always use train-test split |
| **Data leakage** | Overly optimistic results | Fit transformers only on training data |
| **Ignoring overfitting** | Poor test performance | Monitor train vs test metrics |
| **Wrong metric** | Misleading conclusions | Use multiple metrics (MSE, MAE, R²) |
| **Skipping cross-validation** | Unreliable estimates | Use K-Fold cross-validation |
| **Not scaling** | Regularization ineffective | Standardize features |
| **Categorical encoding errors** | Model can't learn | Use one-hot or ordinal encoding |
| **Missing values** | Training fails or biased | Impute before modeling |
| **High multicollinearity** | Unstable coefficients | Use Ridge or ElasticNet |

---

## 2. Regression workflow

```
1. Data Loading & Inspection
   ↓
2. Exploratory Data Analysis
   ↓
3. Data Preprocessing
   - Handle missing values
   - Encode categorical variables
   - Scale numerical features
   ↓
4. Train-Test Split
   ↓
5. Model Selection & Training
   - Linear regression
   - Regularized regression
   ↓
6. Cross-Validation
   ↓
7. Model Evaluation (RSS, MSE, RMSE, MAE, R²)
   ↓
8. Hyperparameter Tuning (if using regularization)
   ↓
9. Final Model Selection
   ↓
10. Predictions on Test Set
```

---

## 3. Model selection guide

### 3.1. Regression-specific scenarios

| **Scenario** | **Recommended Model** | **Reason** |
|--------------|----------------------|------------|
| **Simple linear relationship** | Linear Regression | Direct, interpretable, fast |
| **Non-linear patterns** | Feature engineering + Regularization | Create polynomial/interaction features |
| **Many features, some irrelevant** | Lasso (L1) | Automatic feature selection |
| **Multicollinearity** | Ridge (L2) | Handles correlated predictors |
| **Both issues** | ElasticNet | Combines L1 and L2 benefits |
| **Small dataset** | LOOCV or K-Fold | Maximizes training data usage |
| **Large dataset** | K-Fold with holdout | Balance accuracy and computation |

### 3.2. Common supervised learning algorithms

| **Algorithm** | **Data Considerations** | **Regularization** | **Strengths** | **Weaknesses** |
|---------------|-------------------------|-------------------|---------------|----------------|
| **Linear Regression** | Remove or handle outliers; check for multicollinearity (VIF); may need feature scaling for regularized versions | Lasso (L1), Ridge (L2), ElasticNet | Simple, fast, interpretable; works well with linear relationships; provides feature importance via coefficients | Assumes linearity; sensitive to outliers; poor with non-linear patterns; affected by multicollinearity |
| **K-Nearest Neighbors** | Feature scaling required (StandardScaler, MinMaxScaler); remove irrelevant features; handle missing values | None (non-parametric) | No training phase; simple concept; naturally handles multi-class; non-parametric (no assumptions) | Slow predictions; memory intensive; sensitive to feature scaling; struggles with high dimensions (curse of dimensionality) |
| **Decision Trees** | Minimal preprocessing needed; handles missing values; no scaling required; can handle mixed data types | Pruning (max_depth, min_samples_split, min_samples_leaf) | Interpretable; handles non-linear relationships; no feature scaling needed; captures interactions | Prone to overfitting; unstable (small data changes cause big tree changes); biased toward features with more levels |
| **Support Vector Machines** | Feature scaling critical (StandardScaler); remove outliers; ensure balanced classes for classification | C parameter (controls margin), kernel parameters | Effective in high dimensions; memory efficient; works well with clear margins; robust to outliers (with proper kernel) | Slow with large datasets; sensitive to kernel choice; requires feature scaling; difficult to interpret |
| **Neural Networks** | Feature scaling required; handle missing values; may need normalization; consider data augmentation for small datasets | L1, L2, Dropout, Early stopping, Batch normalization | Highly flexible; captures complex non-linear patterns; scales well with large data; automatic feature learning | Computationally expensive; requires large datasets; black box (hard to interpret); sensitive to hyperparameters; prone to overfitting |

---

## 4. Performance metrics

### 4.1. Metric comparison

| **Metric** | **Formula** | **Units** | **Outlier Sensitivity** | **Best For** |
|------------|-------------|-----------|-------------------------|--------------|
| **RSS** | $\sum(y_i - \hat{y}_i)^2$ | Squared | High | OLS optimization |
| **MSE** | $\frac{1}{n}\sum(y_i - \hat{y}_i)^2$ | Squared | High | Penalizing large errors |
| **RMSE** | $\sqrt{\text{MSE}}$ | Same as y | High | Interpretable magnitude |
| **MAE** | $\frac{1}{n}\sum\|y_i - \hat{y}_i\|$ | Same as y | Low | Robust to outliers |
| **R²** | $1 - \frac{\text{SS}_{\text{res}}}{\text{SS}_{\text{tot}}}$ | 0 to 1 | Moderate | Variance explained |

### 4.2. When to use each metric

- **RSS**: Internal optimization for sklearn's `LinearRegression`
- **MSE**: Standard metric, emphasizes larger errors
- **RMSE**: Same units as target, easier to interpret than MSE
- **MAE**: When outliers are legitimate data points
- **R²**: Understanding model explanatory power (0 = no explanation, 1 = perfect)

**Best practice**: Report multiple metrics for comprehensive evaluation

---

## 5. Core regression techniques

These techniques are crucial for successful regression modeling with any algorithm. Proper application of regularization, cross-validation, and hyperparameter tuning significantly improves model performance and generalization across all regression methods.

### 5.1. Regularization methods

Add penalty terms to prevent overfitting and handle multicollinearity.

<table>
  <thead>
    <tr>
      <th><strong>Method</strong></th>
      <th><strong>Penalty</strong></th>
      <th><strong>Feature Selection</strong></th>
      <th><strong>Best For</strong></th>
      <th><strong>Implementation</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Lasso (L1)</strong></td>
      <td>$\alpha \sum|\beta_j|$</td>
      <td>Yes (sets coefficients to 0)</td>
      <td>Sparse models, irrelevant features</td>
      <td><a href="https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Lasso.html" target="_blank"><code>Lasso(alpha=1.0)</code></a></td>
    </tr>
    <tr>
      <td><strong>Ridge (L2)</strong></td>
      <td>$\alpha \sum \beta_j^2$</td>
      <td>No (shrinks but keeps all)</td>
      <td>Multicollinearity, all features relevant</td>
      <td><a href="https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Ridge.html" target="_blank"><code>Ridge(alpha=1.0)</code></a></td>
    </tr>
    <tr>
      <td><strong>ElasticNet</strong></td>
      <td>$\lambda_1 \sum|\beta_j| + \lambda_2 \sum \beta_j^2$</td>
      <td>Partial (some set to 0)</td>
      <td>Both multicollinearity and sparse features</td>
      <td><a href="https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.ElasticNet.html" target="_blank"><code>ElasticNet(alpha=1.0, l1_ratio=0.5)</code></a></td>
    </tr>
  </tbody>
</table>

**Key parameter**:
- **alpha (α)**: Controls regularization strength
  - Higher α → stronger penalty → simpler model
  - Lower α → weaker penalty → more complex model
  - Use cross-validation to find optimal value

**Example with cross-validation**:
```python
from sklearn.linear_model import RidgeCV

# Automatic alpha selection via cross-validation
model = RidgeCV(alphas=np.logspace(-2, 2, 100), cv=10)
model.fit(X_train, y_train)
print(f"Best alpha: {model.alpha_}")
```

### 5.2. Cross-validation

Evaluates model on multiple train-validation splits to estimate generalization performance.

**Common techniques**:
- **K-Fold**: k equal folds, each used once for validation
- **Stratified K-Fold**: Maintains class proportions (classification)
- **Leave-One-Out (LOOCV)**: k = n (very computationally expensive)
- **Repeated K-Fold**: Multiple K-Fold runs with different splits
- **Time Series Split**: Preserves temporal order

**Implementation**:
```python
from sklearn.model_selection import cross_val_score, KFold

# K-Fold cross-validation
kfold = KFold(n_splits=10, shuffle=True, random_state=42)
scores = cross_val_score(
    model, X_train, y_train, 
    cv=kfold, 
    scoring='r2'
)

print(f"Mean R²: {scores.mean():.3f} (+/- {scores.std():.3f})")
```

**Sklearn tools**: `KFold`, `StratifiedKFold`, `LeaveOneOut`, `RepeatedKFold`, `TimeSeriesSplit`, `cross_val_score()`, `cross_validate()`

### 5.3. Hyperparameter tuning

Systematically searches for optimal model parameters.

<table>
  <thead>
    <tr>
      <th><strong>Method</strong></th>
      <th><strong>Strategy</strong></th>
      <th><strong>Pros</strong></th>
      <th><strong>Cons</strong></th>
      <th><strong>Implementation</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Grid Search</strong></td>
      <td>Exhaustive search of parameter grid</td>
      <td>Guaranteed to find best in grid</td>
      <td>Computationally expensive</td>
      <td><a href="https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.GridSearchCV.html" target="_blank"><code>GridSearchCV</code></a></td>
    </tr>
    <tr>
      <td><strong>Random Search</strong></td>
      <td>Random sampling from distributions</td>
      <td>More efficient, explores wider space</td>
      <td>May miss optimal combination</td>
      <td><a href="https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.RandomizedSearchCV.html" target="_blank"><code>RandomizedSearchCV</code></a></td>
    </tr>
  </tbody>
</table>

**Example**:
```python
from sklearn.model_selection import GridSearchCV
from sklearn.linear_model import Ridge

# Define parameter grid
param_grid = {'alpha': np.logspace(-2, 2, 50)}

# Grid search with cross-validation
grid_search = GridSearchCV(
    Ridge(), 
    param_grid, 
    cv=5, 
    scoring='neg_mean_squared_error'
)
grid_search.fit(X_train, y_train)

print(f"Best alpha: {grid_search.best_params_['alpha']}")
print(f"Best score: {-grid_search.best_score_:.3f}")
```

---

## Additional resources

### Python libraries

- **[scikit-learn](https://scikit-learn.org/)**: Comprehensive ML library
  - `linear_model`: LinearRegression, Lasso, Ridge, ElasticNet
  - `model_selection`: train_test_split, cross_val_score, GridSearchCV
  - `metrics`: mean_squared_error, mean_absolute_error, r2_score
  - `pipeline`: Pipeline, ColumnTransformer
  - `preprocessing`: StandardScaler, MinMaxScaler
- **[pandas](https://pandas.pydata.org/)**: Data manipulation
- **[numpy](https://numpy.org/)**: Numerical operations
- **[matplotlib](https://matplotlib.org/)** / **[seaborn](https://seaborn.pydata.org/)**: Visualization

### Key sklearn modules

- **[sklearn.linear_model](https://scikit-learn.org/stable/modules/linear_model.html)**: All regression algorithms
- **[sklearn.model_selection](https://scikit-learn.org/stable/modules/classes.html#module-sklearn.model_selection)**: Train-test split, CV, tuning
- **[sklearn.metrics](https://scikit-learn.org/stable/modules/model_evaluation.html)**: Performance metrics
- **[sklearn.pipeline](https://scikit-learn.org/stable/modules/generated/sklearn.pipeline.Pipeline.html)**: Workflow management

### Recommended reading

- <a href="https://scikit-learn.org/stable/modules/linear_model.html" target="_blank">**Scikit-learn Linear Models Guide**</a>: Comprehensive regression documentation
- <a href="https://www.statlearning.com/" target="_blank">**"Introduction to Statistical Learning"**</a> by James, Witten, Hastie, Tibshirani
- <a href="https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/" target="_blank">**"Hands-On Machine Learning"**</a> by Aurélien Géron
