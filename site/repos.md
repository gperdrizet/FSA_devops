---
layout: page
title: GitHub repos
permalink: /repos/
---

As the course progresses and projects get more complex, we will start to move away from single notebooks and rely more on GitHub repositories.

## Containerized development environments

1. **DeepLearning GPU development environment**: [`gperdrizet/deeplearning-GPU`](https://github.com/gperdrizet/deeplearning-GPU) - template for my preconfigured development environments. Set up for wide NVIDIA GPU compatibility (Pascal or later).

2. **DeepLearning CPU development environment**: [`gperdrizet/deeplearning-CPU`](https://github.com/gperdrizet/deeplearning-CPU) - this version has the same toolset and configuration, but is designed for folks without NVIDIA GPUs.

3. **Large language models hosting/development environment**: [`gperdrizet/llms-devcontainer`](https://github.com/gperdrizet/llms-devcontainer) - template repository for working on LLM applications with compatibility for GPU or CPU only. Also includes tools for local inference server hosting.


## Demos & activities

1. **Weather API demo**: [`gperdrizet/weather`](https://github.com/gperdrizet/weather) - weather data acquisition & parsing. This will probably be a data source for a future demo/activity. 

2. **Streamlit recommender app demo**: [`gperdrizet/anime-recommendations`](https://github.com/gperdrizet/anime-recommendations) - demo of content-based filtering recommender system. Deployed as Streamlit app via Render.

3. **CIFAR-10 project**: [`gperdrizet/CIFAR10`](https://github.com/gperdrizet/CIFAR10) - our in-house CNN and ResNet 50 are both hovering around 91% overall accuracy, still hoping to definitively beat ResNet over the weekend!

4. **Mask detection capstone solution**: [`gperdrizet/face-mask-detection`](https://github.com/gperdrizet/face-mask-detection) - my incremental capstone 10 solution, includes lots of data augmentation and some more advanced training techniques, final test set accuracy 99.8%. Includes live deployment of Streamlit web app via Render.

5. **YOLO26 activity**: [`gperdrizet/YOLO26`](https://github.com/gperdrizet/YOLO26) - simple Streamlit web app on Streamlit Community Cloud that does real-time object detection via your webcam. Activity prompts you to deploy the app for yourself and then extend its functionality.

6. **RNN demo/activity**: [`gperdrizet/RNNs`](https://github.com/gperdrizet/RNNs) - intro to RNNs (learning the alphabet) and NLP/GRUs (Twitter sentiment analysis), activity prompts you to improve the twitter model by implementing a hybrid CNN/RNN model.

7. **Autoencoders demo**: [`gperdrizet/autoencoders`](https://github.com/gperdrizet/autoencoders) Demonstration of convolutional autoencoder models for compression, denoising and anomaly detection with images.

8. **Distributed GANN training**: [g`perdrizet/GANNs-with-friends](https://github.com/gperdrizet/GANNs-with-friends). Distributed deep learning demo using DCGANNs to generate realistic images of faces.

9. **Encoder decoder translation models**: [`gperdrizet/language-models`](https://github.com/gperdrizet/language-models). Neural machine translation models using encoder-decoder architecture and LSTM+attention, builds up to implementation of the first transformer model.

10. **LLM applications demonstrations**: [`gperdrizet/llms-demo`](https://github.com/gperdrizet/llms-demo). Demonstrations related to building LLM based applications topics covered include hosting models for inference, prompting strategies and LangChain for application development. Also includes slides and activities.