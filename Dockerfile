# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG POSTFIX_VERSION=3.6.4-0ubuntu1

RUN <<EOF
  apt-get update

  apt-get install -y \
    "postfix=${POSTFIX_VERSION}"

  apt-get clean
  rm -rf /var/lib/apt/lists/*
EOF

ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "postfix", "start-fg" ]
