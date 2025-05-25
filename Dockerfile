# Utiliser l'image officielle Node.js LTS
FROM node:18-alpine

# Définir le dossier de travail
WORKDIR /app

# Copier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install --production

# Copier le reste des fichiers
COPY . .

# Compiler l'app Nest.js (si TS)
RUN npm run build

# Exposer le port (par défaut 3000)
EXPOSE 3000

# Démarrer l'application
CMD ["node", "dist/main.js"]
