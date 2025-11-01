FROM nginx:1.29.3-alpine

COPY . .

WORKDIR /app

RUN node install

CMD [ "node","npm" ]
