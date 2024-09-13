# yosys-honggfuzz-docker
Scripts to run Yosys in a Docker container and fuzz it using [Honggfuzz](https://github.com/google/honggfuzz).

## Building
You need the [Just](https://just.systems/) command line runner.

Build Honggfuzz base and Yosys images: `just build`

Create the container: `just create`

Get a shell into the container: `just run`

Once in the container, start fuzzing by running `./fuzz.sh`

(NOTE this is super hacky, especially the shell in the container part, and will be fixed in future).

## TODO
- Improve workflow, make it easier to automatically run and export crashes from the container
    - Shell is currently required because honggfuzz doesn't seem to print properly when running outside a
    shell
- Make scripts less ugly
- Try using AFL++ and LibFuzzer
- Persistent fuzzing by mounting `/corpus`, `/out` and `/crashes` as a volume
- Minimise corpus using `honggfuzz --minimize` first
- Limit container disk usage (storage quota)

## Licence
- The corpus directory is derived from Yosys' testing suite which is under the ISC licence
- `yosys.Dockerfile` is a slightly modified Yosys Dockerfile, under the ISC licence
- `honggfuzz.Dockerfile` is a slightly modified Honggfuzz Dockerfile, under the Apache 2.0 licence

Anything else (which I think is literally `Justfile`) I release to the public domain using CC0.
