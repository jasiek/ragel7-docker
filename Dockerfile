FROM alpine:latest
LABEL maintainer "jan.szumiec@gmail.com"
RUN apk update
RUN apk add git make libtool gcc g++ autoconf automake curl asciidoc
RUN mkdir /app
WORKDIR /app
# Install colm, a dependency
RUN curl http://www.colm.net/files/colm/colm-0.13.0.5.tar.gz | tar -zxf -
WORKDIR /app/colm-0.13.0.5
RUN ./configure
RUN make && make install
# Install ragel
WORKDIR /app
RUN curl http://www.colm.net/files/ragel/ragel-7.0.0.10.tar.gz | tar -zxf -
WORKDIR /app/ragel-7.0.0.10
RUN ./configure
RUN make && make install
RUN mkdir /work
WORKDIR /work

