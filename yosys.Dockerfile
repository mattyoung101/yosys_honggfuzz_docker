ARG IMAGE="yosys-honggfuzz/honggfuzz"

#---

FROM $IMAGE AS base

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    clang \
    lld \
    curl \
    libffi-dev \
    libreadline-dev \
    tcl-dev \
    graphviz \
    xdot \
 && apt-get autoclean && apt-get clean && apt-get -y autoremove \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists

#---

FROM base AS build

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    bison \
    flex \
    gawk \
    gcc \
    git \
    iverilog \
    pkg-config \
 && apt-get autoclean && apt-get clean && apt-get -y autoremove \
 && rm -rf /var/lib/apt/lists

WORKDIR /
RUN git clone --recursive https://github.com/YosysHQ/yosys.git
WORKDIR /yosys

# use hfuzz-clang
RUN sed -i 's/clang++/hfuzz-clang++/g' Makefile
RUN sed -i 's/ENABLE_DEBUG := 0/ENABLE_DEBUG := 1/g' Makefile

RUN make config-clang \
 && make -j$(nproc) \
 && make install

# copy corpus
COPY corpus /corpus
RUN mkdir -p /out
RUN mkdir -p /crash

# run honggfuzz
ENTRYPOINT ["/usr/local/bin/honggfuzz"]
# honggfuzz -i fuzz -t 5 -- ./yosys -s ___FILE___
CMD ["-i", "/corpus", "-t", "5", "--crashdir", "/crash", "--quiet", "--minimize", "--", "/usr/local/bin/yosys", "-s", "___FILE___"]
