

# 都建议使用 16.15.0 版本，别用最新和最新稳定的版本 
wget https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.xz;
tar -xvf node-v16.15.0-linux-x64.tar.xz;
mv node-v16.15.0-linux-x64   /usr/local/nodejs
mv node-v16.15.0-linux-64/ nodejs;
ln -s /usr/local/nodejs/bin/npm /usr/local/bin/;
ln -s /usr/local/nodejs/bin/node /usr/local/bin/;
node -v;
npm -v;

# install vue-cli 
 npm config set registry https://registry.npm.taobao.org;
  npm config get registry;
   npm install -g @vue/cli;
    ln -s /opt/nodejs/bin/vue /usr/bin/vue;
     echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc;
     source ~/.zshrc;
      npm config set prefix /usr/local;
       npm install -g @vue/cli;
         vue -V;
 

 npm install -g vtop;
 vtop;
 
