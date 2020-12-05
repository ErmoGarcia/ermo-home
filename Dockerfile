FROM node:alpine

WORKDIR /app

COPY package.json /app

RUN apk add --no-cache --virtual .build-deps make gcc g++ python \
&& npm install --production --silent \
&& apk del .build-deps

COPY . /app

CMD ["npm", "run", "build"]

# production environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
