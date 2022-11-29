# syntax=docker/dockerfile:1.4
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG POSTFIX_VERSION=3.4.13-0ubuntu1.2

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
