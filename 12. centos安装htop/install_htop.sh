


  wget http://hisham.hm/htop/releases/2.0.2/htop-2.0.2.tar.gz;

tar zxvf htop-2.0.2.tar.gz;
cd htop-2.0.2;

yum install gcc ncurses-devel -y;
./configure;
make && make install;
top;



