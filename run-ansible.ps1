#!/usr/bin/env pwsh

docker run -it --rm `
    -v "${PWD}:/ansible" `
    ansible-image @Args