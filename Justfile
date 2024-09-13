honggfuzz:
    docker build -f honggfuzz.Dockerfile -t "yosys-honggfuzz/honggfuzz" .

yosys:
    docker build -f yosys.Dockerfile -t "yosys-honggfuzz/yosys" .

build: honggfuzz yosys

run:
    docker run --name yosys_honggfuzz yosys-honggfuzz/yosys:latest
