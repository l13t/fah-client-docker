#!/bin/bash

FAH_ARGS=""

if [ ! -z "$FOLD_USER" ]; then
  FAH_ARGS="$FAH_ARGS --user=$FOLD_USER"
else
  FAH_ARGS="$FAH_ARGS --user=Anonymous"
fi

if [ ! -z "$FOLD_PASSKEY" ]; then
  FAH_ARGS="$FAH_ARGS --passkey=$FOLD_PASSKEY"
fi

if [ ! -z "$FOLD_TEAM" ]; then
  FAH_ARGS="$FAH_ARGS --team=$FOLD_TEAM"
fi

if [ ! -z "$FOLD_HTTP_ADDRESSES" ]; then
  FAH_ARGS="$FAH_ARGS --http-addresses=$FOLD_HTTP_ADDRESSES"
else
  FAH_ARGS="$FAH_ARGS --http-addresses=127.0.0.1:7396"
fi

if [ ! -z "$FOLD_ALLOW" ]; then
  FAH_ARGS="$FAH_ARGS --allow=$FOLD_ALLOW"
else
  FAH_ARGS="$FAH_ARGS --allow=127.0.0.1"
fi

if [ ! -z "$FOLD_VERBOSITY" ]; then
  FAH_ARGS="$FAH_ARGS --verbosity=$FOLD_VERBOSITY"
fi

fah-client ${FAH_ARGS}
