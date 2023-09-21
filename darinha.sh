#!/bin/bash
docker run -v "$1:/var/rinha/source.rinha.json" -m 2g --cpus 2 rinha:1.0.0