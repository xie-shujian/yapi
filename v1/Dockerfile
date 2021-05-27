ARG YAPI_ROOT_FOLDER=/yapi
ARG YAPI_APP_FOLDER=$YAPI_ROOT_FOLDER/vendors
FROM node:11-alpine as builder
RUN apk add python make
WORKDIR $YAPI_ROOT_FOLDER
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.9.2.tar.gz
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/v1/config.json
RUN tar -zxvf v1.9.2.tar.gz
RUN mv yapi-1.9.2 vendors
RUN rm -f v1.9.2.tar.gz
WORKDIR $YAPI_APP_FOLDER
RUN wget https://raw.githubusercontent.com/xie-shujian/yapi/main/v1/entrypoint.sh
RUN npm install --production

FROM node:11-alpine
LABEL maintainer="xiesj@live.com"
ENV TZ="Asia/Shanghai"
COPY --from=builder $YAPI_ROOT_FOLDER $YAPI_ROOT_FOLDER
WORKDIR $YAPI_APP_FOLDER
EXPOSE 3000
ENTRYPOINT ["sh", "entrypoint.sh"]