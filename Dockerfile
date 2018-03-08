FROM node:8.9-slim

EXPOSE 3000

ENV DEBIAN_FRONTEND=noninteractive PROJECT_ROOT=/opt/app BUILD_CACHE=/opt/app-cache

ADD . /opt/temp

WORKDIR $PROJECT_ROOT

RUN chmod +x /opt/temp/bin/* && \
    /opt/temp/bin/provide.sh && \
    rm -Rf /opt/temp
    
