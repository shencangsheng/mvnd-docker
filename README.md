# `mvnd` - the Maven Daemon Docker Image

English | [简体中文](./i18n/README.zh-cn.md)

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
docker build -t ${image_name}:${image_version} --build-arg MVND_VERSION=latest --target jdk11
```