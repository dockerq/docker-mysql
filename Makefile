root_pass=root
mysql_user=user
mysql_pass=pass

prod:
	docker run -d --name mysql -p 2306:3306 -v `pwd`/data:/var/lib/mysql -v `pwd`/etc:/etc/mysql/conf.d \
		-e MYSQL_ROOT_PASSWORD=$(root_pass) -e MYSQL_USER=$(mysql_user) -e MYSQL_PASSWORD=$(mysql_pass) mysql:5.7
clean:
	docker stop mysql
	docker rm mysql
	sudo rm -rf data
