


wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.xz;
tar -xvf node-v10.16.0-linux-x64.tar.xz;
mv node-v10.16.0-linux-x64   /usr/local/nodejs
mv node-v10.16.0.0-linux-64/ nodejs;
ln -s /usr/local/nodejs/bin/npm /usr/local/bin/;
ln -s /usr/local/nodejs/bin/node /usr/local/bin/;
node -v;
npm -v;


 npm install -g vtop;
 vtop;
 