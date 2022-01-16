FROM node:14-alpine as build

ADD . /app/
WORKDIR /app

RUN npm install
RUN npm run build

FROM node:14-alpine

COPY --from=build /app /app

WORKDIR /app

VOLUME /app/backup

EXPOSE 3000

CMD npm run start
