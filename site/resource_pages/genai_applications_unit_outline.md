---
layout: page
title: Essentials and applications of generative AI unit outline
permalink: /resource_pages/genai_applications_unit_outline.html
nav_exclude: true
---

## Lesson 44: State of the art in generative AI (LLM landscape and foundations)

**Focus:** Survey of state-of-the-art LLMs with foundational concepts for understanding and comparing models

| Topic | Purpose |
|-------|--------|
| The landscape | Open vs closed weights, licensing, text and code generation models |
| Evaluating models | Model sizes and parameters, context length, benchmarks |
| Looking ahead | Key trends (efficiency, reasoning, agents) and limitations |

**Key concepts:** Open vs closed weights, licensing, model sizes, context length, benchmarks, LLM landscape

---

## Lesson 45: Practical LLM deployment (Working with large language models)

**Focus:** How to configure, interact with, and deploy LLMs - structured as a walk through the application stack

| Topic | Purpose |
|-------|--------|
| Model layer | Decoding strategies, hyperparameters, performance optimizations |
| Inference layer | Local (direct loading, Ollama), cloud, and API deployment options; tokens and cost |
| Framework layer | Why use a framework; LangChain, LlamaIndex, Haystack, and others |
| Application layer | System prompts, message format (system/user/assistant), streaming vs batch |

**Builds on 44:** Applies foundation model knowledge to practical configuration and deployment

**Key concepts:** Application stack layers, decoding strategies, hyperparameters, deployment strategies, LLM frameworks, chat message format

---

## Lesson 46: Advanced prompt engineering techniques: Part 1 (Prompting strategies)

**Focus:** Fundamental prompting approaches for eliciting better LLM responses

| Topic | Purpose |
|-------|---------|
| Zero-shot prompting | Task completion without examples |
| Few-shot prompting | Learning from in-context examples |
| Prompt structure | Role definitions, temperature settings |
| Practical examples | Translation, classification, text analysis |

**Builds on 45:** Uses LLM APIs learned previously, focuses on prompt design

**Key concepts:** In-context learning, example-based prompting, prompt engineering fundamentals

---

## Lesson 47: Advanced prompt engineering techniques: Part 2 (Advanced reasoning)

**Focus:** Sophisticated prompting techniques for complex reasoning tasks

| Topic | Purpose |
|-------|---------|
| Chain of thought (CoT) | Step-by-step reasoning prompts |
| Self-consistency | Multiple reasoning paths, majority voting |
| Tree of thoughts (ToT) | Branching reasoning, exploration of solution space |
| Template formats | Jinja2 templates, f-strings, custom templates |
| Dynamic message generation | Programmatic prompt construction |

**Builds on 46:** Extends basic prompting to complex multi-step reasoning

**Key concepts:** Reasoning chains, multi-path exploration, dynamic prompt generation

---

## Lesson 48: LangChain for LLM application development: Part 1 (Core components)

**Focus:** Building blocks of LangChain applications

| Topic | Purpose |
|-------|---------|
| Models | Chat models, LLM wrappers, direct API calls |
| Prompts | ChatPromptTemplate, structured prompts |
| Output parsers | Structured output extraction, format control |
| Basic chains | Connecting models, prompts, and parsers |

**Builds on 47:** Formalizes prompt engineering with LangChain abstractions

**Key concepts:** Model-Prompt-Parser pipeline, LangChain component architecture

---

## Lesson 49: LangChain for LLM application development: Part 2 (Advanced patterns)

**Focus:** Retrieval, memory, and autonomous agents

| Topic | Purpose |
|-------|---------|
| Document loaders | TextLoader, PyPDFLoader for various formats |
| Text splitters | RecursiveCharacterTextSplitter for chunking |
| Embeddings | HuggingFace and OpenAI embeddings |
| Vector stores | Chroma for similarity search and persistence |
| Sequential chains | Multi-step workflows with context passing |
| Memory | Conversation history, state management |
| Agents | Autonomous tool use (llm-math, wikipedia) |
| Local LLMs | Running Falcon models locally |

**Builds on 48:** Extends basic chains to RAG, memory, and agent patterns

**Key concepts:** Retrieval-augmented generation (RAG), vector databases, autonomous agents

---

## Lesson 50: LLM fine-tuning, customization, and tool integration (Model adaptation)

**Focus:** Adapting pre-trained models and extending capabilities with tools

| Topic | Purpose |
|-------|---------|
| Data preparation | Dataset formatting, preprocessing for fine-tuning |
| Fine-tuning techniques | LoRA, QLoRA for parameter-efficient fine-tuning |
| Domain adaptation | Adapting models to specific domains (legal, medical, etc.) |
| Evaluation | Assessing fine-tuned model performance |
| Model Context Protocol (MCP) | Standardized protocol for LLM-tool communication |
| MCP servers | Building and deploying MCP servers for custom tools |
| Tool integration | Connecting LLMs to external APIs, databases, and services |
| Function calling | Structured tool use with modern LLMs |

**Builds on 49:** Extends agent capabilities with custom tools and domain-specific models

**Key concepts:** Transfer learning, parameter-efficient fine-tuning, tool integration protocols, MCP architecture

---

## Lesson 51: Advanced agents and production deployment (Capstone)

**Focus:** Complex multi-agent systems and deploying LLM applications to production

| Topic | Purpose |
|-------|---------|
| Multi-agent architectures | Coordinating multiple specialized agents |
| Agent planning | ReAct, reflection, and iterative refinement patterns |
| Agent memory systems | Long-term memory, knowledge graphs for agents |
| Evaluation frameworks | Testing agent reliability and performance |
| Production deployment | Containerization, API design, monitoring |
| Cost optimization | Caching, prompt optimization, model selection |
| Safety and alignment | Guardrails, content filtering, output validation |
| Real-world applications | Case studies of production agent systems |

**Builds on 50:** Advanced patterns building on basic agents from Lesson 49

**Key concepts:** Multi-agent coordination, production engineering, safety considerations, deployment best practices

---

## Course progression summary

**Foundation (Lesson 44):** LLM landscape, model sizes, context length, quantization, benchmarks  
↓  
**Configuration & Deployment (Lesson 45):** Decoding strategies, hyperparameters, chat vs completion, hosting options  
↓  
**Prompt Engineering (Lessons 46-47):** Zero-shot → Few-shot → CoT → ToT  
↓  
**LangChain Development (Lessons 48-49):** Core components → RAG + Agents  
↓  
**Customization & Tools (Lesson 50):** Fine-tuning, MCP servers, tool integration  
↓  
**Advanced Production (Lesson 51):** Multi-agent systems, deployment, safety

**Key pedagogical flow:** The course moves from surveying the generative AI landscape to practical LLM deployment, systematically building skills in prompting, application development, model customization, tool integration, and production deployment with advanced agent systems.
