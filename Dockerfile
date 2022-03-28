FROM node:alpine

RUN mkdir -p /docker-nextjs-application

WORKDIR /docker-nextjs-application

COPY package*.json yarn.lock ./

RUN yarn install --frozen-lockfile
RUN yarn build
ENV NODE_ENV production

COPY . .

EXPOSE 3000

CMD ["yarn","start"]