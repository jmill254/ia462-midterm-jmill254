#!/bin/bash

docker run -d --name midterm-hardened -p 5000:5000 --read-only --tmpfs /tmp --cap-drop ALL --security-opt no-new-privileges:true --security-opt seccomp=section3/seccomp-profile.json ia462-midterm:v1