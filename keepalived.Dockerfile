FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    keepalived \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/keepalived"]
