




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
