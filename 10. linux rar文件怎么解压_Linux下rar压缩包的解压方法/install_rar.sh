
wget https://www.rarlab.com/rar/rarlinux-x64-5.9.0.tar.gz;

tar xf rarlinux-x64-5.9.0.tar.gz;

cd rar/;
make && make install;





#二、压缩和解压用法
#1、压缩：rar a [不含.rar后缀的压缩包名字] [需要压缩的文件或者文件夹]
#
#2、解压：rar x [rar的压缩包]
#
#三、具体例子
#实例：将/tmp目录压缩为tmp.rar
#
#[root@localhost ~]# rar a tmp.rar /tmp
#
#将tmp.rar 解压
#
#[root@localhost ~]# rar x tmp.rar
#
#四、rar更多命令,查看帮助
#[root@localhost ~]# rar
#
