# Golang Cross Compiler Docker Images

    docker run -v $GOPATH:/go -w "/go${PWD#$GOPATH}" jamesandariese/go-darwin-amd64:1.4.2 build -o $(basename $PWD).darwin-amd64

Build stuff for other architectures.  No matter what arch you're coming from.  As long as it's linux/amd64.  'Cause Docker.

    for o in freebsd-{amd64,386,arm} openbsd-{amd64,386} darwin-{amd64,386} netbsd-{amd64,386,arm} plan9-{amd64,386} dragonfly-{amd64,386} solaris-{amd64} linux-{amd64,386,arm};do
        alias go-$o='docker run -v $GOPATH:/go -w "/go${PWD#$GOPATH}" jamesandariese/go-'"$o"':1.4.2'
    done
