# Databases

Database system engine includes database handling programs such as manipulating data structures and user etc.

-relation databases
-   Sql language
- non relational databases
-   noSql (for example MongoDB)

## Datastorage usage
(frontend)

`Client applications` 
    | (API, for example fetch)

    --------------------------------------(backend)

`datastorage layer` 
    | (API, for example SQL)

`datastorage engine` 
    | (API read/write disc etc.)

`disc storage` (permanent storage)

## Relational database

### **person**-table
columns
id|fistname |lastname|age    | -
:---:|---   |---     |:---:  |---
1    |"Matt"|"River" |20     |  `row`
2    |"Mary"|"River" |25     |  `row`
3    |"Matt"|"Jones" |30     |  `row`

## compared to csv file
```csv
id,fistname ,lastname,age

1,Matt,River,20
2,Mary,River,25
3,Matt,Jones,30
```

## create a table with SQL
```sql
create table person(
    id integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    age integer
);
```


```sql
insert into person (id, firstname, lastname, age)
values(1,"Matt", "River", 20);

```