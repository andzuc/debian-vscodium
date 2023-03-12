#!/bin/bash
VERSION="${1:-latest}"
BASEFROM="${2:-andzuc/debian-base}"
tar -C context -cf - . \
    |docker build \
	    --build-arg "BASEFROM=${BASEFROM}" \
	    --build-arg "VERSION=${VERSION}" \
	    --progress=plain \
	    -t "andzuc/debian-vscodium:${VERSION}" \
	    -
