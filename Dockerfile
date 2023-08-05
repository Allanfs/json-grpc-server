FROM node:18.17.0-alpine

ADD package-lock.json /app/

ADD package.json /app/

WORKDIR /app

RUN apk update && apk add python3 g++ make

RUN npm install

ADD . /app

CMD ["npm", "start"]