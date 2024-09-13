# yosys-honggfuzz-docker
The plan is to run Yosys in a Docker container and fuzz it using Honggfuzz.

## Building
You need the Just command line runner.

Build the Honggfuzz image: `just honggfuzz`

Next, build the Yosys image: `just yosys`

Run: TODO

## Licence
- The corpus directory is derived from Yosys' testing suite which is under the ISC licence
- `yosys.Dockerfile` is a slightly modified Yosys Dockerfile, under the ISC licence
- `honggfuzz.Dockerfile` is a slightly modified Honggfuzz Dockerfile, under the Apache 2.0 licence

Anything else (which I think is literally `Justfile`) I release to the public domain using CC0.
