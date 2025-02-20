# Usa un’immagine Node come base
FROM node:14-alpine

# Imposta la cartella di lavoro
WORKDIR /app

# Copia package.json e package-lock.json (se presente) e installa le dipendenze
COPY package*.json ./
RUN npm install

# Copia tutto il resto del codice sorgente
COPY . .

# Costruisci l’app per la produzione
RUN npm run build

# Installa un server statico per servire i file buildati
RUN npm install -g serve

# Espone la porta su cui gira l’app (modifica se necessario)
EXPOSE 3000

# Comando di avvio: serve i file della cartella build
CMD ["serve", "-s", "build"]
