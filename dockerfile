FROM nginx:latest

COPY . /usr/share/nginx/html

COPY . /index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
