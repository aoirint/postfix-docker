#!/bin/bash

set -eu

if [ -f /postfix/main.cf ]; then
  cp /postfix/main.cf /etc/postfix/main.cf
fi

if [ -f /postfix/master.cf ]; then
  cp /postfix/master.cf /etc/postfix/master.cf
fi

if [ -f /postfix/vmailbox ]; then
  cp /postfix/vmailbox /etc/postfix/vmailbox
fi

if [ -f /postfix/virtual ]; then
  cp /postfix/virtual /etc/postfix/virtual
fi

exec "$@"
