FROM node:10

RUN npm install uilicious-cli -g

COPY ./scripts ./scripts
COPY Makefile .

ENTRYPOINT ["make"]