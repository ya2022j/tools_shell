

# 向文件中最后一行插入一条内容
# 处理转义 $
#[root@VM-4-2-centos mongodb]# vim /etc/profile
echo 'export PATH=/usr/local/mongodb/bin:$PATH'>> /etc/profile
source /etc/profile



# 批量 想最后一行插入文本

echo '#数据保存路径'  >> mongodb.conf;
echo  'dbpath=/usr/local/mongodb/data/ ' >> mongodb.conf;
echo '#日志保存路径 ' >> mongodb.conf;
echo 'logpath=/usr/local/mongodb/log/mongo.log ' >> mongodb.conf;
echo '#进程描述文件 ' >> mongodb.conf;
echo  'pidfilepath=/usr/local/mongodb/pid/mongo.pid ' >> mongodb.conf;
echo '#日志追加写入 ' >> mongodb.conf;
echo 'logappend=true ' >> mongodb.conf;
echo 'bind_ip_all=true ' >> mongodb.conf;
echo '#mongo默认端口 ' >> mongodb.conf;
echo 'port=27017 ' >> mongodb.conf;
echo '#操作日志容量 ' >> mongodb.conf;
echo 'oplogSize=10000 ' >> mongodb.conf;
echo '#开启子进程 ' >> mongodb.conf;
echo 'fork=true ' >> mongodb.conf;
echo '#需要登录认证 ' >> mongodb.conf;
echo '#auth=true ' >> mongodb.conf;




## 批量修改 文件 内容 awk处理列内容  sed 处理行内容
# 从filename 将aaa替换成cpher
sed -i 's\aaa\cypher\g' filename
sed -i 's\(git)\(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)\g' tc

#asdfa
#asdf
#ZSH_THEME="aaa"
#plugins=(git)
#fgdsaa
#
#ZSH_THEME="cypher"
#
#plugins=(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)




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