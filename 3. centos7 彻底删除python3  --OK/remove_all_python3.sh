
#卸载python3
rpm -qa|grep python3|xargs rpm -ev --allmatches --nodeps ;

#删除所有残余文件
whereis python3 |xargs rm -frv;

#查看现有安装的python，验证是否删除干净
whereis python ;
