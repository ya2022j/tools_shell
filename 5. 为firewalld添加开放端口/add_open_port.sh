centos7防火墙导致nginx无法访问  https://blog.csdn.net/u010301202/article/details/115805117
 


Centos7开放端口  https://blog.csdn.net/weixin_54202028/article/details/125403877

1.先查看防火墙是否开启的状态，以及开放端口的情况：

systemctl status firewalld.service(查看防火墙开启还是关闭)

sudo firewall-cmd --list-all(可以查看端口开放情况)

2.使用以下命令来开启或者关闭虚拟机的防火墙

systemctl stop firewalld.service(停止防火墙)

systemctl start firewalld.service(打开防火墙)

disable firewalld.service(关闭开机自启)

3.接下来通过以下命令开放http 8080(80) 端口：

sudo firewall-cmd --add-service=http --permanent (允许http服务)

sudo firewall-cmd --add-port=8080/tcp --permanent(打开8080端口)

注：命令末尾的–permanent表示用久有效，不加这句的话重启后刚才开放的端口就又失效了。

4.最后重启防火墙：

sudo firewall-cmd --reload (查看端口开放情况)

sudo firewall-cmd --list-all

发现 services: 出现 http 服务，ports：出现了8080/80 端口：

5.本机浏览器访问虚拟机ip地址访问成功


