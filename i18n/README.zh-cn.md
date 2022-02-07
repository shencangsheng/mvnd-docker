# `mvnd` - the Maven Daemon Docker Image

简体中文 | [English](https://github.com/shencangsheng/mvnd)

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