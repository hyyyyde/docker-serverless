Serverless Framework in Docker
===

Serverlees FrameworkをDockerで。


## build

```
docker build -t XXX/XXX:version .
```

- XXX/XXXは任意のDocker Repository
- versionは任意のバージョン
  - 例）1.0.0

## run

```
docker run --rm --name serverless -v `pwd`:/usr/local/src -it XXX/XX:version bash
```

## remove

```
docker rm serverless
```
