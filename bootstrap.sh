#!/bin/bash

# Klone das Git-Repository
echo "Cloning repository from $GIT_URL"
git clone "$GIT_URL" /app/repo

# Wechsle ins geklonte Verzeichnis
cd /app/repo || exit 1

# Installiere Abhängigkeiten
echo "Installing dependencies"
npm install --production --silent

# Starte die Anwendung
echo "Starting application with node $APP_STARTUP"
node "$APP_STARTUP"