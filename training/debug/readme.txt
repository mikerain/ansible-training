
# 以下两个参数的用法 
ignore_errors: false
ignore_unreachable: false


#判断os and os version , to be done
ansible_os_family
#只处理RHEL8的例子
ansible-playbook condition.yaml


#同时判断RHEL和ubuntu的例子
ansible-playbook condition2.yaml
#注意是否有skipping

ansible-playbook  fail1.yaml  #有失败任务,就会失败
echo $?  #非0

ansible-playbook  fail2.yaml  #0 全部忽略,成功
echo $?

ansible-playbook  fail3.yaml  #有不可过主机就会失败
echo $? $非0


#主动检查后,判断是否失败,ignore_errors: false

ansible-playbook fail4.yaml

#使用failed_when
ansible-playbook fail5.yaml -e key=xyz
ansible-playbook fail5.yaml -e key=root

#使用rescue,用于回滚和补救场景,当前面任务失败后会触发rescue
ansible-playbook rescue1.yaml  #不用rescue, task成功，不会触发rescue
ansible-playbook rescue2.yaml  #触发rescue, task失败，会触发


#debug 一个v就是一个verbosity
#不执行第 2个debug
ansible-playbook debug.yaml 

#执行第2个debug 
ansible-playbook debug.yaml  -vv
ansible-playbook debug.yaml  -vvv


