# `mvnd` - the Maven Daemon Docker Image

简体中文 | [English](https://github.com/shencangsheng/mvnd)

[ DockerHub 仓库 ](https://hub.docker.com/r/shencangsheng/mvnd)

这个项目的目标是使用Gradle和Takari所知的技术提供更快的[Maven](https://github.com/apache/maven-mvnd)构建。

## Builder

### Dockerfile --build-arg

|  键  |   值   | 必填  | 默认值|
|----|------|------|------|
|POSTTION|CN| 否 | |
|MVND_VERSION|latest/version| 否 | 0.7.1 |

### Dockerfile --target

* jdk8
* jdk11

```bash
docker build -t ${image_name}:${image_version} --build-arg MVND_VERSION=latest --target jdk11
```

## 尝试使用

```bash
docker run --rm -v "$(pwd)":/code -v ${maven_volume}:/root/.m2 -w /code ${image_name}:${image_version} mvnd clean install
```