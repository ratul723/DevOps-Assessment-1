FROM node:24-alpine3.24
ENV NODE_ENV=production
WORKDIR /app
RUN apk update && apk upgrade --no-cache
COPY package*.json ./
RUN npm ci --only=production
COPY . .
USER node
EXPOSE 8080
CMD ["npm", "start"]