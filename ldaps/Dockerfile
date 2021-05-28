FROM node:11.15-alpine as builder
RUN apk add python make
WORKDIR /yapi
RUN wget https://github.com/xie-shujian/yapi-1/archive/refs/tags/1.9.2.1.tar.gz
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldaps/config.json
RUN tar -zxvf 1.9.2.1.tar.gz
RUN mv yapi-1-1.9.2.1 vendors
RUN rm -f 1.9.2.1.tar.gz
WORKDIR /yapi/vendors
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldaps/entrypoint.sh
RUN npm install --production

FROM node:11.15-alpine
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
COPY --from=builder /yapi /yapi
WORKDIR /yapi/vendors
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]