# Intro

## storing data

1. memory
 -  memory will be cleared on every boot/program start
2. disk
 -  for persistance

 ## Disk storage
 -  plain text files
 -  structured text file
    - json
    - csv/tsv (Comma Separated Value/ Tab Separated Value)
    - xml (w3.org, https://www.w3.org/XML/)
    - ini
    - svg (for images, xml file)
 -  binary file
    - data in binary format
    - images
    - audio
    - video

## Examples

-   unicode.org
-   https://en.wikipedia.org/wiki/List_of_file_signatures

## plain text

```
Mary River
2024

Report

This year 2024 will be the beginning of a new project. Designers of the new project Mary River and Matt Jones attended the lauch....
```
problem with plain text: Hard or impossible to handle programmatically

## structured text
```
Writer: Mary River
Year: 2024

Type: Report

This year 2024 will be the beginning of a new project. Designers of the new project Mary River and Matt Jones attended the lauch of type:marketing
```

## better solutions

### Json document

```json
{
    "writer":{
        "firstname":"Mary",
        "lastname":"River"
    },
    "year":2024,
    "type":"Report",
    "text":[
        "This year 2024 will be the beginning of a ",
        "new project. Designers of the new project ",
        "Mary River and Matt Jones attended the ",
        "lauch of type:marketing"
    ]
}
```
### XML documentation

```xml
<document>
    <writer>
        <firstname>Mary</firstname>
        <lastname>River</lastname>
    </writer>
    <year>2024</year>
    <type>Report</type>
    <text>
        This year 2024 will be the beginning of a new project. Designers of the new project Mary River and Matt Jones attended the lauch of type:marketing
    </text>
</document>
```

## Using text files as Data storage

### Json
```json
[
    {
        "firstname":"Mary",
        "lastname":"River",
        "age":25
    },
    {
        "firstname":"Matt",
        "lastname":"Jones",
        "age":30
    }
]
```

### XML

```xml
<persons>
    <person>
        <firstname>Mary</firstname>
        <lastname>River</lastname>
        <age>25</age>
    </person>
    <person>
        <firstname>Matt</firstname>
        <lastname>Jones</lastname>
        <age>30</age>
    </person>
</persons>
``` 

### CSV

```csv
firstname,lastname,age
Mary,River,25
Matt,Jones,30
```
or

```csv
"firstname","lastname","age"
"Mary","River",25,
"Matt","Jones",30
```

### ini

usually used for config info

```ini
;this is a comment in ini file
[database]
driver=mysql
host=localhost
port=3306
databasename=persondb
[user]
username=zeke
```

