---
layout: page
title: Tensorflow set-up
permalink: /devops_pages/tensorflow.html
nav_exclude: true
---

# Tensorflow setup

For class, I will 'officially' support three methods (but feel free to use something else if you prefer):

1. Vocareum (easy, no set-up, no GPU)
2. Google CoLab or Kaggle notebooks (easy, no set-up, limited free GPU)
3. Local using Docker with a custom NVIDIA/Tensorflow container (needs set-up, for folks with their own GPU or otherwise wanting to try running locally)

## 1. Vocareum

Vocareum is pre-installed with Tensorflow 2.13 on Python 3.10.

## 2. Google CoLab/Kaggle notebooks

Both work out-of-the box with pre-configured environments.

### 2.1. CoLab:

- GPU: T4 16GB
- NVIDIA driver: 550
- CUDA: 12.5
- Python 3.12
- Tensorflow 2.19

```text
$ nvidia-smi

Wed Jan 21 16:49:12 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 550.54.15              Driver Version: 550.54.15      CUDA Version: 12.4     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  Tesla T4                       Off |   00000000:00:04.0 Off |                    0 |
| N/A   40C    P8              9W /   70W |       0MiB /  15360MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
```

**Note:** `nvidia-smi` reports the maximum CUDA version supported by the installed NVIDIA driver, not the currently installed CUDA version.

```text
$ nvcc --version

nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Thu_Jun__6_02:18:23_PDT_2024
Cuda compilation tools, release 12.5, V12.5.82
Build cuda_12.5.r12.5/compiler.34385749_0
```

Some Google magic here?...

### 2.2. Kaggle

- GPU: P100 16GB or 2x T4 16GB
- NVIDIA driver: 570
- CUDA: 12.5
- Python: 3.12
- Tensorflow: 2.19

```text
$ nvidia-smi

Wed Jan 21 16:45:48 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 570.172.08             Driver Version: 570.172.08     CUDA Version: 12.8     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  Tesla P100-PCIE-16GB           Off |   00000000:00:04.0 Off |                    0 |
| N/A   33C    P0             27W /  250W |       0MiB /  16384MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
```

**Note:** `nvidia-smi` reports the maximum CUDA version supported by the installed NVIDIA driver, not the currently installed CUDA version.

```text
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Thu_Jun__6_02:18:23_PDT_2024
Cuda compilation tools, release 12.5, V12.5.82
Build cuda_12.5.r12.5/compiler.34385749_0
```

## 3. Local Docker/VS Code

Here is the link to the GitHub repo that will walk you through setting up docker and using the devcontainer: [gperdrizet/tensorflow-GPU](https://github.com/gperdrizet/tensorflow-GPU#).

Target is NVIDIA TensorFlow release 24.06 container. This gets us:

- CUDA: 12.5
- Python: 3.10
- TensorFlow: 2.16

This is a far back as we can reasonably go with the goal of supporting as many GPUs as possible. Any further and we loose TensorFlow 2.16, and therefore Keras 3 default. This configuration should support Pascal cards with driver 545 and later.

**Note**: While this is an officially supported configuration, it is considered legacy and won't receive updates.

Here it is running on my machine with a GTX1070 and a Tesla P100 (both Pascal cards) working beautifully:

```text
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.82.07              Driver Version: 580.82.07      CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  Tesla P100-PCIE-16GB           On  |   00000000:03:00.0 Off |                    0 |
| N/A   24C    P0             27W /  250W |       6MiB /  16384MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
|   1  NVIDIA GeForce GTX 1070        On  |   00000000:04:00.0  On |                  N/A |
| 10%   53C    P0             31W /  151W |    1135MiB /   8192MiB |     11%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
```

**Note:** `nvidia-smi` reports the maximum CUDA version supported by the installed NVIDIA driver, not the currently installed CUDA version.


```text
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Wed_Apr_17_19:19:55_PDT_2024
Cuda compilation tools, release 12.5, V12.5.40
Build cuda_12.5.r12.5/compiler.34177558_0
```
