# Inspired by https://github.com/mumoshu/dcind
FROM alpine:3.18.2
LABEL maintainer="Ibrahim Soliman <Emalinuxawy@gmail.com>"

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

RUN curl -SL https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
