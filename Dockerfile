# A new stage
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build

# A new stage
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
# Default command of nginx will start the nginx for us !

