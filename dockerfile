FROM node:latest

WORKDIR /app

COPY ..

CMD ["node","npm"]
