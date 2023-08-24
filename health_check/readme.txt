

#修改输出excel的配置 group_vars/all 文件
result_dir

#检查全部
 ansible-playbook health_check.yml 

#只检查部分
ansible-playbook health_check.yml -e hc_list='["cpu","mem"]'

#日志输出在/temp/q

写一个check1.yaml,固定检查和 check2.yaml, 参数检查

ansible-playbook check1.yaml 
ansible-playbook check2.yaml -e hc_list='["cpu","mem"]'


#注意写excel的主机,使用ansible时,使用localhost可以运行,如果迁移到awx上,要修改为awx的的实际IP， 而且要在对应的inventory中添加这个awx的IP
- name: export to excel file
  hosts: localhost # 10.72.93.134

自定义的模块,如果需要在awx安装pip package,不一定能安装成功,因为是在docker中运行的实例,需要在社区中查找方案;或者使用url模块,在其他主机上回写,而不是使用自定义模块
在tower中可以正常安装pip package.
