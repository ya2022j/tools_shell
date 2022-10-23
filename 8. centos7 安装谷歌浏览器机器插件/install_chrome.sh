vi /etc/yum.repos.d/google-chrome.repo


[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=0


yum  -y install google-chrome-stable


google-chrome --version

https://registry.npmmirror.com/binary.html?path=chromedriver/106.0.5249.61/

chmod +x chromedriver
# https://phantomjs.org/download.html 
将解压好的文件放在/usr/bin目录下，并且给chromedrive增加可以执行权限

