#!/bin/bash


for f in darwin/* dragonfly/* freebsd/* linux/386 linux/amd64 linux/arm netbsd/* openbsd/* plan9/* solaris/*;do 

cat Dockerfile.in | sed -e "s/_GOOS_/${f%/*}/" -e "s/_GOARCH_/${f#*/}/" > $f/Dockerfile

done

#cat Dockerfile.linux-amd64 > linux/amd64/Dockerfile
