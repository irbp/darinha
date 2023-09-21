# Darinha 🚀

Welcome to the Darinha repository! This project was created as part of the [Rinha de Compiler competition](https://github.com/aripiprazole/rinha-de-compiler) 🏆, a learning experience aimed at building a simple interpreter for the Rinha language using the tree-walking technique.

## Table of Contents
- [Introduction](#introduction) 📖
  - [What is Rinha?](#what-is-rinha) ❓
  - [About this Interpreter](#about-this-interpreter) ℹ️
- [Usage](#usage) 🛠️
  - [Generating AST](#generating-ast) 🌲
  - [Running with Docker](#running-with-docker) 🐳
  - [Running without Docker](#running-without-docker) 💻

## Introduction 📖

### What is Rinha? ❓

Rinha is a unique programming language designed specifically for the Rinha de Compiler competition. It challenges participants to implement a compiler or interpreter for this language, putting their programming skills to the test.

### About this Interpreter ℹ️

This repository contains a simple interpreter for the Rinha language written in Dart. It was developed as a personal learning project and to participate in the Rinha de Compiler competition. The interpreter uses the tree-walking technique to parse and execute Rinha code.

## Usage 🛠️

### Generating AST 🌲

To generate an Abstract Syntax Tree (AST) representation of your Rinha code, you'll need to use the provided program from the [Rinha de Compiler repository](https://github.com/aripiprazole/rinha-de-compiler).

1. Clone the Rinha de Compiler repository:

```bash
git clone https://github.com/aripiprazole/rinha-de-compiler.git
```

2. Follow the instructions in the Rinha de Compiler repository to generate the AST for your Rinha code.

### Running with Docker 🐳

You can easily run the Darinha inside a Docker container without the need to install the Dart SDK. To do this, follow these steps:

1. Install Docker on your machine. If you haven't already installed Docker, you can find installation instructions [here](https://docs.docker.com/get-docker/).


2. Clone this repository to your local machine:

```bash
git clone https://github.com/irbp/darinha.git
```

3. Navigate to the project directory:
```bash
cd darinha
```


4. Build the Docker image using the following command:
```bash
docker build -t darinha:1.0.0 .
```

This will create a Docker image with the name "darinha" and version "1.0.0."

5. Run the interpreter inside a Docker container with the same machine specifications provided by the Rinha repository using the following command:
```bash
./darinha.sh ./path/to/your-ast-file.json
```

Replace `path/to/your-ast-file.json` with the path to your AST JSON file.

### Running without Docker 💻

If you prefer to run the RDarinha without Docker, you can do so by installing the Dart SDK. Follow these steps:

1. **Install the Dart SDK:** If you prefer to run the interpreter without Docker, you'll need to install the Dart SDK. You can find detailed installation instructions in the [Dart documentation](https://dart.dev/get-dart).

2. Clone this repository to your local machine:
```bash
git clone https://github.com/irbp/darinha.git
```

3. Navigate to the project directory:
```bash
cd darinha
```

4. Install the necessary dependencies:
```bash
dart pub get
```

5. You can now run the interpreter with the following command:
```bash
dart bin/main.dart path/to/your-ast-file.json
```

Replace `path/to/your-ast-file.json` with the path to your AST JSON file.