#显示inventory配置
more inventory

ansible all --list-hosts
ansible-inventory --list


ansible -i ../inventory all --list-hosts

ansible-inventory -i ../inventory   --list


#显示当前的ansible.cfg配置

#切换不同的目录执行以下命令,会显示不同的配置
ansible --version

#打开此配置,使用其他用户(root/qxu)执行下面命令看能否成功,注意这个配置的影响
ansible 127.0.0.1 -m ping

[defaults]
remote_user = root

[privilege_escalation]

#使用非root(qxu)用户执行以下,看能否成功,打开提权配置后再执行,可分别找开或comment ansible.cfg和playbook中的配置，
＃两个使用一个就可以，两个配置都可以生效，
ansible-playbook test-privilege.yaml



#test gather_facts,
#修改ansible.cfg 
#gatering=explict

#modify playbook ping.yaml
gather_facts=false

#多次运行,查看速度
ansible-playbook ping.yaml


#connection的配置,modify inventory,本机修改为local(非ssh方式)
127.0.0.1 ansible_connection=local

#查看运行速度,与不是local方式的对比,
ansible-playbook ping.yaml


#指定部分主机运行

ansible-playbook --limit london ping.yaml

ansible dev -m ping

#以下命令不能运行,要加上--limit,因为这是playbook, 和adhoc的命令　ansible dev -m ping有所不同。
ansible-playbook london ping.yaml
