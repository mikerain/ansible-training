ansible localhost -m command -a /usr/bin/hostname
ansible all -m command -a uptime
ansible all -m ping

ansible localhost -m copy  -a 'src=/etc/hosts dest=/tmp/hosts'


ansible all -m shell -a "ps -ef|grep httpd"

#注意下面的命令会不成功，这个会在后面讲到command 与shell的区别
ansible all -m command -a "ps -ef|grep httpd"


ansible dev -m service -a 'enabled=yes name=httpd state=started'
ansible dev -m service -a 'enabled=false name=httpd state=stopped'



#注意下面没有-m指定,会使用command模块
ansible dev -m command -a 'systemctl status httpd'

ansible dev -a 'systemctl status httpd'

ansible  dev -m setup


# 使用下面的命令查找模块
ansible-doc -l
ansible-doc service
ansible-doc  ping
ansible-doc  command
ansible-doc  file
ansible-doc  copy
ansible-doc setup
