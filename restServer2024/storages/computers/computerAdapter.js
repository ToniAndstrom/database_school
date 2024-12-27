'use strict';

module.exports = item=>
    Object.assign(item,{
        id:+item.id,
        amount:+item.amount
    });

