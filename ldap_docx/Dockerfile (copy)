FROM node:12.22.1-alpine3.12 as builder
RUN apk add --update ca-certificates curl wget cmake build-base git bash python2 make gcc g++ zlib-dev autoconf automake file nasm \
  && update-ca-certificates
WORKDIR /yapi
RUN npm install -g node-sass node-gyp yapi-cli ykit
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.9.2.tar.gz
RUN tar -zxvf v1.9.2.tar.gz
RUN mv yapi-1.9.2 vendors
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap_docx/config.json
RUN yapi plugin --name yapi-plugin-export-docx-data
WORKDIR /yapi/vendors
RUN npm install --production
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap_docx/entrypoint.sh

FROM node:12.22.1-alpine3.12
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
COPY --from=builder /yapi/config.json /yapi/config.json
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]