default:
    @just --list

honggfuzz:
    docker build -f honggfuzz.Dockerfile -t "yosys-honggfuzz/honggfuzz" .

yosys:
    docker build -f yosys.Dockerfile -t "yosys-honggfuzz/yosys" .

build: honggfuzz yosys

#docker run -it --name yosys_honggfuzz --entrypoint bash yosys-honggfuzz/yosys:latest

run:
    docker start yosys_honggfuzz
    docker exec -it yosys_honggfuzz bash

create:
    docker container create --name yosys_honggfuzz yosys-honggfuzz/yosys:latest

