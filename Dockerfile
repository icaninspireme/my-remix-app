FROM node:20.17.0-alpine AS base
FROM base as deps
WORKDIR /my-remix-app
COPY package*.json ./
RUN npm install
FROM deps AS builder
WORKDIR /my-remix-app
COPY . .
RUN npm run build
FROM deps AS prod-deps
WORKDIR /my-remix-app
RUN npm install --production
FROM base as runner
WORKDIR /my-remix-app
RUN addgroup --system --gid 1001 remix
RUN adduser --system --uid 1001 remix
USER remix
COPY --from=prod-deps --chown=remix:remix /my-remix-app/package*.json ./
COPY --from=prod-deps --chown=remix:remix /my-remix-app/node_modules ./node_modules
COPY --from=builder --chown=remix:remix /my-remix-app/build ./build
COPY --from=builder --chown=remix:remix /my-remix-app/public ./public
ENTRYPOINT [ "node", "node_modules/.bin/remix-serve", "build/server/index.js"]