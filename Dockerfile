FROM alpine:3.11

LABEL maintainer "Michael Molchanov <mmolchanov@adyax.com>"

USER root

# Install base.
RUN apk add --update --no-cache \
  bash \
  build-base \
  bzip2 \
  curl \
  freetype \
  gzip \
  libbz2 \
  libmcrypt \
  libpq \
  libpng \
  libxml2 \
  libxslt \
  procps \
  tar \
  unzip \
  wget \
  zlib \
  && rm -rf /var/lib/apt/lists/*

# Install Vegeta
ENV VEGETA_VERSION 12.8.3
RUN curl -fsSL -o ~/vegeta.tar.gz https://github.com/tsenart/vegeta/releases/download/v${VEGETA_VERSION}/vegeta-${VEGETA_VERSION}-linux-amd64.tar.gz \
  && tar -C ~ -xzf ~/vegeta.tar.gz \
  && rm ~/vegeta.tar.gz \
  && mv ~/vegeta /usr/local/bin/vegeta

ENTRYPOINT ["/usr/local/bin/vegeta"]
