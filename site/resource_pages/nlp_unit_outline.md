---
layout: page
title: Natural language processing unit outline
permalink: /resource_pages/nlp_unit_outline.html
nav_exclude: true
---

## Lesson 38: Text data analysis (foundation)

**Focus:** Getting text ready for ML - preprocessing and exploration

| Topic | Purpose |
|-------|---------|
| Text preprocessing | Tokenization, normalization, stemming, lemmatization, stopword removal |
| Data exploration | Word frequency, distributions, word clouds |
| Basic classification | Naive Bayes text classification (no deep learning) |
| Rule-based sentiment | TextBlob, VADER (lexicon-based, not learned embeddings) |

**Key concepts:** Cleaning and understanding text data before vectorization

---

## Lesson 39: Text vectorization (sparse to dense intro)

**Focus:** Converting text to numbers - from simple to sophisticated

| Topic | Purpose |
|-------|---------|
| One-hot encoding | Simplest representation, limitations (sparsity) |
| Bag-of-Words | Word counts, introduces CountVectorizer |
| TF-IDF | Weighted importance, better than raw counts |
| Word2Vec intro | Concept of dense embeddings, training basics |

**Builds on 38:** Uses preprocessed text as input

**Key concepts:** Progression from sparse to dense representations

---

## Lesson 40: Distributed representations (embeddings in practice)

**Focus:** Using and extending word embeddings

| Topic | Purpose |
|-------|---------|
| Pre-trained Word2Vec | Loading Google News vectors, similarity |
| Document vectors | Averaging word embeddings for documents |
| Doc2Vec | Learning document-level embeddings directly |

**Builds on 39:** Applies Word2Vec concept at scale

**Key concepts:** Pre-trained embeddings, word-to-document extension

---

## Lesson 41: Machine translation and document search

**Focus:** Applying embeddings to sequence tasks

| Topic | Purpose |
|-------|---------|
| Sequence preprocessing | Padding, sequencing for neural networks |
| Encoder-decoder intro | Basic seq2seq architecture |
| Translation task | English-French with LSTM |

**Builds on 40:** Uses embeddings as input to sequence models

**Key concepts:** Sequence-to-sequence architecture, encoder-decoder pattern

---

## Lesson 42: Sequence models

**Focus:** RNN architectures for sequences

| Topic | Purpose |
|-------|---------|
| RNN fundamentals | Recurrent connections, vanishing gradients |
| LSTM | Gates, memory cells |
| Bi-directional RNNs | Context from both directions |

**Builds on 41:** Deeper dive into the LSTM used in encoder-decoder

**Key concepts:** Recurrence, memory, handling variable-length sequences

---

## Lesson 43: Attention mechanism (Transformers and BERT)

**Focus:** Modern architectures that replaced RNNs

| Topic | Purpose |
|-------|---------|
| Attention concept | Why attention improves seq2seq |
| Transformer architecture | Self-attention, positional encoding |
| Pre-trained transformers | BERT, GPT - contextual embeddings |
| Fine-tuning | Classification with transformers |

**Builds on 42:** Attention solves RNN limitations

**Key concepts:** Self-attention, positional encoding, transfer learning with transformers
