# Inspired by https://github.com/mumoshu/dcind
FROM alpine:3.18.2
LABEL maintainer="Dmitry Matrosov <amidos@amidos.me>"
LABEL maintainer="Ibrahim Soliman <Emalinuxawy@gmail.com>"

ENV DOCKER_VERSION=23.0.6

# Install Docker and Docker Compose
RUN apk add --no-cache \
    bash \
    build-base \
    ca-certificates \
    curl \
    gcc \
    git \
    libc-dev \
    libffi-dev \
    libgcc \
    make \
    musl-dev \
    openssl \
    openssl-dev \
    zlib-dev \
    util-linux \
    device-mapper \
    clang \
    docker \
    file \
    findutils \
    protoc \
    protobuf-dev \
    rm -rf /root/.cache

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
