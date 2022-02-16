FROM alpine:3.15.0

LABEL maintainer="https://github.com/shencangsheng/mvnd"

ARG POSTTION

RUN if [[ "${POSTTION}" = "CN" ]] ; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories ; \
    fi

RUN apk update \
    && apk upgrade \
    && apk add --no-cache wget unzip curl

ARG MVND_VERSION=0.7.1

ARG MVND_DOWNLOAD_URL=https://github.com/apache/maven-mvnd/releases/download/${MVND_VERSION}/mvnd-${MVND_VERSION}-linux-amd64.zip

RUN if [[ "$MVND_VERSION" = "latest" ]]; then \
    curl -fsSL -o mvnd.zip `wget -qO- -t1 -T2 "https://api.github.com/repos/apache/maven-mvnd/releases/latest" | grep "browser_download_url" | grep 'linux-amd64.zip"' | head -n 1 | awk -F ': "' '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'` ; \
    else \
    curl -fsSL -o mvnd.zip ${MVND_DOWNLOAD_URL} ; \
    fi

RUN mkdir -p /tmp/zip \
    && unzip mvnd.zip -d /tmp/zip \
    && mv /tmp/zip/`ls /tmp/zip | head -n 1` /tmp/mvnd

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/zip

FROM openjdk:8-jdk as jdk8

COPY --from=0 /tmp/mvnd /usr/local/mvnd

ENV MVND_HOME=/usr/local/mvnd

ENV PATH=.:$MVND_HOME/bin:$PATH

CMD ["mvnd"]

FROM openjdk:11-jdk as jdk11

COPY --from=0 /tmp/mvnd /usr/local/mvnd

ENV MVND_HOME=/usr/local/mvnd

ENV PATH=.:$MVND_HOME/bin:$PATH

CMD ["mvnd"]