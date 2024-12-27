'use strict';

const {getAll,getOne,add,update,remove} = require('./databaseFunctions');

// getAll().then(console.log).catch(console.log);
// getOne(2).then(console.log).catch(console.log);

const newItem={
    employeeId:4,
    firstname:'Verax',
    lastname:'Oceanx',
    department:'adminx',
    salary:5678.87
};

// add(newItem).then(console.log).catch(console.log);
update(newItem).then(console.log).catch(console.log);
// remove(4).then(console.log).catch(console.log);
