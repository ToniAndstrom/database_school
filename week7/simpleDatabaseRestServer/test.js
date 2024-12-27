"use strict";

const{getAll, getOne,add,update,remove} = require("./databaseFunctions");


//getAll().then(cosole.log).catch(console.log);
getOne(2).then(console.log).catch(console.log);

const newItem={
    employeeId: 14,
    firstname:"Vera",
    lastname:"Ocean",
    department:"admin",
    salary:5678.87
};
//add (newItem).then(console.log).catch(console.log);
update (newItem).then(console.log).catch(console.log);
//remove(4).then(console.log).catch(console.log);

