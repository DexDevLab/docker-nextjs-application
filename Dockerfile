FROM node:latest as dependencies
RUN mkdir -p /docker-nextjs-application
WORKDIR /docker-nextjs-application
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:latest as builder
WORKDIR /docker-nextjs-application
COPY . .
COPY --from=dependencies /docker-nextjs-application/node_modules ./node_modules
RUN yarn build

FROM node:latest as runner
WORKDIR /docker-nextjs-application
ENV NODE_ENV production
# COMENTE A LINHA ABAIXO CASO NÃO UTILIZE UM ARQUIVO NEXT.CONFIG.JS PRÓPRIO
COPY --from=builder /docker-nextjs-application/next.config.js ./

COPY --from=builder /docker-nextjs-application/public ./public
COPY --from=builder /docker-nextjs-application/.next ./.next
COPY --from=builder /docker-nextjs-application/node_modules ./node_modules
COPY --from=builder /docker-nextjs-application/package.json ./package.json

EXPOSE 3000
CMD ["yarn", "start"]