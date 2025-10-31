FROM httpd:latest

WORKDIR /app

COPY . /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd-foreground"]