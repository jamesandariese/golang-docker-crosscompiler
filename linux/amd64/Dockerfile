FROM debian:8

ENV GOROOT=/gosrc
ENV GOPATH=/go
ENV PATH=/go/bin:/gosrc/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

RUN apt-get update && apt-get install -y git build-essential && git clone -q https://go.googlesource.com/go /gosrc && (cd /gosrc/src && git checkout -q release-branch.go1.4 && ./make.bash --dist-tool /dist) && eval $(/dist env -p || echo FAIL=true) && [ x"$FAIL" != xtrue ] && /dist bootstrap $GO_DISTFLAGS -v && "$GOTOOLDIR"/go_bootstrap clean -i std && CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH "$GOTOOLDIR"/go_bootstrap install -ccflags "$GO_CCFLAGS" -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std && CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -ccflags "$GO_CCFLAGS" -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std && rm -f "$GOTOOLDIR"/go_bootstrap && rm /dist && dpkg -P build-essential git && apt-get autoremove -y --purge && dpkg -P perl-modules debconf-i18n libtext-iconv-perl libparse-debianchangelog-perl && apt-get clean && apt-get autoremove -y --purge && rm -rf /gosrc/.git /gosrc/bin/[a-fh-z]* /var/lib/apt/lists/* && [ x"$GOOS_$GOARCH" != x"$GOHOSTOS_$GOHOSTARCH" ] && rm -rf /gosrc/pkg/"$GOHOSTOS_$GOHOSTARCH" || true

VOLUME ["/go"]

ENTRYPOINT ["/gosrc/bin/go"]
CMD ["help"]
