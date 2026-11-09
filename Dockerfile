FROM node:24.3.0
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
CMD ["node", "-e", "console.log('hello from container')"]