#!/bin/sh

#
#首先更新
#1 删除本机python3，删除python3软链接
#2 安装python3相关模块
#3 制作linux服务，设置 rc.local 的 开机自动启动
#4 安装 nginx
#5 安装zsh，并修改配置文件，重启
#6 开放防火墙端口，并重启防火墙
#7 安装htop，tmux，docker等工具...


sudo yum -y update;
sudo yum  -y upgrade;
yum install -y wget git ;

#卸载python3
rpm -qa|grep python3|xargs rpm -ev --allmatches --nodeps ;

#删除所有残余文件
whereis python3 |xargs rm -frv;


rm -rf /usr/bin/python3 ;
rm -rf /usr/bin/pip3 ;






wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz;
tar -zxvf openssl-1.1.1a.tar.gz;
cd openssl-1.1.1a;

./config --prefix=/usr/local/openssl no-zlib;
make  && make install;



ln -s /usr/local/openssl/include/openssl /usr/include/openssl;
ln -s /usr/local/openssl/lib/libssl.so.1.1 /usr/local/lib64/libssl.so;
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl;

echo "/usr/local/openssl/lib" >> /etc/ld.so.conf;

ldconfig -v;
openssl version;



yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel;
yum install wget;
wget https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz;
tar -zxvf Python-3.8.1.tgz;
cd Python-3.8.1;
# 配置安装位置
./configure --prefix=/usr/local/python3 --with-openssl=/usr/local/openssl;


# 安装
make && make install;

 cd /usr/local/;


  #添加python3的软链接
ln -s /usr/local/python3/bin/python3.8 /usr/bin/python3 ;

#添加 pip3 的软链接
ln -s /usr/local/python3/bin/pip3.8 /usr/bin/pip3;




pip3  install --upgrade pip -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
pip3  install docker-compose gunicorn fabric flask flask_cors requests lxml bs4 Scrapy selenium PyMySQL lxml -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

#开启启动设置
chmod +x /etc/rc.d/rc.local;

echo  'bash /home/mk_m/run_gunicorn.sh'  >>  /etc/rc.d/rc.local


# 安装nginx


cd /usr/local/src;
wget https://nginx.org/download/nginx-1.23.1.tar.gz;



tar -zxvf nginx-1.23.1.tar.gz;
cd nginx-1.23.1;
#mkdir /usr/local/ssl;
./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module;
make && make install

#启动
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf;


# 开放防火墙端口

# (允许http服务)
sudo firewall-cmd --add-service=http --permanent;
# (打开8080端口) 80 8888 443
sudo firewall-cmd --add-port=8080/tcp --permanent;
sudo firewall-cmd --add-port=80/tcp --permanent;
sudo firewall-cmd --add-port=8888/tcp --permanent;
sudo firewall-cmd --add-port=443/tcp --permanent;
sudo firewall-cmd --reload;


# 安装配置 zsh
yum install tmux -y;
uname -r;
yum -y update;
yum remove docker  docker-common docker-selinux docker-engine;
yum install -y yum-utils device-mapper-persistent-data lvm2;

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo;


yum list docker-ce --showduplicates | sort -r;
yum -y install docker-ce-18.03.1.ce;
systemctl start docker;
systemctl enable docker;
docker  version;


 echo $SHELL;
 cat /etc/shells ;
 yum -y install zsh;
 chsh -s /bin/zsh;
 yum install -y wget git ;
 wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh;


cd ~/.oh-my-zsh/plugins;
wget http://mimosa-pudica.net/src/incr-0.2.zsh;
source incr*.zsh;


cd ~/.oh-my-zsh/plugins;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;

sed -i 's\robbyrussell\cypher\g' ~/.zshrc;
sed -i 's\(git)\(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)\g' ~/.zshrc;
source ~/.zshrc;

  wget http://hisham.hm/htop/releases/2.0.2/htop-2.0.2.tar.gz;

tar zxvf htop-2.0.2.tar.gz;
cd htop-2.0.2;

yum install gcc ncurses-devel -y;
./configure;
make && make install;
top;



