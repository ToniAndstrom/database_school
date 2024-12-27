# Markdown - short intro

- vscode/vscodium prewiev

    - windows contrl+shift+v

    - mac cmd+shift+v

## Headers

# level 1
## level 2
### level 3
#### level 4
##### level 5
###### level 6

## Text formatting

Some text *this is italic* **this is bold**
`code` 

 two spaces at the end of the previous line (2 enters is easier)

 ## Lists (remember the space after the hypfen)

 - item1
 - item2
    - subitem

## numbered list

1. item
2. item

## languages or formats

### Javascript
```js
const number=10;
let name = "Matt";
```
<!-- if you have markdown pdf you can use this to break the page so they don't get seperated to 2 different pages -->
<div style = "page-break-after:always;"></div>

### Json
```json
{
    "first name": "Matt",
    "age" :25
}
```
### PHP
```php
<?php 
if ($method == "GET"){
    echo "This is GET"
}
?>
```

### Terminal/Shell
```shell
$ node -v
```
### gray block
```
some text
```

### Tables

header 1|header 2|header 3
:---|---:|:---:|
di  |d2  |d3

alignment| tag|
---------|-----|
left     |:--- |
right    |---: |
center   |:---:|