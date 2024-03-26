#!/usr/bin/env python

import json
import time
import re
from pprint import pprint

def get_user_passwd_info():
    f = open('/etc/passwd')
    user_list = []
    passwd_info_dict = {}
    user_info_key = ['name', 'passwd', 'uid', 'gid', 'desc', 'homedir', 'shell']
    for line in f.readlines():
        line = re.sub(' +',' ',line)
        user_info_value = line.split(':')
        user = user_info_value[0]
        user_list.append(user)
        passwd_info_dict[user] = dict(zip(user_info_key, user_info_value))
    return passwd_info_dict

def get_user_shadow_info():
    f = open('/etc/shadow')
    user_list = []
    shadow_info_list = []
    shadow_info_dict = {}
    shadow_info_key = [
            'name',
            'shadow_pw',
            'last_change_time',
            'min_interval_time',
            'max_interval_time',
            'warning_time',
            'inactivity_time',
            'become_invalid_time'
            ]
    for line in f.readlines():
        line = re.sub(' +',' ',line)
        shadow_info_value = line.split(":")
        user = shadow_info_value[0]
        user_list.append(user)
        shadow_info_list = shadow_info_value[1:]
        shadow_info_dict[user] = dict(zip(shadow_info_key, shadow_info_value))
        _last_change_time = shadow_info_dict[user]['last_change_time']
        if _last_change_time:
            dalta_time = int(_last_change_time)*86400
            struct_time = time.localtime(dalta_time)
            last_change_time = time.strftime("%Y/%m/%d", struct_time)
            shadow_info_dict[user]['last_change_time']  = last_change_time
    return shadow_info_dict

def add_nologin_type(user_dict):
    nologin_type_dict = {}
    for user in user_dict.keys():
        nologin_type = ""
        if "nologin" in user_dict[user]["shell"]:
            nologin_type = "True"
        else:
            nologin_type = "False"
        nologin_type_dict[user] = {"is_nologin": nologin_type}

    return _merge_dict(user_dict, nologin_type_dict)


def add_privileged_type(user_dict):
    privileged_type_dict = {}
    for user in user_dict.keys():
        privileged_type = ""
        if user_dict[user]["uid"] == "0":
            privileged_type = "True"
        else:
            privileged_type = "False"
        privileged_type_dict[user] = {"is_privileged": privileged_type}
    return _merge_dict(user_dict, privileged_type_dict)


def add_classification_type(user_dict):
    classification_type_dict = {}
    for user in user_dict.keys():
        classification_type = ""
        if int(user_dict[user]["uid"]) < 1000:
            classification_type = "System User"
        else:
            classification_type = "Normal User"
        classification_type_dict[user] = {"user_type":classification_type}
    return _merge_dict(user_dict, classification_type_dict)

def add_encryption_mode(user_dict):
    encryption_mode_dict = {}
    for user in user_dict.keys():
        encryption_mode = ""
        if user_dict[user]["shadow_pw"].startswith("$6$"):
            encryption_mode = "SHA-512"
        elif user_dict[user]["shadow_pw"].startswith("$1$"):
            encryption_mode = "MD5"
        elif user_dict[user]["shadow_pw"].startswith("$2$"):
            encryption_mode = "Blowfish"
        elif user_dict[user]["shadow_pw"].startswith("$5$"):
            encryption_mode = "SHA-256"
        elif user_dict[user]["shadow_pw"] == "!!":
            encryption_mode = "Not set password"
        elif user_dict[user]["shadow_pw"].startswith("!"):
            encryption_mode = "Locked"
        elif user_dict[user]["shadow_pw"].startswith("*"):
            encryption_mode = "Locked"
        elif user_dict[user]["shadow_pw"] == "":
            encryption_mode = "Not set password"

        encryption_mode_dict[user] = {"encryption_mode": encryption_mode }
    return _merge_dict(user_dict, encryption_mode_dict)


def _merge_dict(dict1, dict2):
    for k in dict1:
        if k in dict2:
            dict1[k].update(dict2[k])
    return dict1

def get_user_basic_info():
    upi = get_user_passwd_info()
    usi= get_user_shadow_info()
    user_dict = _merge_dict(upi, usi)
    user_dict = add_nologin_type(user_dict)
    user_dict = add_privileged_type(user_dict)
    user_dict = add_classification_type(user_dict)
    user_dict = add_encryption_mode(user_dict)
    return user_dict

def main():
    module = AnsibleModule(argument_spec=dict(),supports_check_mode=True)
    if module.check_mode:
        module.exit_json(changed=False)
    user_info = get_user_basic_info()
    module.exit_json(changed=False,user_info=user_info)

from ansible.module_utils.basic import *
from ansible.module_utils.facts import *
main()
