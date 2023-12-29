FROM mcr.microsoft.com/devcontainers/rust:1-1-bookworm

RUN apt-get update && apt-get install -y cmake

ARG LLVM_URL=https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4.tar.xz

# install llvm
RUN mkdir -p /usr/local/llvm \
    && wget ${LLVM_URL} -O /tmp/llvm.tar.xz \
    && tar -xvf /tmp/llvm.tar.xz -C /usr/local/llvm \
    && rm /tmp/llvm.tar.xz

ENV PATH=/usr/local/llvm/bin:$PATH
ENV LLVM_SYS_150_PREFIX=/usr/local/llvm/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4
