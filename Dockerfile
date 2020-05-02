FROM node:alpine

RUN npm install -g @bitwarden/cli

WORKDIR /backup
COPY backup.sh .
RUN chmod +x backup.sh

ENTRYPOINT "./backup.sh" $EMAIL $PASSWORD
