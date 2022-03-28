FROM node:alpine

RUN mkdir -p /docker-nextjs-application

WORKDIR /docker-nextjs-application

COPY package*.json yarn.lock ./

COPY . .

RUN yarn install --frozen-lockfile
ENV NODE_ENV production
RUN yarn build

EXPOSE 3000

CMD ["yarn","start"]