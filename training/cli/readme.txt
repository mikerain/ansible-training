#显示ansible.cfg中可配置的参数的信息,类似ansible-doc
ansible-config list

#查看当前的ansible.cfg配置,切换到不同的目录下，会有不同的结果,因为会读取不同的ansible.cfg
ansible-config view

显示你当前的 ansible的**所有**配置,会有不同的结果,因为会读取不同的ansible.cfg
ansible-config dump


#ansible-console是Ansible为用户提供的一款交互式工具，用户可以在ansible-console虚拟出来的终端上像Shell一样使用Ansible内置的各种命令
ansible-console
cd localhost
service name=httpd state=stopped



#查看安装了哪些role
ansible-galaxy role  list

#生成一个role目录结构

ansible-galaxy role  init aaa

#install from remote or local package
ansible-galaxy  search acropia.httpd

#check galaxy server config
ansible-config dump|grep -i galaxy_server

#install role from remote or local, it will installed in : /root/.ansible/roles , or use -p to roles path
ansible-galaxy role install acropia.httpd
# then list after install
ansible-galaxy role  list


#or use tarball to install to current roles directory
ansible-galaxy  role install ansible-role-httpd-main.tar.gz -p ./roles

#uninstall the role, or just delete the directory from roles parent directory
ansible-galaxy  role remove acropia.httpd


#ansible-connection 不是命令行工具,不直接使用这个命令

#ansible-doc   帮助文档
ansible-doc file
ansible-doc copy

#ansible-inventory 显示inventory的配置
#list vars of a host
ansible-inventory    --host 127.0.0.1
ansible-inventory  --list
ansible-inventory   dev --graph

#ansible-pull  将playbook从远程仓库,pull到本地后执行，可用于大量机器的执行和分发，提高速度。一般指定在本机执行
ansible-pull -U https://github.com/vincesesto/ansible-pull-example -i hosts

#注意这里的hosts是git仓库中的hosts文件,执行的playbook是仓库根目录中的yaml

#可以配置cronjob使用
0 3 * * * ansible-pull -U https://github.com/vincesesto/ansible-pull-example -i hosts


### ansible-vault
#对文件进行加密的工具

ansible-vault create vars.yml

ansible-playbook view vars.yml
ansible-vault edit vars.yml

ansible-playbook site.yml --ask-vault-pass

#对现有文件加解密
ansible-vault encrypt vars.yml
ansible-vault decrypt vars.yml

#换口令
ansible-vault rekey vars.yml 

#分别使用以下命令,查看结果,查看/tmp/vars.yml文件内容是否可读
ansible-playbook test-vault.yaml 
ansible-playbook test-vault.yaml --ask-vault-pass
