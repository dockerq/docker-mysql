export root_pass=root
export mysql_user=user
export mysql_pass=pass

prod:
    docker run -d --name mysql -p 2306:2306 -v `pwd`/data:/var/lib/mysql -v `pwd`/etc:/etc/mysql/conf.d \
    -e MYSQL_ROOT_PASSWORD=$(root_pass) \
    -e MYSQL_USER=$(mysql_user) -e MYSQL_PASSWORD=$(mysql_pass) mysql:5.7
