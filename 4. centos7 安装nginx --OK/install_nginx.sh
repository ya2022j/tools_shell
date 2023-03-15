


cd /usr/local/src;
wget https://nginx.org/download/nginx-1.23.1.tar.gz;



tar -zxvf nginx-1.23.1.tar.gz;
cd nginx-1.23.1;
#mkdir /usr/local/ssl;
./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module;
make && make install

#启动
#/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
#
#
#或者强制停止
#
#pkill -9 nginx
#
#重启：
#
#在启动命令-c前加-t
#
#/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf
#

# 批量杀死nginx进程 ps -ef | grep nginx | grep -v grep |awk '{print $2}' |xargs kill -9

