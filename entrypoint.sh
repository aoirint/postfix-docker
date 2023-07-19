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
  postmap /etc/postfix/vmailbox
fi

if [ -f /postfix/virtual ]; then
  cp /postfix/virtual /etc/postfix/virtual
  postmap /etc/postfix/virtual
fi

if [ -f /postfix/vdomains ]; then
  cp /postfix/vdomains /etc/postfix/vdomains
fi

if [ -f /postfix/aliases ]; then
  cp /postfix/aliases /etc/postfix/aliases
  postalias /etc/postfix/aliases
fi

if [ -f /postfix/access ]; then
  cp /postfix/access /etc/postfix/access
  postmap /etc/postfix/access
fi

exec "$@"
