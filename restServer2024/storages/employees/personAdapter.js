'use strict';

module.exports = item=>
    Object.assign(item,{
        employeeId:+item.employeeId,
        salary:+item.salary
    });

