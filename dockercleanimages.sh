#!/bin/bash
export COUNT=$(docker images | wc -l)

while [ $COUNT -gt 1 ]; do
docker rmi -f `docker images | awk NR==2{'print $3'}`
let COUNT-=1
done
