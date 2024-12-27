'use strict';

const mariadb = require('mariadb');

const options={
    host:'localhost',
    port:3306,
    user:'maria',
    password:'1234',
    database:'employeedb',
    allowPublicKeyRetrieval:true //mysql
};

const adapt = item =>Object.assign(item,{
    employeeId:+item.employeeId,
    salary:+item.salary
});

async function getAll(){
    let connection;

    try{
        connection = await mariadb.createConnection(options);
        return (await connection.query('select * from employee')).map(item=>adapt(item));
    }
    catch(err){
        // console.log(err);
        return err.message;
    }
    finally{
        if(connection) connection.end();
    }
} //end of getAll

async function getOne(id){
    let connection;
    try{
        connection = await mariadb.createConnection(options);
        const sql='select * from employee where employeeId=?';
        const result = await connection.query(sql, [id]);
        return result.map(item=>adapt(item));
    }
    catch(err){
        return err.message;
    }
    finally{
        if (connection) connection.end();
    }
} // end of getOne

async function add(newEmployee){
    let connection;
    try{
        connection = await mariadb.createConnection(options);
        const sql = 'insert into employee values(?,?,?,?,?)';
        const parameters=[
            +newEmployee.employeeId,
            newEmployee.firstname,
            newEmployee.lastname,
            newEmployee.department,
            +newEmployee.salary
        ];
        const status=await connection.query(sql,parameters);
        // console.log(status);
        return {rowsChanged:status.affectedRows};
    }
    catch(err){
        return err.message;
    }
    finally{
        if (connection) connection.end();
    }
} //end of add

async function update(newEmployee) {
    let connection;
    try {
        connection = await mariadb.createConnection(options);
        const sql = 'update employee set firstname=?, lastname=?,'+
                    'department=?, salary=? where employeeId=?';
        const parameters = [
            newEmployee.firstname,
            newEmployee.lastname,
            newEmployee.department,
            +newEmployee.salary,
            +newEmployee.employeeId
        ];
        const status = await connection.query(sql, parameters);
        // console.log(status);
        return { rowsChanged: status.affectedRows };
    }
    catch (err) {
        return err.message;
    }
    finally {
        if (connection) connection.end();
    }
} //end of update

async function remove(id) {
    let connection;
    try {
        connection = await mariadb.createConnection(options);
        const sql = 'delete from employee where employeeId=?';
        const status = await connection.query(sql, [id]);
        return { rowsChanged: status.affectedRows };
    }
    catch (err) {
        return err.message;
    }
    finally {
        if (connection) connection.end();
    }
} // end of remove

module.exports={getAll,getOne,add,update,remove};