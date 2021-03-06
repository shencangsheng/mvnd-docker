# `mvnd` - the Maven Daemon Docker Image

English | [简体中文](./i18n/README.zh-cn.md)

This project aims at providing faster [Maven](https://github.com/apache/maven-mvnd) builds using techniques known from Gradle and
Takari.

[ DockerHub  Repositorie ](https://hub.docker.com/r/shencangsheng/mvnd)

## Builder

### Dockerfile --build-arg

|  Key  |   Value   | Required  | Default|
|----|------|------|------|
|POSTTION|CN| N | |
|MVND_VERSION|latest/version| N | 0.7.1 |

### Dockerfile --target

* jdk8
* jdk11

```bash
docker build --target jdk11 -t ${image_name}:${image_version} --build-arg MVND_VERSION=latest .
```

## Trying

```bash
docker run --rm -v "$(pwd)":/code -v ${maven_volume}:/root/.m2 -w /code ${image_name}:${image_version} mvnd clean install
```