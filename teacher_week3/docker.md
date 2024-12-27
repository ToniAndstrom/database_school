# Docker

```shell
> docker run --name my_mysql -e MYSQL_ROOT_PASSWORD=secret -p 3333:3306 -d mysql:latest
```
to start again
```shell
> docker start my_mysql
```

To go in container
```shell
> docker exec -it my_mysql bash
```
run in the container shell
```shell
> mysql -u root -p
```

```shell
> docker run --name my_mysql -e MYSQL_ROOT_PASSWORD=secret -p 3333:3306 
-v $HOME/docshare:$HOME/sql -d mysql:latest
```

```shell
$HOME/sql> mysql -u root -p <createStatement.sql
```