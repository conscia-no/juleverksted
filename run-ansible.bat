@echo off
docker run -it --rm -v "%cd%:/ansible" ansible-image %*