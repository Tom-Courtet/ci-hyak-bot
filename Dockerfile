FROM node:18-alpine

WORKDIR /app

# Copiez seulement package.json d'abord
COPY package.json .

# Installez les dépendances sans lockfile
RUN npm install

# Copiez le reste des fichiers
COPY . .

RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]