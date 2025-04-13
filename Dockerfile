# Utiliser une image Node officielle
FROM node:18-alpine

# Définir le dossier de travail
WORKDIR /app

# Copier les fichiers de l’app
COPY package*.json ./
RUN npm install

COPY . .

# Exposer le port 80
EXPOSE 80

# Lancer l'app
CMD ["npm", "start"]
