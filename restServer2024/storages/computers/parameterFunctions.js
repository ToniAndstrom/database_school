'use strict';

function insertParameters(computer) {
    return [
        +computer.id, computer.name, computer.type,
        computer.processor, +computer.amount
    ];
}

function updateParameters(computer) {
    return [
        computer.name, computer.type,
        computer.processor, +computer.amount, +computer.id
    ];
}

module.exports={insertParameters,updateParameters}