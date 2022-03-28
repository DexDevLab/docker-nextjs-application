# FROM node:alpine as dependencies
FROM node:alpine

RUN mkdir -p /docker-nextjs-application

WORKDIR /docker-nextjs-application

# COPY package*.json yarn.lock ./
COPY package*.json yarn.lock /docker-nextjs-application/

RUN yarn install --frozen-lockfile

# COPY . .
COPY . /docker-nextjs-application/

EXPOSE 3000
CMD ["yarn","start"]