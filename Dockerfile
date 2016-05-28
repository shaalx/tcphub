FROM daocloud.io/library/golang:1.6.0

ENV GOPATH /app/gopath

RUN go get github.com/shurcooL/github_flavored_markdown && go get github.com/everfore/rpcsv/svr

WORKDIR /wkdir
RUN git clone --depth 1 git://github.com/shaalx/tcphub.git .
WORKDIR /wkdir
RUN go build -o svr main.go

EXPOSE 8800

CMD ["/wkdir/svr"]
