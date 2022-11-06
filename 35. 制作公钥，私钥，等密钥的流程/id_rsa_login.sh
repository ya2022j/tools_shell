# ssh-keygen产生公钥与私钥对，及密钥分发，ssh远程执行常用命令方法，和如何防止SSH登录入侵或被破解

# https://copyfuture.com/blogs-details/20210110094908527N

# 前言
  #SSH是安全的加密协议，用于远程连接Linux服务器，默认端口是22，安全协议版本是SSH2 。
  #
  #SSH原理
  #SSH(远程连接工具)连接原理：ssh服务是一个守护进程(demon)，系统后台监听客户端的连接，ssh服务端的进程名为sshd，负责实时监听客户端的请求(IP 22端口)，包括公共秘钥等交换等信息。
  #
  #ssh服务端由2部分组成： openssh(提供ssh服务)、openssl(提供加密的程序)，主要功能是提供SSH连接和作为SFTP服务器。
  #
  #ssh的客户端：包含ssh连接命令和远程拷贝scp命令等，可以用 XSHELL，Securecrt, Mobaxterm等工具进行连接。
  #
  #SSH的工作机制
  #服务器启动的时候，自己产生一个密钥(768bit公钥)，本地的ssh客户端，发送连接请求到ssh服务器，服务器检查连接点客户端发送的数据和IP地址，确认合法后，发送密钥(768bits)给客户端，此时客户端将本地私钥(256bit)，和服务器的公钥(768bit)，结合成密钥对key(1024bit)，发回给服务器端，建立连接，通过key-pair数据传输。
  #
  #SSH的加密技术
  #加密技术：传输过程，数据加密。
  #
  #SSH1没有对客户端的秘钥进行校验，很容易被植入恶意代码
  #SSH2增加了一个确认联机正确性的Diffe_Hellman机制，每次数据的传输，Server都会检查数据来源的正确性，避免黑客入侵。
  #SSH2支持RSA和DSA密钥
  #DSA:digital signature Algorithm  数字签名
  #RSA:既可以数字签名又可以加密
  #ssh-keygen产生公钥与私钥对
  #ssh-copy-id 将本机的公钥复制到远程机器的authorized_keys文件中，ssh-copy-id也能让你有到远程机器的home, ~./ssh , 和 ~/.ssh/authorized_keys的权利。

  # 第一步:在本地机器上使用ssh-keygen产生公钥私钥对

  # 1. client (windows or linux )
ssh-keygen -t rsa -b 4096

# 用cat命令查看是否生成产生公钥私钥对

ls -Rl /root/.ssh
#- id_rsa---->private key
#- id_rsa.pub---->public key

#第二步:用ssh-copy-id将公钥复制到远程机器中 (from client)
 ssh-copy-id -i /root/.ssh/id_rsa.pub  root@serverIP
 # 注意: ssh-copy-id 将key写到远程机器的 ~/ .ssh/authorized_key.文件中

 # 这里假定服务器还可以使用密码登录。当时添加公钥之后，就要修改ssh服务的配置文件。取消密码登录，只能用证书登陆
 # 并重启ssh服务
 vim /etc/ssh/sshd_config
 PasswordAuthentication no
RSAAuthentication yes
PubkeyAuthentication yes
service sshd restart

# 第三步: 登录到远程机器不用输入密码

# client : linux
ssh root@serverIP

# client : windows
ssh -i id_rsa root@serverIP

  #azdebug_it@azdebug_it:~$
  #Last login: Sun Nov 16 17:22:33 2008 from 192.168.16.16
  #常见问题：
  #
  #ssh-copy-id -u fleapx -i ~/fleapx/.ssh/id_rsa.pub ssh fleapx@192.168.16.16
  ##第一次需要密码登录
  #上述是给fleapx用户,赋予无密码登陆的权利。
  #
  #ssh-copy-id命令
  #ssh-copy-id命令可以把本地主机的公钥复制到远程主机的authorized_keys文件上，
  #ssh-copy-id命令也会给远程主机的用户主目录（home）和~/.ssh, 和~/.ssh/authorized_keys设置合适的权限。
  #
  #ssh-copy-id命令可以把本地的ssh公钥文件安装到远程主机对应的账户下的authorized_keys文件中。
  #
  #使用模式：
  #
  #ssh-copy-id [-i [identity_file]] [user@]machine
  #描述：ssh-copy-id 是一个实用ssh去登陆到远程服务器的脚本（假设使用一个登陆密码，因此，密码认证应该被激活，直到你已经清理了做了多个身份的使用）。
  #它也能够改变远程用户名的权限，如，~/.ssh和~/.ssh/authorized_keys删除群组写的权限（在其它方面，如果远程机上的sshd，在它的配置文件中是严格模式的话，这能够阻止你登陆。）。
  #
  #如果这个 “-i”选项已经给出了，然后这个认证文件（默认是~/.ssh/id_rsa.pub）被使用，不管在你的ssh-agent那里是否有任何密钥。
  #另外，命令 “ssh-add -L” 提供任何输出，它使用这个输出优先于身份认证文件。
  #
  #如果给出了参数“-i”选项，或者ssh-add不产生输出，然后它使用身份认证文件的内容。一旦它有一个或者多个指纹，它使用ssh，将这些指纹填充到远程机~/.ssh/authorized_keys文件中。
  #
  #/usr/bin/ssh-copy-id: ERROR: No identities found
  #使用选项 -i ，当没有值传递的时候，或者如果 ~/.ssh/identity.pub 文件不可访问（不存在）, ssh-copy-id 将显示上述的错误信息（ -i选项会优先使用将ssh-add -L的内容）


