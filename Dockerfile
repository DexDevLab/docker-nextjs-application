FROM node:alpine

RUN mkdir -p /docker-nextjs-application

WORKDIR /docker-nextjs-application

COPY package*.json yarn.lock ./

ENV NODE_ENV production

COPY . .

RUN yarn install --frozen-lockfile
RUN yarn build

EXPOSE 3000

CMD ["yarn","start"]