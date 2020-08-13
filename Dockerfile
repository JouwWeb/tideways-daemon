FROM debian:stable-slim

ARG TIDEWAYS_ENVIRONMENT_DEFAULT=production
ENV TIDEWAYS_ENVIRONMENT=$TIDEWAYS_ENVIRONMENT_DEFAULT

RUN apt-get update &amp;&amp; apt-get install -yq --no-install-recommends gnupg2 curl sudo ca-certificates

RUN echo 'deb http://s3-eu-west-1.amazonaws.com/tideways/packages debian main' > /etc/apt/sources.list.d/tideways.list &amp;&amp; \
    curl -sS 'https://s3-eu-west-1.amazonaws.com/tideways/packages/EEB5E8F4.gpg' | apt-key add -
RUN DEBIAN_FRONTEND=noninteractive apt-get update &amp;&amp; apt-get install -yq tideways-daemon &amp;&amp; \
    apt-get autoremove --assume-yes &amp;&amp; \
    apt-get clean &amp;&amp; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["tideways-daemon","--hostname=tideways-daemon","--address=0.0.0.0:9135"]
