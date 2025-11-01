FROM nginx:latest

COPY . .

WORKDIR /app

RUN node install

CMD [ "node","npm" ]
