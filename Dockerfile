FROM node:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install bash
RUN bash && \
yarn global add create-react-app && \
create-react-app src && \
cd src && \
chown node:node -R . && \
yarn install 
WORKDIR src