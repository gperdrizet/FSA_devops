---
layout: post
title: "Kaggle requirements"
date: 2025-12-9
categories: resources
---

Added a `kaggle_requirements.txt` file for Kaggle notebooks.

You may see warnings when running on Kaggle due to inconsistencies in installed package versions between your environment and Kaggle. If you are using a virtual environment already, install this [kaggle_requirements.txt](https://github.com/gperdrizet/FSA_devops/blob/main/notebooks/unit3/lesson_20/kaggle_requirements.txt):

```
pip install --force-reinstall kaggle_requirements.txt
```

This is working for me with Python 3.12. It contains a slightly newer version of scikit-learn than is found on Kaggle. Update in the Kaggle environment by going to 'Add-ons' -> 'Install Dependencies' and adding:

```
pip install scikit-learn==1.5.2
```