# imaginaryos-builder

These script are supposed to build IMAGINARY.OS inside a Docker container.

## Build instructions

### Clone the repository

Clone the repository
```
$ git clone https://github.com/porst17/imaginaryos-builder.git
```
and `cd` into it:
```
cd imaginaryos-builder
```

### Build the docker image
```
$ docker build -t imaginaryos-builder .
```

### Build the IMAGINARY.OS disk image
```
$ docker run --rm -v $(pwd):/imaginaryos-builder --privileged=true imaginaryos-builder
```
will create the disk image in `./build/imaginaryos.img`.
