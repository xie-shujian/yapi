FROM node:11.15-alpine as builder
RUN apk add python make git g++
WORKDIR /yapi
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.9.2.tar.gz
RUN tar -zxvf v1.9.2.tar.gz
RUN mv yapi-1.9.2 vendors
RUN npm install -g node-gyp webpack yapi-cli ykit
RUN cp /yapi/vendors/config_example.json config.json
RUN yapi plugin --name yapi-plugin-oauth2
RUN yapi plugin --name yapi-plugin-export-docx-data
RUN wget https://raw.githubusercontent.com/inceptiongt/Yapi-plugin-export-docx-data/master/input.docx -O /yapi/vendors/input.docx
WORKDIR /yapi/vendors
RUN npm install --production
RUN wget https://raw.githubusercontent.com/xie-shujian/k3s/main/yapi/entrypoint.sh

FROM node:11.15-alpine
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
COPY --from=builder /yapi/config.json /yapi/config.json
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]
