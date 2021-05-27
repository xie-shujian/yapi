FROM node:11.15-alpine as builder
RUN apk add python make
WORKDIR /yapi
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.9.2.tar.gz
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap/config.json
RUN tar -zxvf v1.9.2.tar.gz
RUN mv yapi-1.9.2 vendors
RUN rm -f v1.9.2.tar.gz
WORKDIR /yapi/vendors
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap/entrypoint.sh
RUN npm install --production

FROM node:11.15-alpine
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
COPY --from=builder /yapi /yapi
WORKDIR /yapi/vendors
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]