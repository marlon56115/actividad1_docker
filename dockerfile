FROM debian:stable-slim
LABEL nombre="Marlon Wilfredo Guerra Ramirez"
LABEL carnet="gr18045"
RUN apt update && apt upgrade -y && \
    apt install git -y && \
    apt install nginx -y &&\
    apt install curl -y &&\
    curl -sL https://deb.nodesource.com/setup_14.x |  bash &&\
    apt-get install -y nodejs  &&\
    npm install --global yarn &&\
    yarn global add @quasar/cli &&\
    git clone "https://github.com/diseno2021/expedientemedico" /home/diseno2021 &&\
    cd /home/diseno2021 && \
    git checkout v1.0 &&\
    npm install && \
    quasar build && \
    cp -r /home/diseno2021/dist/spa/*  /var/www/html 
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80



