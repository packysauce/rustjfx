# RustJFX Dev Setup for VSCode Remote Containers
# Using ubuntu for dev comfort
FROM ubuntu:22.04

#ENV LC_ALL="C.UTF-8"
ENV LC="C.UTF-8"
ENV LANG="C.UTF-8"
ENV GRAALVM_HOME=/usr/local/graalvm
ENV JAVA_HOME=${GRAALVM_HOME}
ENV LLVM_TOOLCHAIN=${GRAALVM_HOME}/languages/llvm/native/bin

RUN apt update && \
  apt install -y curl ripgrep build-essential file make

# Install [Sapling SCM](https://sapling-scm.com/)
RUN URL=https://github.com/facebook/sapling/releases/download/0.2.20230124-180750-hf8cd450a/sapling_0.2.20230124-180750-hf8cd450a_amd64.Ubuntu22.04.deb : && \
  curl -L ${URL} -o sapling.deb && \
  apt install -y ./sapling.deb && \
  rm sapling.deb

# Install rust via rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
  /root/.cargo/bin/rustup component add rustfmt clippy

# Install GraalVM as unsafely as possible, because we're so cool
RUN GRAALVM_URL=https://github.com/graalvm/graalvm-ce-dev-builds/releases/download/23.0.0-dev-20230127_0227/graalvm-ce-java19-linux-amd64-dev.tar.gz : && \
  mkdir -p ${GRAALVM_HOME} && \
  curl -L ${GRAALVM_URL} -o - | tar -xz -C ${GRAALVM_HOME} --strip-components 1
RUN ${GRAALVM_HOME}/bin/gu install llvm llvm-toolchain

ENV PATH="${JAVA_HOME}/bin:${LLVM_TOOLCHAIN}:$PATH"

# install fun tools
RUN /root/.cargo/bin/cargo install cargo-make

ADD dotfiles/.bashrc /root/.bashrc
