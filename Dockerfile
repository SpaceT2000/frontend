FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm config set registry https://registry.npmmirror.com
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


