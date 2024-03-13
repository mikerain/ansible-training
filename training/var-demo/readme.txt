#检查主机所有的变量定义
ansible-inventory --list

#检查name , age已经被 vars/vars.yaml中的定义所代替换
ansible-playbook test1.yaml

#检查结果 name, age看有什么不同
ansible-playbook test2.yaml


#setup var
ansible localhost -m setup


下面是从小到大的优先级。 大的优先级可以覆盖小的优先级。

要注意：  
第一个不是命令行-e提供的变量， -e提供的是额外的变量，是最后一个。

1. command line values (eg “-u user”)
2. role defaults [[1]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id15)
3. inventory file or script group vars [[2]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id16)
4. inventory group_vars/all [[3]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id17)
5. playbook group_vars/all [[3]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id17)
6. inventory group_vars/* [[3]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id17)
7. playbook group_vars/* [[3]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id17)
8. inventory file or script host vars [[2]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id16)
9. inventory host_vars/* [[3]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id17)
10. playbook host_vars/* [[3]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id17)
11. host facts / cached set_facts [[4]](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#id18)
12. play vars
13. play vars_prompt
14. play vars_files
15. role vars (defined in role/vars/main.yml)
16. block vars (only for tasks in block)
17. task vars (only for the task)
18. include_vars
19. set_facts / registered vars
20. role (and include_role) params
21. include params
22. extra vars (always win precedence)

#以上都是静态加载变量

#运行时收集的facts变量数据,运行下面,检查os version
ansible-playbook version2.yaml

#动态加载变量,根据os的版本不同,加载不同的变量文件,运行不同的任务

ansible-playbook  version1.yaml


ansible-playbook  version3.yaml


#registry and facts vars的读取, {{ hostvars[inventory_hostname] }}　显示所有主机的变量
ansible-playbook facts-filter.yaml 
