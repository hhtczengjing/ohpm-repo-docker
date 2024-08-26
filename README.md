# ohpm-repo-docker

ohpm-repo docker，正式环境可以参考 [hangox/ohpm-repo](https://hub.docker.com/r/hangox/ohpm-repo) 

### 使用

从官网下载ohpm-repo，解压放在根目录。

1、编译

```
docker build -t zengjing/ohpm-repo:5.0.5.0 .
```

2、运行

```
docker run -d \
    -p 8088:8088 \
    --restart=always \
    -v ~/docker/ohpm-repo/conf:/home/ohpm/ohpm-repo/conf \
    -v ~/docker/ohpm-repo/uplink:/home/ohpm/ohpm-repo/uplink \
    -v ~/docker/ohpm-repo/logs:/home/ohpm/ohpm-repo/logs \
    -v ~/docker/ohpm-repo/storage:/home/ohpm/ohpm-repo/storage  \
    -v ~/docker/ohpm-repo/db:/home/ohpm/ohpm-repo/db  \
    -e TZ=Asia/Shanghai \
    --name ohpm-repo \
    zengjing/ohpm-repo:5.0.5.0
```

3、使用 docker-compose

```
docker-compose up --build -d
docker-compose down
```

> ohpm-repo 首次启动时，默认创建一个管理员账号，账号名称：admin，密码：12345Qq! , 该账号在首次登录时，需要修改其密码，请修改密码后，重新登录该账号。