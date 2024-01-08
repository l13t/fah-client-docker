#!/bin/bash

ARGS=""
if [ ! -z "${NODE_ADMINS}" ]; then
    ARGS="${ARGS} --admins ${NODE_ADMINS}"
else
    echo "NODE_ADMINS is not set. Exiting..."
    exit 1
fi
if [ ! -z "${NODE_DOMAINS}" ]; then
    ARGS="${ARGS} --domains ${NODE_DOMAINS}"
else
    echo "NODE_DOMAINS is not set. Exiting..."
    exit 1
fi
if [ ! -z "${NODE_GOOGLE_CLIENT_ID}" ]; then
    ARGS="${ARGS} --google-client-id ${NODE_GOOGLE_CLIENT_ID}"
else
    echo "NODE_GOOGLE_CLIENT_ID is not set. Exiting..."
    exit 1
fi
if [ ! -z "${NODE_GOOGLE_CLIENT_SECRET}" ]; then
    ARGS="${ARGS} --google-client-secret ${NODE_GOOGLE_CLIENT_SECRET}"
else
    echo "NODE_GOOGLE_CLIENT_SECRET is not set. Exiting..."
    exit 1
fi
if [ ! -z "${NODE_GOOGLE_REDIRECT_BASE}" ]; then
    ARGS="${ARGS} --google-redirect-base ${NODE_GOOGLE_REDIRECT_BASE}"
else
    echo "NODE_GOOGLE_REDIRECT_BASE is not set. Exiting..."
    exit 1
fi
if [ ! -z "${NODE_HTTP_ADDRESSES}" ]; then
    ARGS="${ARGS} --http-addresses ${NODE_HTTP_ADDRESSES} --https-addresses ${NODE_HTTP_ADDRESSES}"
else
    ARGS="${ARGS} --http-addresses 0.0.0.0:80 --https-addresses 0.0.0.0:443a"
fi

echo "Starting fah-node..."
/usr/bin/fah-node ${ARGS}
