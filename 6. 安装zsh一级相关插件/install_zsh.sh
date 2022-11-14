


# https://blog.csdn.net/qierkang/article/details/85941316
 echo $SHELL;
 cat /etc/shells ;
 yum -y install zsh;
 chsh -s /bin/zsh;
 yum install -y wget git ;
 wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh;


cd ~/.oh-my-zsh/plugins;
wget http://mimosa-pudica.net/src/incr-0.2.zsh;
source incr*.zsh;


cd ~/.oh-my-zsh/plugins;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;

sed -i 's\robbyrussell\cypher\g' ~/.zshrc;
sed -i 's\(git)\(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)\g' ~/.zshrc;
source ~/.zshrc;
# vim ~/.zshrc
# ZSH_THEME="cypher"
# plugins=(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)


#在目录 ~/.oh-my-zsh/plugins中默认存在了大量插件，只要添加到配置项中即可。
#
#更新配置后使用source ~/.zshrc命令重新加载配置
#
#安装常用的history插件
#
#这个插件需要单独下载
#
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#1
#下载后在配置文件的 plugins 选项的最后面添加即可
#
#plugins=(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)
