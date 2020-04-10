From alpine:3.11 as build

RUN apk add --update build-base curl \
  && curl -sLO 'https://github.com/taku910/mecab/archive/master.zip' \
  && unzip master.zip \
  # install mecab
  && cd mecab-master/mecab \
  && ./configure --enable-utf8-only \
  && make \
  && make install

FROM alpine:3.11
RUN apk add --update --no-cache libstdc++ libc6-compat bash git curl openssl file make perl diffutils sudo xz
COPY --from=build /usr/local /usr/local
CMD ["/bin/bash"]
