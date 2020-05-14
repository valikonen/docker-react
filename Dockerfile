# build phase
FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase based from nginx and build pahse
FROM nginx
# copy from build folder in react, dist in andular to nginx server, this will run autamatically
COPY --from=builder /app/build /usr/share/nginx/html
