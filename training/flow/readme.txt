# ansible 2.5 +推荐使用loop,
with_items, with_file以后可能会放弃支持

ansible-playbook loop-1.yaml
ansible-playbook loop-2.yaml

#register and loop, 注册变量时也会自动加到数组里,
ansible-playbook loop-3.yaml

