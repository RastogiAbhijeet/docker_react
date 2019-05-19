# A new stage
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build

# A new stage
FROM nginx 
EXPOSE 80
# when elastic beans stalk will fire up this container it will see this file and know that it need to expose the machine port to the container port
# but for general user it will basically do nothing
COPY --from=builder /app/build /usr/share/nginx/html
# Default command of nginx will start the nginx for us !

