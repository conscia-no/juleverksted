#!/bin/bash

docker run -it --rm -v $(pwd):/ansible ansible-image $@