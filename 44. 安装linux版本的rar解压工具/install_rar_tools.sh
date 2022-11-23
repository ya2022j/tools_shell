wget https://www.rarlab.com/rar/rarlinux-x64-620b2.tar.gz  --no-check-certificate;

tar xvzf rarlinux-x64-620b2.tar.gz;
#3、编译安装
#
#进入解压后的rar文件夹，执行make命令

cd rar;
make;


# unrar: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.21' not found (required by unrar)


#4、使用rar命令解压压缩文件
#
#rar x dist.rar
#5、 压缩文件命令
#
#rar a etc.rar /etc
#压缩当前目录下所有文件

#rar a test.rar ./*
#6、 unrar命令 – 解压提取RAR压缩文件
#unrar命令来自于英文词组“unzip rar”的缩写，其功能是用于解压提取RAR压缩文件。
#
#语法格式：unrar [参数] 压缩包
#
#常用参数：
#参数	说明
#e	将文件解压缩到当前目录
#l	列出存档内容
#p	将文件打印到标准输出
#t	测试存档文件
#v	详细列出存档
#x	使用完整路径提取文件
#参考实例
#以完整路径解压指定压缩包文件：
#
#[root@linuxcool ~]# unrar x Filename.rar
#查看指定压缩包内的文件信息：
#
#[root@linuxcool ~]# unrar l Filename.rar
#测试指定压缩包内文件是否损坏，能够正常解压：
#
#[root@linuxcool ~]# unrar t Filename.rar
#解压指定压缩包内的文件到当前工作目录：
#
#[root@linuxcool ~]# unrar e Filename.rar