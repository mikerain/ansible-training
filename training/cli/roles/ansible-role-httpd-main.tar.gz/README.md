acropia-role-httpd
==================
Installs and configure Apache HTTP Server on a Linux system. It installs a
rather basic setup for Apache HTTPD, and does some additional steps:

- Disable a lot of base modules, to speed up Apache
- Disable DAV, LUA, CGI
- Configure mod_info and mod_status to only allow given IPs

Requirements
------------
- AlmaLinux 8

Role Variables
--------------
- `httpd_listen`
- `httpd_user`
- `httpd_group`
- `httpd_server_admin`

Dependencies
------------
None

License
-------
BSD

Author Information
------------------
Acropia  
acropia.nl
