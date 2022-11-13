

docker-compose安装，yml文件配置
1、离线安装
https://github.com/docker/compose/releases

wget https://codeload.github.com/docker/compose/tar.gz/refs/tags/v2.12.0 -O docker-compose-2.12.0.tar.gz
tar -zxvf  docker-compose-2.12.0.tar.gz


移动文件

mv compose-2.12.0 /usr/local/bin
修改文件名
cd /usr/local/bin
mv compose-2.12.0 docker-compose
给docker-compose赋予执行权限 。默认没有执行权限。

chmod -x docker-compose
检测是否成功

docker-compose -v


https://github.com/docker/compose/releases/download/v2.12.0/docker-compose-linux-x86_64;
wget https://objects.githubusercontent.com/github-production-release-asset-2e65be/15045751/129acfd7-1a43-480c-ba7e-f92f387cced4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20221112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221112T110352Z&X-Amz-Expires=300&X-Amz-Signature=ef497ceb527c038ccae47684df4fa464984193cd19a5e990549a1f9f51cc2a54&X-Amz-SignedHeaders=host&actor_id=62124198&key_id=0&repo_id=15045751&response-content-disposition=attachment%3B%20filename%3Ddocker-compose-linux-x86_64&response-content-type=application%2Foctet-stream





cat <<EOF> start.sh
#!/bin/bash
MONGODB_DIR=`pwd`
docker stop mongodb
docker rm mongodb
docker run -d \\
  --name mongodb \\
  --restart always \\
  --privileged \\
  -p 27017:27017 \\
  -v \${MONGODB_DIR}/data:/data/db \\
  -e MONGO_INITDB_ROOT_USERNAME=admin \\
  -e MONGO_INITDB_ROOT_PASSWORD=admin123 \\
  mongo:4.2.2 mongod --auth
EOF

