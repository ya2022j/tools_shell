


60.105.240.36

一、概述

这两个文件是tcpd服务器的配置文件，tcpd服务器可以控制外部IP对本机服务的访问。这两个配置文件的格式如下：

#服务进程名:主机列表:当规则匹配时可选的命令操作
server_name:hosts-list[:command]
/etc/hosts.allow控制可以访问本机的IP地址，/etc/hosts.deny控制禁止访问本机的IP。如果两个文件的配置有冲突，以/etc/hosts.deny为准。

/etc/hosts.allow和/etc/hosts.deny两个文件是控制远程访问设置的，通过他可以允许或者拒绝某个ip或者ip段的客户访问linux的某项服务。
比如SSH服务，我们通常只对管理员开放，那我们就可以禁用不必要的IP，而只开放管理员可能使用到的IP段。

二、配置

1、修改/etc/hosts.allow文件
#
# hosts.allow This file describes the names of the hosts which are
# allowed to use the local INET services, as decided
# by the ‘/usr/sbin/tcpd’ server.
#
sshd:210.13.218.*:allow
sshd:222.77.15.*:allow

all:218.24.129.110 #表示接受110这个ip的所有请求！

in.telnetd：140.116.44.0/255.255.255.0
in.telnetd：140.116.79.0/255.255.255.0
in.telnetd：140.116.141.99
in.telnetd：LOCAL
smbd:192.168.0.0/255.255.255.0 #允许192.168.0.网段的IP访问smbd服务

#sendmail:192.168.1.0/255.255.255.0
#pop3d:192.168.1.0/255.255.255.0
#swat:192.168.1.0/255.255.255.0
pptpd:all EXCEPT 192.168.0.0/255.255.255.0
httpd:all
vsftpd:all

以上写法表示允许210和222两个ip段连接sshd服务（这必然需要hosts.deny这个文件配合使用），当然:allow完全可以省略的。

ALL要害字匹配所有情况，EXCEPT匹配除了某些项之外的情况，PARANOID匹配你想控制的IP地址和它的域名不匹配时(域名伪装)的情况。