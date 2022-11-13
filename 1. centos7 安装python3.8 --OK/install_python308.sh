




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


pip3 install --upgrade pip;

# 安装之后要修改yum 的配置

#
#配置yum
#安装python3改完软链接以后发现yum命令报错了，yum是依赖python2.7的，你把python改成了3.8了，所以报错了。
#
#可以修改yum里对python2的依赖即可。虽然安装了python3但是系统里python2依旧还在系统里，可以通过python2来指定用python2.7的命令，首先来看下python2的命令在哪里
#
#[root@localhost ~]# which python2
#/usr/bin/python2
#1
#2
#可以cd到/usr/bin目录下 通过ls -alh|grep python查看python命令的详细情况。
#
#[root@localhost bin]# ls -alh|grep python
#1
#
#可以看到python软连接是执行的python3命令，python2是执行的python2.7的命令
#
#vi /usr/libexec/urlgrabber-ext-down
#1
#修改对python的依赖，修改成python2或python2.7都可以。
#
#
#vi /usr/bin/yum


# WARNING: Retrying (Retry(total=0, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError("Can't connect to HTTPS URL because the SSL module is not available.")': /simple/pip/
## 以上问题的对策，换镜像 ，豆瓣的

pip3  install --upgrade pip -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
pip3  install docker-compose -i http://pypi.douban.com/simple --trusted-host pypi.douban.com