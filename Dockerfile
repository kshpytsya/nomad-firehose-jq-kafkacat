ARG NOMAD_FIREHOSE_VER=1.3.0
ARG BASE_IMAGE=seatgeek/nomad-firehose:v${NOMAD_FIREHOSE_VER}
ARG KAFKACAT_VER=1.3.1

###################################################################################################

FROM ${BASE_IMAGE} as build1
COPY build1.sh /tmp/build1.sh
ARG KAFKACAT_VER
RUN sh /tmp/build1.sh

###################################################################################################

FROM ${BASE_IMAGE}

COPY --from=build1  /usr/local/bin/kafkacat /usr/local/bin/kafkacat
COPY build.sh /tmp/build.sh
RUN sh /tmp/build.sh

ENTRYPOINT ["/bin/sh"]
