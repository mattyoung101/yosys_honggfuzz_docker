# yosys-honggfuzz-docker
Scripts to run Yosys in a Docker container and fuzz it using [Honggfuzz](https://github.com/google/honggfuzz).

## Building
You need the [Just](https://just.systems/) command line runner.

Build Honggfuzz base and Yosys images: `just build`

Run: `just run`

Extract crashes: TODO

## Licence
- The corpus directory is derived from Yosys' testing suite which is under the ISC licence
- `yosys.Dockerfile` is a slightly modified Yosys Dockerfile, under the ISC licence
- `honggfuzz.Dockerfile` is a slightly modified Honggfuzz Dockerfile, under the Apache 2.0 licence

Anything else (which I think is literally `Justfile`) I release to the public domain using CC0.
