FROM node:alpine

WORKDIR /app

COPY package.json /app

RUN apk add --no-cache --virtual .build-deps make gcc g++ python \
&& npm install --production --silent \
&& apk del .build-deps \
yarn global add serve

COPY . /app

CMD ["npm", "run", "build"]
CMD ["serve", "-s", "build"]
