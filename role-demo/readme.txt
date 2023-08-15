#一般方式,写一个专用的yaml
ansible-playbook httpd.yaml

#role方式,在roles中写,调用时使用roles
ansible-playbook test.yaml

#生成一个role目录结构
ansible-galaxy role init aaa
