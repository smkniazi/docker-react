FROM node:alpine as builder
workdir '/app'
copy package.json . 
run npm install
copy . .
RUN npm run build

from nginx
copy --from=builder /app/build /usr/share/nginx/html

