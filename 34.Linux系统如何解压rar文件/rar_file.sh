
wget -P /mnt/rar_test  https://www.rarlab.com/rar/rarlinux-x64-612.tar.gz;
cd /mnt/rar_test ;
tar -xzvf rarlinux-x64-612.tar.gz;
cd rar;

make;
make install;

# 三、rar 命令用法介绍
  ######1.将/test目录 压缩成 test.rar 包:
  #
  #rar a test.rar  /test
  #1
  ######2. 将test.rar 包解压:
  #
  #unrar e test.rar

# 二、压缩和解压用法
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
  #-----------------------------------
  #©著作权归作者所有：来自51CTO博客作者tom_jk的原创作品，请联系作者获取转载授权，否则将追究法律责任
  #Linux下rar解压方法
  #https://blog.51cto.com/chinak/5481961