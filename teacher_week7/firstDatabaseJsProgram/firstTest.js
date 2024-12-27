'use strict';

const mariadb = require('mariadb');

async function test(){

    const options={
        host:'localhost', //host of the db (could be 127.0.0.1)
        port:3306, //the port of db
        user:'maria',
        password:'1234',
        database:'employeedb',
        allowPublicKeyRetrieval:true //mysql
    };

    const connection = await mariadb.createConnection(options);

    const result = await connection.query('select * from employee');
    console.log(result);

    connection.end();
}

//run the test function
test();
