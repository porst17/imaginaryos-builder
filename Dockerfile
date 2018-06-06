# BUILD: docker build -t imaginaryos-builder .
# RUN:   docker run --rm -v $(pwd):/imaginaryos-builder --privileged=true imaginaryos-builder

FROM ubuntu:18.04


RUN apt update && apt install -y \
        nano \
	gdisk \
	dosfstools \
	&& rm -rf /var/lib/apt/lists/*

CMD /imaginaryos-builder/build.sh
