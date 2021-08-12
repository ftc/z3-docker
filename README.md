Z3 Docker Container
===================

A few scripts to run (the Z3 theorem prover)[https://github.com/Z3Prover/z3] using docker.

Run `buildDocker.sh` to build the docker container. It will be named "z3".

The `z3Docker.sh` script will mount the current working directory and call z3 on the arguments passed to it.

For example, to run test.z3:

```
./z3Docker.sh test.z3
```
