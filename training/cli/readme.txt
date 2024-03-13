#显示ansible.cfg中可配置的参数的信息,类似ansible-doc
ansible-config list

#查看当前的ansible.cfg配置,切换到不同的目录下，会有不同的结果,因为会读取不同的ansible.cfg
ansible-config view

显示你当前的 ansible的**所有**配置,会有不同的结果,因为会读取不同的ansible.cfg
ansible-config dump


#如何根据帮助设置配置
#查看以下，知道 forks,要写在[defaults]
ansible-config list |grep -B5 forks
  name: Force handlers to run after failure
  type: boolean
  version_added: 1.9.1
DEFAULT_FORKS:
  default: 5
  description: Maximum number of forks Ansible will use to execute tasks on target
    hosts.
  env:
  - name: ANSIBLE_FORKS
  ini:
  - key: forks
    section: defaults
  name: Number of task forks

#在ansible.cfg中写入
[defaults]
forks=3

#然后查看ansible-config dump|grep forks是否修改了



#ansible-console是Ansible为用户提供的一款交互式工具，用户可以在ansible-console虚拟出来的终端上像Shell一样使用Ansible内置的各种命令
ansible-console
cd localhost
service name=httpd state=stopped

#[f:5] 代表fork有5个
#(2)代表有2个主机

#查看安装了哪些role
ansible-galaxy role  list

#可用来生成一个role目录结构

ansible-galaxy role  init aaa

#search from remote or local package
ansible-galaxy  search httpd

#check galaxy server config
ansible-config dump|grep -i galaxy_server

#install role from remote or local, it will installed in : /root/.ansible/roles , or use -p to roles path  
#willl failed use remote install
ansible-galaxy role install acropia.httpd

# then list after install
ansible-galaxy role  list


#or use tarball to install to current roles directory
ansible-galaxy  role install ansible-role-httpd-main.tar.gz -p ./roles
ansible-galaxy role  list -p ./roles

#uninstall the role, or just delete the directory from roles parent directory
#ansible-galaxy  role remove acropia.httpd
ansible-galaxy role remove ansible-role-httpd-main.tar.gz -p ./roles

#ansible-connection 不是命令行工具,不直接使用这个命令

#ansible-doc   帮助文档
ansible-doc file
ansible-doc copy

#ansible-inventory 显示inventory的配置
#list vars of a host
ansible-inventory    --host 127.0.0.1
ansible-inventory  --list
ansible-inventory   dev --graph

#ansible-pull  将playbook从远程仓库,pull到本地后执行，可用于大量机器的执行和分发，提高速度。一般指定在本机执行。
#尤其要分发的文件较大时，如果使用ansible方式分发，会造成大流量和ansible主机速度的影响，用此pull方式性能较好。

ansible-pull -U https://github.com/vincesesto/ansible-pull-example -i hosts

##注意这里的hosts是git仓库中的hosts文件,执行的playbook是仓库根目录中的yaml

#执行后，可到　/root/.ansible/pull 查看


#可以配置cronjob使用
0 3 * * * ansible-pull -U https://github.com/vincesesto/ansible-pull-example -i hosts


### ansible-vault
#对文件进行加密的工具

rm vars.yaml
ansible-vault create vars.yml

ansible-vault view vars.yml
ansible-vault edit vars.yml

ansible-playbook test-vault.yaml --ask-vault-pass
#执行后，查看/tmp/vars.yaml  的内容为正常内容

#对现有文件加解密
ansible-vault encrypt vars.yml
ansible-vault decrypt vars.yml

#换口令
ansible-vault rekey vars.yml 

#分别使用以下命令,查看结果,查看/tmp/vars.yml文件内容是否可读
ansible-playbook test-vault.yaml #可执行正常文件
ansible-playbook test-vault.yaml --ask-vault-pass　　#可执行encrypted 文件
