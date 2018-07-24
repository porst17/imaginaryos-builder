# BUILD: docker build -t imaginaryos-builder .
# RUN:   docker run --rm -v $(pwd):/imaginaryos-builder --privileged=true imaginaryos-builder

FROM ubuntu:18.04


RUN apt-get update && apt-get install -y \
        nano \
	gdisk \
	dosfstools \
	grub-efi-amd64 \
	kpartx \
	&& rm -rf /var/lib/apt/lists/*

CMD /imaginaryos-builder/build.sh
