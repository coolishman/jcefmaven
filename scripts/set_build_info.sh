#!/bin/bash

if [ ! $# -eq 1 ]
  then
    echo "Usage: ./set_build_info.sh <build_meta_url>"
    echo ""
    echo "build_meta_url: The url to download build_meta.json from"
    exit 1
fi

#Print build meta location
echo "Initializing for build from $1..."

#Download build_meta.json and import to local environment
export $(curl -s -L $1 | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]")

#Set JOGL information
export jogl_build=v2.4.0-rc-20210111
export jogl_download=https://jogamp.org/deployment/$jogl_build/jar #Without terminating /!

#Set jcefmaven information
export mvn_version=v1.0.0

