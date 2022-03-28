# FROM node:alpine as dependencies
FROM node:alpine

RUN mkdir -p /docker-nextjs-application

WORKDIR /docker-nextjs-application

COPY package*.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

EXPOSE 3000

CMD ["yarn","start"]