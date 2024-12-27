'use strict';

const persons = require('./person.json');

function search(searchKey, value){
    //error checking missing

    const found=[];
    for(const person of persons){
        if(person[searchKey]==value){
            found.push(person);
        }
    }

    return found;
}

console.log('########');
console.log(search('firstname','Mary'));
console.log('########');
console.log(search('lastname','River'));
console.log('########');
console.log(search('age',30));
console.log('########');

const age=30;
const result = search('age', age);
if(result.length>0){
    console.log(`Persons age of ${age}:`);
    for(const person of result){
        console.log(`${person.lastname} ${person.firstname}`);
    }
}
else{
    console.log(`No persons age ${age}`);
}