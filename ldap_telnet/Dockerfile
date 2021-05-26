FROM node:11.15-alpine as builder
RUN apk add python make
WORKDIR /yapi
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.9.2.tar.gz
RUN tar -zxvf v1.9.2.tar.gz
RUN mv yapi-1.9.2 vendors
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap/config.json
WORKDIR /yapi/vendors
RUN npm install --production
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap/entrypoint.sh

FROM node:11.15-alpine
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
COPY --from=builder /yapi/config.json /yapi/config.json
RUN apk add curl busybox-extras
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]