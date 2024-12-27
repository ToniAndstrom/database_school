'use strict';

const cors = require('cors');

const express = require('express');
const app =express();

const {getAll,getOne,add,update,remove} = require('./databaseFunctions');

const {port,host} = require('./config.json');

const RESOURCE='employees';
const PRIMARY_KEY='employeeId';

app.use(cors());
app.use(express.json());

app.get('/rest', (req,res)=> res.json(RESOURCE));

app.get(`/rest/${RESOURCE}/pk`, (req,res)=>res.json(PRIMARY_KEY));

app.get(`/rest/${RESOURCE}`, (req,res)=>
    getAll()
        .then(result=>res.json(result))
        .catch(err=>res.json(err)));

app.get(`/rest/${RESOURCE}/:key`, (req,res)=>
    getOne(req.params.key)
        .then(result => res.json(result))
        .catch(err => res.json(err)));

app.post(`/rest/${RESOURCE}`,(req,res)=>
    add(req.body)
        .then(result => res.json(result))
        .catch(err => res.json(err)));

app.delete(`/rest/${RESOURCE}/:key`, (req, res) =>
    remove(req.params.key)
        .then(result => res.json(result))
        .catch(err => res.json(err)));

app.put(`/rest/${RESOURCE}/:key`, async (req,res)=>{
    const resourceObject = req.body;
    const key=req.params.key;
    if(key != resourceObject[PRIMARY_KEY]){
        res.json({ error:`Keys don't match`});
    }
    else{
        try{
            const getResult = await getOne(key);
            if(getResult.length>0){
                update(resourceObject)
                    .then(result => res.json(result))
                    .catch(err => res.json(err));
            }
            else{
                add(resourceObject)
                    .then(result => res.json(result))
                    .catch(err => res.json(err));
            }
        }
        catch(err){
            res.json({error:'Put failed'});
        }
    }
});

app.all('*', (req,res)=>res.json('not supported'));

app.listen(port,host, 
    ()=>console.log(`Rest server ${host}:${port} serving...`));