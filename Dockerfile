FROM amd64/node:16.20-alpine3.16
COPY package.json       /app/
COPY package-lock.json  /app/
COPY html-static/       /app/html-static/
COPY flows.json         /app/
COPY flows_cred.json    /app/
COPY settings.js        /app/
WORKDIR /app
RUN npm install
CMD ["sh", "-c", "exec node --max-old-space-size=384 node_modules/node-red/red.js -s ./settings.js -u ./"]