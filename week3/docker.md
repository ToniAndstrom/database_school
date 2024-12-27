# Docker

```shell
> docker run --name my_mysql -e MYSQL_ROOT_PASSWORD=secret -p 3333 : 3306 -d mysql:latest
```

to start again
```shell
> docker start my_mysql
```

to go in container
```shell
> docker exec -it my_mysql bash
```

run in the container shell
```shell
> mysql -u root -p
```
first create a folder to home directory for share
```shell
mkdir docshare
```
instead of $HOME you could use absolute path from root to docshare
get the path for example with "pwd" command

```shell
> docker run --name my_mysql -e MYSQL_ROOT_PASSWORD=secret -p 3333 : 3306 -v $HOME/docshare:$HOME/sql -d mysql:latest
```


```shell
> mysql -u root -p <createStatement.sql
```
