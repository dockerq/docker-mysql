# Mysql on container

Mysql on Container with utf-8 encoding.

## Requisites
- docker
- Linux
- make
- mysql:5.7 image

## Intro
- `etc`: store mysql config file.
- `data`: directory used to volume to mysql container to back up data.

## Usage
- clone repo

  ```
  git clone https://github.com/dockerq/container-mysql.git
  ```
- change your config info on `Makefile` and `etc/adolphlwq.cnf`
  ```
  # Makefile
  export root_pass=root
  export mysql_user=user
  export mysql_pass=pass

  # etc/adolphlwq.cnf
  [client]
  default-character-set=utf8
  [mysql]
  default-character-set=utf8
  [mysqld]
  character-set-server=utf8
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
