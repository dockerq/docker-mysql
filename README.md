# Mysql on container

Mysql on Container with utf-8 encoding.

## Requisites
- docker
- Linux
- make
- mysql:5.7 image

## Usage
- clone repo
```
git clone https://github.com/dockerq/container-mysql.git
```
- change root pass etc on Makefile
```
export root_pass=root
export mysql_user=user
export mysql_pass=pass
```
- run image
```
make prod
```

## Confirm encoding
- exec to container
```
docker exec -it mysql bash
```
- login to mysql
```
mysql -u root -p your_pass
```
- encoding
```
show variables like 'character%';
```
and you will see:
```
mysql> show variables like 'character%';
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       |
| character_set_connection | utf8                       |
| character_set_database   | utf8                       |
| character_set_filesystem | binary                     |
| character_set_results    | utf8                       |
| character_set_server     | utf8                       |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
8 rows in set (0.01 sec)
```
