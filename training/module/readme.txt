#分别运行以下三个playbook,demo 基本serice的启动,不合理的restarted启动,和使用notify的启动的用途,配合修改files/httpd.conf文件使用

ansible-playbook service1.yml  #不需要重启 
ansible-playbook service2.yml  #使用started,修改httpd.conf无法重启.使用restarted,每次都重启,不合理.
ansible-playbook service3.yml  #文件修改才重启

#yum install loop
ansible-playbook yum1.yml
ansible-playbook yum2.yml

#下面的性能最好,4使用了列表变量
ansible-playbook yum3.yml
ansible-playbook yum4.yml



#file and tags, conditional
ansible-playbook file1.yml  #单一功能的建立
ansible-playbook file2.yml -e path=/tmp/abc  #变量复用的建立
ansible-playbook file3.yml  #单一功能的删除

ansible-playbook file4.yml -e path=/tmp/abc #全部功能,但是全部执行,所以不可用

ansible-playbook file5-tags.yml  -e path=/tmp/abc --tags dir  #使用tags,区分不同功能的用途, 
ansible-playbook file5-tags.yml  -e path=/tmp/abc --tags file
ansible-playbook file5-tags.yml  -e path=/tmp/abc --tags remove
ansible-playbook file5-tags.yml  -e path=/tmp/abc  #不执行


#lineinfile 

# remove line
ansible-playbook line1.yml -e line=xxxx -e op=remove

#add line
ansible-playbook line1.yml -e line=SELINUX=disable -e op=add

#replace line
ansible-playbook line1.yml -e line=SELINUX=Enforce -e match_line='^SELINUX=' -e op=replace


#add in first line
 ansible-playbook line1.yml -e line=222 -e op=BOF

#add in last line
 ansible-playbook line1.yml -e line=333 -e op=EOF

#cannot add duplicated line
 ansible-playbook line1.yml -e line=333 -e op=BOF


#blockinfile

#增加行
 ansible-playbook line2-block.yml -e op=add

ansible-playbook line2-block.yml -e op=add -e block="aaa\nbbb\nccc"

#修改marker就可以重复加


#remove 以下都可以,但一般只对default 的marker有效,自定义的marker测试经常失效
ansible-playbook line2-block.yml -e op=remove
ansible-playbook line2-block.yml -e op=removeblock


#blockinfile使用比较复杂,替换操作不支持,不如lineinflie

#lineinfile多行的实现
#多行时可加重复行
ansible-playbook line3-loop.yml -e lines="444\n555" -e op=add
ansible-playbook line3-loop.yml -e lines="444\n555" -e op=add

#参数为单行时不能加重复行
ansible-playbook line3-loop.yml -e lines="444" -e op=add


#删除多行可以使用
ansible-playbook line3-loop.yml -e removelines=[444,555] -e op=remove


#check mode,检查文件中是否包括某行,当未找到时任务设为失败
ansible-playbook line4-check.yaml -e line=333
ansible-playbook line4-check.yaml -e line=555



#command模块为默认模块，用于远程执行命令（命令模块）

注意：使用command模块在远程主机中执行命令时，不会经过远程主机的shell处理，在使用command模块时，如果需要执行的命令中含比如”<“, “>”, “|”, “;” 和 “&” 这些符号时，这些符号的功能也会失效

常用参数：

chdir：此参数表示执行命令之前，会先进入到指定的目录中

creates：此参数表示文件如果存在于远程主机中，则不执行对应命令，如果不存在，才执行

removes：此参数表示文件如果不存在于远程主机中，则不执行对应命令，如果存在 ，才执行

command模块示例：

 #chdir参数表示执行命令之前，会先进入到指定的目录中
 ansible bastion -m command -a 'chdir=/root/ ls'  
 
 #creates参数表示如果/文件存在于远程主机中，则不执行对应命令，如果不存在，才执行”touch”命令
 ansible bastion -m command -a 'creates=/tmp/abc touch /tmp/abc' 
 
 #removes参数表示如果/opt/abc文件不存在，就不执行“mv”命令，如果文件存在则执行“mv”命令
 ansible bastion -m command -a 'removes=/opt/abc mv /opt/abc /root/'


# 看下面的命令能否成功
 ansible bastion -m command -a 'chdir=/root/ ls|grep awx'  
 ansible bastion -m command -a 'chdir=/root/ ls>log.txt'  
 ansible bastion -m command -a 'ls /root'     
 ansible bastion -m command -a 'ls /root;ls / '  


shell 模块
shell 模块，远程执行命令模块，和command模块类似，区别在于shell模块通过/bin/bash程序处理命令
支持以下操作
 ansible bastion -m shell -a 'chdir=/root/ ls|grep awx'  
 ansible bastion -m shell -a 'chdir=/root/ ls>log.txt'  
 ansible bastion -m shell -a 'ls /root;ls / '  


script 模块
script 模块用于远程执行脚本，脚本存放在ansible主机本地，不需要拷贝到远程主机

#运行一下
 ansible-playbook command.yml
 ansible-playbook shell.yml

 ansible-playbook script.yml

#modify script, 加入失败的test.sh任务，查看 运行结果
 ansible-playbook script.yml


fetch文件到本地/tmp/dns/，收集各主机文件，再进行二次处理，

使用两台主机测试
#运行以下，注意只在本地运行的任务，注意此任务如果有多个主机时，文件会覆盖
ansible-playbook  fetch1.yml

#运行以下，文件名加个主机地址
ansible-playbook  fetch2.yml
ansible-playbook  fetch2.yml



在使用参数为flat的时候，如果dest的后缀名为/，那么就会保存在目录中，然后直接保存为文件名；当dest后缀不为/的时候，那么就会直接保存文件，如上例所示。

主要是在于dest是否已/结尾，从而来区分这是个目录还是路径。


copy文件 到远程 ，强制保持 所有主机文件的一致性

#分别使用src和cotent作为copy的内容 , check /tmp/resolv.conf
 ansible-playbook copy1.yml
 ansible-playbook copy2.yml


template,可以使用变量，解决copy或file中不容易解决的部分内容差异问题

#hosts中自动加入本机的主机名,检查/tmp/hosts
 ansible-playbook template1.yml

# httpd.conf中的port根据各主机中配置的HTTP_PORT的变量有所不同, check /tmp/httpd.conf
 ansible-playbook template2.yml

