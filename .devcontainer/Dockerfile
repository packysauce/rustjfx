# RustJFX Dev Setup for VSCode Remote Containers
FROM ubuntu:22.04

ENV GRAALVM_HOME=/usr/local/graalvm
ENV JAVA_HOME=${GRAALVM_HOME}
ENV LLVM_TOOLCHAIN=${GRAALVM_HOME}/lib/llvm

RUN apt-get update && \
    apt-get install -y curl build-essential

# Install [Sapling SCM](https://sapling-scm.com/)
RUN URL=https://github.com/facebook/sapling/releases/download/0.2.20230124-180750-hf8cd450a/sapling_0.2.20230124-180750-hf8cd450a_amd64.Ubuntu22.04.deb : && \
    curl -L ${URL} -o sapling.deb && \
    apt-get install -y ./sapling.deb && \
    rm sapling.deb

# Install rust via rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    $HOME/.cargo/bin/rustup component add rustfmt clippy

# Install GraalVM as unsafely as possible, because we're so cool
RUN GRAALVM_URL=https://github.com/graalvm/graalvm-ce-dev-builds/releases/download/23.0.0-dev-20230127_0227/graalvm-ce-java19-linux-amd64-dev.tar.gz : && \
    mkdir -p ${GRAALVM_HOME} && \
    curl -L ${GRAALVM_URL} -o - | tar -xz -C ${GRAALVM_HOME} --strip-components 1
RUN ${GRAALVM_HOME}/bin/gu install llvm-toolchain

ENV PATH="$PATH:${GRAALVM_HOME}/bin:${LLVM_TOOLCHAIN}/bin"