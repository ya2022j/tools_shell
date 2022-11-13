






















#1. 创建主机挂载配置目录
mkdir -p /root/i/docker/mongodb/data && cd /root/i/docker/mongodb;
#1
#data目录存放mongodb数据库文件，删除重启容器不会丢失
#
#2. 生成启动文件
#2.1 无账户密码，不需要认证
#cat <<EOF> start.sh
##!/bin/bash
#MONGODB_DIR=`pwd`
#docker stop mongodb
#docker rm mongodb
#docker run -d \\
#  --name mongodb \\
#  --restart always \\
#  --privileged \\
#  -p 27017:27017 \\
#  -v \${MONGODB_DIR}/data:/data/db \\
#  mongo:4.2.2
#EOF
说明：
#
#-d: 后台运行容器；
#--name: 指定容器名；
#-p: 指定服务运行的端口；
#-v: 映射目录或文件；
#--privileged 拥有真正的root权限
#--restart=always Docker服务重启容器也启动
#-e MONGO_INITDB_ROOT_USERNAME=admin 指定用户名
#-e MONGO_INITDB_ROOT_PASSWORD=admin123 指定密码
#mongod --auth ：容器默认启动命令是mongod,我们认证需要修改启动命为mongod --auth开启认证
#2.2 有账户密码，需要认证（推荐）
#3. 运行start.sh
#sh start.sh
#1
#停止和删除容器
# 启动脚本配置不同，账号密码输入也不一样
#
#  无账户密码：用户名和密码为空就能登录
#  有账户密码：账号密码是上面设置的admin/admin123
#
#docker stop mongodb && docker rm mongodb
# 查看 镜像  docker ps -a
# 启动 有mongo的镜像   docker start container id
# 5. 进入容器    docker exec -it mongo /bin/sh
#
#6. 进入mongodb
#6.1 无密码进入数据库
# 6.0 以后是使用  mongosh

# ran
#6.2 需要密码认证
#在连接期间进行身份验证，使用-u <username>，-p <password>和--authenticationDatabase <database>命令行选项启动一个mongo shell
# mongosh --port 27017 -u "admin" -p "admin123" --authenticationDatabase "admin"
#
#.3 以 admin 用户身份进入
#root@111eb14fb1e3:/# mongosh --port 27017 -u "admin" -p "admin123" --authenticationDatabase "admin"

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



sh start.sh

