ansible localhost -m command -a /usr/bin/hostname
ansible all -m command -a uptime
ansible all -m ping

ansible localhost -m copy  -a 'src=/etc/hosts dest=/tmp/hosts'


ansible all -m shell -a "ps -ef|grep httpd"

ansible all -m command -a "ps -ef|grep httpd"


ansible dev -m service -a 'enabled=yes name=httpd state=started'
ansible dev -m service -a 'enabled=false name=httpd state=stopped'



#注意下面没有-m指定,会使用command模块
ansible dev -m command -a 'systemctl status httpd'

ansible dev -a 'systemctl status httpd'



