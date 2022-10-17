gcc -v;
#如果没有安装则通过以下命令安装：
# https://www.cnblogs.com/jiangcong/p/15449452.html
yum install -y gcc;
#2.下载redis安装包并解压
# 下载，我是在root下执行的下载，所以我的下载目录为：/root/redis-6.2.6，这里按照自己的实际情况调整
wget https://download.redis.io/releases/redis-6.2.6.tar.gz;
# 解压
tar -zxvf redis-6.2.6.tar.gz;
#3.进入解压目录并编译
# 进入解压目录
cd redis-6.2.6;
# 编译
make;
#4.指定安装目录并进行安装
make install PREFIX=/usr/local/redis;


#5.2 通过守护进程方式启动
# 第一步：从 redis 的源码目录中复制 redis.conf 到 redis 的安装目录
cp /home/redis-6.2.6/redis.conf /usr/local/redis/bin/
# 第二步：修改redis.conf配置文件
#cd /usr/local/redis/bin/
#vi redis.conf
# 修改内容如下：
#daemonize 的值从 no 修改成 yes
# 第三步：启动服务
#./redis-server redis.conf
## 第四步：查看进程来确定redis是否启动成功，非必须
#ps -ef |grep redis




#6.设置开机自动启动
#切换到/lib/systemd/system/目录，创建redis.service文件。命令如下：
#
#cd /lib/systemd/system/
#vim redis.service
#文件内容如下：
#
#[Unit]
#Description=redis-server
#After=network.target
#
#[Service]
#Type=forking
## ExecStart需要按照实际情况修改成自己的地址
#ExecStart=/usr/local/redis/bin/redis-server /usr/local/redis/bin/redis.conf
#PrivateTmp=true
#
#[Install]
#WantedBy=multi-user.target
#设置开启自动启动
#
## 开机自动启动
#systemctl enable redis.service
## 启动redis服务
#systemctl start redis.service
## 查看服务状态
#systemctl status redis.service
## 停止服务
#systemctl stop redis.service
## 取消开机自动启动(卸载服务)
#systemctl disabled redis.service