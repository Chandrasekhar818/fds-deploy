FROM nginx:latest

WORKDIR /app

COPY . /usr/share/nginx/html

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]
