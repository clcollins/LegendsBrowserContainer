FROM docker.io/openjdk:13-alpine
LABEL maintainer "Chris Collins <collins.christopher@gmail.com>"

# Legends Browser release version
ENV LB_VER="1.17.1"

ENV LB_URL="https://github.com/robertjanetzko/LegendsBrowser/releases/download/${LB_VER}/legendsbrowser-${LB_VER}.jar"

# No curl in Alpine?
RUN apk update \
      && apk upgrade \
      && apk add curl \
      && rm -rf /var/cache/apk/*

RUN curl -sSL $LB_URL -o /legendsbrowser.jar \
      && mkdir /legends \
      && chmod 0777 /legends

WORKDIR /legends

# No need to run as root
USER 1001

EXPOSE ["8080"]

# Pass the filename of the legends.xml as the CMD
ENTRYPOINT ["java", "-jar", "/legendsbrowser.jar", "--serverMode", "--port", "8080", "--world"]

