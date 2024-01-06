# FROM node:21-alpine as builder
FROM node:21-alpine

WORKDIR /app

RUN apk add --no-cache git && \
    chown node:node /app

USER node
RUN git clone https://github.com/FoldingAtHome/fah-web-client-bastet.git . && \
    npm install && \
    npm run build
RUN sed -i 's/"dev": "vite"/"dev": "vite --host --port 3000"/' package.json

CMD ["npm", "run", "dev"]
EXPOSE 5173
