


# 3、使用 systemd 服务
  #
  #Systemd 服务是一种以 .service 结尾的单元（unit）配置文件，用于控制由 Systemd 控制或监视的进程。简单说，用于后台以守护进程（daemon）的形式运行程序。
  #
  #systmd service 文件一般放在/etc/systemd/system/文件夹中。


#
#1）创建脚本
#/home/mk_m/run_gunicorn.sh
#在/usr/bin目录下创建脚本，比如我的脚本名为/usr/bin/ruoyi-gen.sh，内容如下：

#
##!/bin/bash
#java -jar /root/xf-service/ruoyi-modules-gen-2.3.0.jar > /root/xf-service/ilogs/modules-gen-`date "+%Y-%m-%d"`.log 2>&1 &
#然后为脚本设置执行权限chmod +x /usr/bin/ruoyi-gen.sh

#2)添加服务
# chmod +x /usr/bin/run_gunicorn
#编辑/etc/systemd/system/mk_m.service
#(点 这里 了解/etc/systemd/system/与/usr/lib/systemd/system的区别)，文件名最后跟你的服务相关，比如我的叫ruoyi-gen。内容大体如下：

systmd service 文件一般放在/etc/systemd/system/文件夹中。

创建一个服务如下

//在/etc/systemd/system/下创建一个服务，如下
# vim mk_m.service

//[Unit] 区块：启动顺序与依赖关系。
[Unit]
//Description字段给出当前服务的简单描述
Description=Run a Custom Script at Startup
After=default.target

//Service区块定义如何启动当前服务
[Service]
//ExecStart字段：定义启动进程时执行的命令
ExecStart=/home/test.sh

//Install区块，定义如何安装这个配置文件，即怎样做到开机启动
[Install]
//WantedBy字段：表示该服务所在的 Target,Target的含义是服务组，表示一组服务
WantedBy=default.target


//更新服务配置文件，并使能服务
# systemctl daemon-reload
# systemctl enable ser.service

//重启系统
# reboot



然后重载系统服务文件systemctl daemon-reload。

3）服务管理

#启动
sudo systemctl start ruoyi-gen

#查看状态
sudo systemctl status ruoyi-gen

#停止服务
sudo systemctl stop ruoyi-gen

#重启服务
sudo systemctl restart ruoyi-gen

#开机自启
sudo systemctl enable ruoyi-gen