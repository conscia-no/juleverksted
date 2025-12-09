#!/bin/bash

docker run -it --rm -v $(pwd):/ansible ansible-image ansible-playbook -i hostvars.yml $@