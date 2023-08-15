

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

