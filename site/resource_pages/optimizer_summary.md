---
layout: page
title: Optimizers summary
permalink: /resource_pages/optimizers_summary.html
nav_exclude: true
---

This document summarizes the four optimizers compared in the Lesson 30 demo.

## Key terms

- **Gradient descent**: An optimization algorithm that iteratively adjusts model parameters in the direction that reduces the loss function, using the gradient (slope) to determine the direction of steepest descent.

- **Learning rate**: A hyperparameter that controls how much to adjust the model's parameters with each update. Too high causes overshooting; too low causes slow convergence.

- **Momentum**: A technique that accelerates gradient descent by accumulating a velocity vector from past gradients, helping the optimizer move faster through flat regions and dampen oscillations.

- **Adaptive learning rate**: A method that automatically adjusts the learning rate for each parameter individually based on the history of gradients, allowing larger updates for infrequent parameters and smaller updates for frequent ones.

## Optimizers overview

### 1. SGD (Stochastic Gradient Descent)
Vanilla gradient descent that updates parameters based on the gradient of the loss function. When `batch_size=1`, it's true stochastic gradient descent; with larger batches, it becomes mini-batch gradient descent. Simple but can be slow to converge and sensitive to learning rate choice.

### 2. SGD + Momentum
Extends vanilla SGD by accumulating a velocity vector in directions of persistent gradient descent. This helps accelerate convergence in relevant directions and dampens oscillations. A momentum value of 0.9 is commonly used.

### 3. RMSprop (Root Mean Square Propagation)
An adaptive learning rate optimizer that divides the learning rate by an exponentially decaying average of squared gradients. This allows the optimizer to use larger steps for infrequent features and smaller steps for frequent ones, making it well-suited for non-stationary objectives.

### 4. Adam (Adaptive Moment Estimation)
Combines the best of momentum and RMSprop. It computes adaptive learning rates for each parameter using estimates of both first-order moments (mean) and second-order moments (variance) of the gradients. Adam is often the default choice due to its robustness across different problems.

## Optimization techniques comparison

| Optimizer     | Momentum | Adaptive learning rate | Notes                                      |
|---------------|:--------:|:----------------------:|--------------------------------------------|
| SGD           | ❌       | ❌                     | Vanilla gradient descent                   |
| SGD + Momentum| ✅       | ❌                     | Uses velocity accumulation (e.g., 0.9)     |
| RMSprop       | ❌       | ✅                     | Per-parameter learning rate scaling        |
| Adam          | ✅       | ✅                     | Combines momentum + adaptive rates         |

## Key takeaways from the demo

1. **Batch size effect**: Smaller batch sizes provide noisier gradients but can help escape local minima; larger batches provide smoother gradients and faster per-epoch training.

2. **Momentum effect**: Momentum values around 0.9-0.95 typically work best; too high (0.99) can cause overshooting.

3. **Convergence speed**: Adam and RMSprop generally converge faster than vanilla SGD at the same learning rate.

4. **Learning rate sensitivity**: Adam and RMSprop are more robust to learning rate choice, while vanilla SGD is highly sensitive to learning rate selection.
