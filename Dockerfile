FROM node:lts as dependencies
WORKDIR /docker-nextjs-application
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:lts as builder
WORKDIR /docker-nextjs-application
COPY . .
COPY --from=dependencies /docker-nextjs-application/node_modules ./node_modules
RUN yarn build

FROM node:lts as runner
WORKDIR /docker-nextjs-application
# VOLUME /files
ENV NODE_ENV production
# If you are using a custom next.config.js file, uncomment this line.
COPY --from=builder /docker-nextjs-application/next.config.js ./
COPY --from=builder /docker-nextjs-application/public ./public
COPY --from=builder /docker-nextjs-application/.next ./.next
COPY --from=builder /docker-nextjs-application/node_modules ./node_modules
COPY --from=builder /docker-nextjs-application/package.json ./package.json

EXPOSE 3000
CMD ["yarn", "start"]