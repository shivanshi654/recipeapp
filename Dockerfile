FROM ubuntu:latest
RUN apt-get update && \
    apt-get upgrade -y
RUN apt install nodejs -y && \
    apt install npm -y
WORKDIR ./
COPY package.json package-lock.json ./
RUN npm install
COPY src/ ./src
COPY public/ ./public
EXPOSE 3000
