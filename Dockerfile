# Verwende einen Node.js-Image als Basis
FROM node:18-buster-slim

# Setze Arbeitsverzeichnis
WORKDIR /app

# Kopiere nur die package.json und yarn.lock in das Image, um Layer-Caching zu nutzen
COPY package.json yarn.lock ./

# Installiere die Abhängigkeiten
RUN yarn install --frozen-lockfile

# Kopiere den Rest der Backstage-App
COPY . .

# Baue die Backstage-App (TypeScript)
RUN yarn build

# Exponiere den Port, auf dem die Backstage-App läuft
EXPOSE 7000

# Starte die Backstage-App
CMD ["yarn", "start"]

