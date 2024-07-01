FROM node:16-alpine as builder
WORKDIR '/app'
COPY /heroes-frontend/package.json ./heroes-frontend
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html