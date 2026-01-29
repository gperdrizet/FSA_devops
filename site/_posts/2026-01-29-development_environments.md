---
layout: post
title: "New development container environments"
date: 2026-01-29
categories: resources
---

Both the old tensorflow-GPU and tensorflow-CPU development containers have been updated to contain PyTorch 2.10 in addition to TensorFlow. They have been renamed to [`deeplearning-GPU`](https://github.com/gperdrizet/deeplearning-GPU) and [`deeplearning-CPU`](https://github.com/gperdrizet/deeplearning-CPU). The old containers are sill available on DockerHub so any forks of the old GitHub repos will still work, but moving forward I will be maintaining only the deeplearning versions.