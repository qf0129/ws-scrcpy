FROM node:16-alpine as builder
WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add android-tools make g++

RUN npm config set registry http://registry.npmmirror.com
RUN npm install -g node-gyp@v10.1.0
COPY . .
RUN npm install
RUN npm run dist

EXPOSE 8000
CMD ["node","dist/index.js"]