# Intro

## Storing data

1. Memory
 - memory will be cleared on every boot/programm start
2. Disk
 - for persistance

 ## Disk storage
 - plain text files
 - structured text files
    - json
    - cvs/tvs (Comma Separated Value/Tab Separated Value)
    - xml (w3.org)
    - ini (PHP can read. In windows)
    - svg (for images, xml file)
- binary file
    - data in binary format
    - images
    - audio
    - video

    ## examples

    -   unicode.org
    -   list of filesignatures

    ## Plain text
    ```
    Mary River
    2024

    Report

    This year will be the beginning of the new project.
    Designers of the new project Mary River and Matt Jones attended the lauch...
    ```
    problem with plain text: Hard or impossible to handle programmatically

    ## Structured text
    ```
    Writer: Mary River
    Year: 2024

    Type: Report

    This year will be the beginning of the new project.
    Designers of the new project Mary River and Matt Jones attended the lauch of type:marketing
    ```

    ## Better solutions

    ### Json document

    ``` json
    {"writer" :{
        "first name":"Mary",
     "last name":"River"
     },
    "year": 2024,
    "type": "Report",
    "text":["This year will be the beginning of a new", "project. Designers of the new project",
     "Mary River and Matt Jones attended the",
    "lauch of type:marketing"]
    }
    ```
    ### XML document
    ```xml
    <document>
        <writer>
        <firstname>Mary</firstname>
        <lastname>River</lastname>
        <year>2024</year>
        <type>Report</type>
        <text>
        This year will be the beginning of the new project.Designers of the new project Mary River and Matt Jones attended the lauch of type:marketing
        </text>
    </document>

    ```
    ## Using textfiles as Data storage

    ### Json
```json
[
    {
    "first name": "Mary",
    "last name": "River",
    "age" : 25
    },

    {
    "first name": "Matt",
    "last name": "Jones",
    "age" :30
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
"Mary","River",25
"Matt","Jones", 30
```

### Ini

Usually used for config

```ini
;this is a comment in ini
[database]
driver = mysql
host = localhost 
port = 3306
databasename = persondb
[user]
username = zeke
```