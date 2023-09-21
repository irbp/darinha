#!/bin/bash
docker run -v "$1:/var/rinha/source.rinha.json" -m 2g --cpus 2 darinha:1.0.0