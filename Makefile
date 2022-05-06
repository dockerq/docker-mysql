root_pass=root
mysql_user=test
mysql_pass=test
mysqlv := 5.7

prod:
	docker run -d --name mysql --net host -v `pwd`/data:/var/lib/mysql -v `pwd`/etc:/etc/mysql/conf.d \
		-e MYSQL_ROOT_PASSWORD=$(root_pass) -e MYSQL_USER=$(mysql_user) -e MYSQL_PASSWORD=$(mysql_pass) mysql:$(mysqlv)
clean:
	docker stop mysql
	docker rm mysql
	sudo rm -rf data
