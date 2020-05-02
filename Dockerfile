FROM alpine:edge

RUN apk update 
RUN apk add npm 
RUN npm install -g @bitwarden/cli

WORKDIR /backup
COPY backup.sh .
RUN chmod +x backup.sh

ENTRYPOINT "./backup.sh" $EMAIL $PASSWORD
