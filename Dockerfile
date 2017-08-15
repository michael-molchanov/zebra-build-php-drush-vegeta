FROM michaeltigr/zebra-build-php-drush:latest

LABEL maintainer "Michael Molchanov <mmolchanov@adyax.com>"

USER root

ENV VEGETA_VERSION v6.3.0

RUN wget -O ~/vegeta.tar.gz https://github.com/tsenart/vegeta/releases/download/${VEGETA_VERSION}/vegeta-${VEGETA_VERSION}-linux-amd64.tar.gz \
  && tar -C ~ -xzf ~/vegeta.tar.gz \
  && rm ~/vegeta.tar.gz \
  && mv ~/vegeta /usr/local/bin/vegeta

ENTRYPOINT ["/usr/local/bin/vegeta"]
