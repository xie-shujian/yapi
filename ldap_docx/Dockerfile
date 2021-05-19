FROM node:11.15 as builder
WORKDIR /yapi
RUN npm install -g node-gyp yapi-cli ykit
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.9.2.tar.gz
RUN tar -zxvf v1.9.2.tar.gz
RUN mv yapi-1.9.2 vendors
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap_docx/config.json
RUN yapi plugin --name yapi-plugin-export-docx-data
WORKDIR /yapi/vendors
RUN npm install --production
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/ldap_docx/entrypoint.sh
RUN wget https://raw.githubusercontent.com/inceptiongt/Yapi-plugin-export-docx-data/master/input.docx

FROM node:11.15-alpine
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
COPY --from=builder /yapi/vendors /yapi/vendors
COPY --from=builder /yapi/config.json /yapi/config.json
WORKDIR /yapi/vendors
RUN cat /yapi/config.json
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]