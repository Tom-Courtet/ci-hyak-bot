FROM node:18-alpine

WORKDIR /app

# Copiez directement les fichiers du repo (plutôt que de cloner)
COPY package.json .
COPY package-lock.json .
RUN npm install

COPY . .

# On rend le script executable
RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]