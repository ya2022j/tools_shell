# 在shell 中嵌套expect
  #注意：前面有-EOF
  #使用expect -c的嵌套调用:



#!/bin/sh
#timeout= 10
#
#
#
#cmd_run_py = " /usr/local/python3/bin/python3.8  /home/mk_m/update_json_forServer/update_ms_svg_jp_Server.py;"
#
#expect -c "
#    set timeout ${timeout}
#    spawn ${command_ssh}
##    expect \"»\"
#    send ${cmd_run_py}
#    send "touch file{1..10}"
#    exit 0


#
#
#$ip=
#
/usr/bin/expect <<-EOF

set timeout 20

spawn ssh root@ip
expect \"»\"

send "touch file{1..10}"
expect eof
EOF




