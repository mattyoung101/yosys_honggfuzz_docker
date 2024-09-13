honggfuzz:
    docker build -f honggfuzz.Dockerfile -t "yosys-honggfuzz/honggfuzz" .

yosys:
    docker build -f yosys.Dockerfile -t "yosys-honggfuzz/yosys" .
