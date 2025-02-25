FROM node:alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production

FROM node:alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
EXPOSE 3000

CMD ["node", "src/index.js"]
