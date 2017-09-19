#!/bin/bash
docker run -it -p 9000:9000 -p 3483:3483 -v ~/Music/Squeezebox\ Music/:/music -v /private/var/squeezebox:/squeezebox jbenlinlee/squeezebox-docker
