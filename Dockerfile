# Base the image on the official Rust one
FROM rust:1.49-slim

# Install curl for the wasm-pack installation
RUN apt-get -yqq update;		\
  apt-get -yqq install curl

# Install wasm-pack and its target architecture wasm32-unknown-unknown
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

# Install cargo-generate using cargo
RUN apt-get -yqq install pkg-config libssl-dev git;	\
  cargo install cargo-generate;

# Install Node.js
RUN apt-get -yqq install gnupg;									\
  curl -sL https://deb.nodesource.com/setup_14.x | bash -;	\
  apt-get install -yqq nodejs

# Install Rollup
RUN npm i -g rollup;

# Prepare the repo path
RUN mkdir -p /repo

# Set the working directory to the repo path (mount using -v)
WORKDIR /repo
