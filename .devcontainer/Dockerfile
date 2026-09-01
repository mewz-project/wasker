FROM mcr.microsoft.com/devcontainers/rust:1-1-bookworm

RUN apt-get update && apt-get install -y cmake libzstd-dev libxml2-dev

ARG LLVM_URL=https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.8/LLVM-22.1.8-Linux-X64.tar.xz

# install llvm
RUN mkdir -p /usr/local/llvm \
    && wget ${LLVM_URL} -O /tmp/llvm.tar.xz \
    && tar -xvf /tmp/llvm.tar.xz -C /usr/local/llvm \
    && rm /tmp/llvm.tar.xz

ENV PATH=/usr/local/llvm/LLVM-22.1.8-Linux-X64/bin:$PATH
ENV LLVM_SYS_221_PREFIX=/usr/local/llvm/LLVM-22.1.8-Linux-X64
