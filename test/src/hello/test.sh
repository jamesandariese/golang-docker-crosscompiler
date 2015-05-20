#!/bin/sh

export GOPATH=../..

for o in windows-{amd64,386} freebsd-{amd64,386,arm} openbsd-{amd64,386} darwin-{amd64,386} netbsd-{amd64,386,arm} plan9-{amd64,386} dragonfly-{amd64,386} solaris-{amd64} linux-{amd64,386,arm};do
    alias go-$o='docker run -v $GOPATH:/go -w "/go${PWD#$GOPATH}" jamesandariese/go-'$o':1.4.2'
done

go-linux-amd64 build -o hello.darwin-amd64
go-darwin-amd64 build -o hello.darwin-amd64
go-windows-amd64 build -o hello.amd64.exe
go-windows-386 build -o hello.exe
