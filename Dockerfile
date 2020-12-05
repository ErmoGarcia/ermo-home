FROM node:alpine

WORKDIR /app

COPY package.json /app

RUN apk add --no-cache --virtual .build-deps make gcc g++ python \
&& yarn global add serve \
&& npm install --production \
&& apk del .build-deps

COPY . /app

CMD ["npm", "run", "build"]
CMD ["serve", "-s", "build"]
