FROM node:18-bullseye

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    && npm install \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]