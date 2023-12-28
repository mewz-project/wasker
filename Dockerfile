FROM rust:1.74.1

WORKDIR /wasker

ARG LLVM_VERSION=15.0.0
ARG LLVM_URL=https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4.tar.xz

RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    tar \
    cmake \
    libffi-dev \
    build-essential


# install llvm    
RUN mkdir -p /usr/local/llvm
RUN wget ${LLVM_URL} -O /tmp/llvm.tar.xz
RUN tar -xvf /tmp/llvm.tar.xz -C /usr/local/llvm
RUN rm /tmp/llvm.tar.xz
ENV PATH=/usr/local/llvm/bin:$PATH
ENV LLVM_SYS_150_PREFIX=/usr/local/llvm/clang+llvm-15.0.0-x86_64-linux-gnu-rhel-8.4

CMD ["bash"]
