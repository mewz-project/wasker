FROM rust:1.88.0-bookworm AS builder

ARG LLVM_VERSION=15.0.0
ARG LLVM_URL=https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4.tar.xz

WORKDIR /wasker

COPY . .

# install dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    tar \
    cmake \
    libffi-dev \
    build-essential \
    xz-utils \
    cmake

# install llvm
RUN mkdir -p /usr/local/llvm \
    && wget ${LLVM_URL} -O /tmp/llvm.tar.xz \
    && tar -xvf /tmp/llvm.tar.xz -C /usr/local/llvm \
    && rm /tmp/llvm.tar.xz

ENV PATH=/usr/local/llvm/bin:$PATH
ENV LLVM_SYS_150_PREFIX=/usr/local/llvm/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4

RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /work

COPY --from=builder /wasker/target/release/wasker /usr/bin/wasker
COPY --from=builder /usr/local/llvm /usr/local/llvm

# install dependencies
RUN apt-get update && apt-get install -y \
    libffi-dev \
    build-essential \
    libc6 \
    libstdc++6
    

ENV PATH=/usr/local/llvm/bin:$PATH
ENV LLVM_SYS_150_PREFIX=/usr/local/llvm/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4

ENTRYPOINT ["wasker"]
