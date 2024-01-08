#!/bin/bash

if [ ! -z $(ls /etc/fah-node/config.xml) ] && [ "${CONFIG_RECREATE}" == "false" ]; then
    echo "There is already config file. Starting..."
else
    echo "Generating config file..."
    generate_config()
fi
