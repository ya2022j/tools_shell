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
mv  chromedriver  /usr/local/bin
# https://phantomjs.org/download.html 
将解压好的文件放在/usr/bin目录下，并且给chromedrive增加可以执行权限



# test script

#! -*- coding:utf-8 -*-


import re 

from selenium import webdriver


def use_selenium_headless(url):
    ch_options = webdriver.ChromeOptions()
    # 为Chrome配置无头模式
    ch_options.add_argument("--headless")
    ch_options.add_argument('--no-sandbox')
    ch_options.add_argument('--disable-gpu')
    ch_options.add_argument('--disable-dev-shm-usage')
    # 在启动浏览器时加入配置
    dr = webdriver.Chrome(options=ch_options)
    dr.get(url)

    pattern = re.compile("<title>(.*?)</title>",re.S)
    items = re.findall(pattern,dr.page_source)
    print(items)
    dr.quit()


use_selenium_headless("https://baidu.com")


