FROM node:18-alpine

WORKDIR /app

# Copier package.json et package-lock.json
COPY package*.json ./

# Installer uniquement les dépendances de production
RUN npm install --production

# Copier les fichiers compilés (dist) et autres nécessaires
COPY dist ./dist

COPY build ./build

EXPOSE 3000

CMD ["node", "dist/main.js"]
