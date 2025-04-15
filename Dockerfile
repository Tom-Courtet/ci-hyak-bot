# Étape 1 : Builder avec les dépendances de build
FROM node:20-alpine AS builder

RUN apk add --no-cache \
  build-base \
  cairo-dev \
  pango-dev \
  giflib-dev \
  jpeg-dev \
  pixman-dev \
  pkgconfig

WORKDIR /app

COPY ci-hyak-bot/package*.json ./
RUN npm install --production

COPY ci-hyak-bot/ ./
RUN npm rebuild canvas

# Étape 2 : Image finale, uniquement avec les libs runtime
FROM node:20-alpine

RUN apk add --no-cache \
  cairo \
  pango \
  giflib \
  jpeg \
  pixman

WORKDIR /app

COPY --from=builder /app /app
COPY config-bot/config.json /app/config.json

CMD ["sh", "-c", "node deploy-commands.js && node index.js"]