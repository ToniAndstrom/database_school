'use strict';

const path = require('path');
const cors = require('cors');

const express = require('express');
const app=express();

const errorMessage=`
##########################################
Usage: node server <configFileName>

Foe example: node server config.json
##########################################`;

if(process.argv.length<3){
    console.log(errorMessage);
}
else{
    const [, , configFilePath] = process.argv;
    try{
        const configFile=require(path.join(__dirname,configFilePath));
        startServer(configFile);
    }
    catch(err){
        console.log(err);
        console.log(`Config file '${configFilePath}' not found`);
    }
}

function startServer(configFile) {
    const config = configFile;
    // console.log(config)
    const storageEngineFolder = path.join(__dirname, config.engineFolder);
    const storageFolder = path.join(__dirname, config.storagefolder);
    const paths = {
        storageEngineFolder,
        storageFolder,
        dataStoragePath: path.join(storageEngineFolder, config.dataStorageFile),
        statuscodes: path.join(storageEngineFolder, config.statusfile),
        databaseLayer: path.join(storageEngineFolder, config.databaseLayer),
        storagePath: path.join(storageFolder, config.storage.folder),
        storageConfigFile:path.join(storageFolder, config.storage.folder,config.storage.storageConfigFile)   
    }

    // console.log(paths)
    const { createDataStorage } = require(paths.dataStoragePath);
    const storage = createDataStorage(paths);

    const RESOURCE=storage.RESOURCE;


    app.use(cors());
    app.use(express.json());

    app.get('/rest', (req, res) =>  res.json(storage.RESOURCE));
    
    app.get(`/rest/${RESOURCE}/pk`, (req, res) => res.json(storage.PRIMARY_KEY));
    
    app.get(`/rest/${RESOURCE}/:key`, (req, res) =>
        storage.get(req.params.key)
            .then(result => res.json(result))
            .catch(err => res.json(err))
    );

    app.get(`/rest/${RESOURCE}/:key/:value`, (req, res) =>
        storage.get(req.params.value,req.params.key)
            .then(result => res.json(result))
            .catch(err => res.json(err))
    );

    app.get(`/rest/${RESOURCE}`, (req, res) =>
        storage.getAll()
            .then(result => res.json(result))
            .catch(err => res.json(err))
    );

    app.post(`/rest/${RESOURCE}`,(req,res)=>
        storage.insert(req.body)
            .then(result => res.json(result))
            .catch(err => res.json(err))
    );

    app.put(`/rest/${RESOURCE}/:keyvalue`,async (req,res)=>{
        const resourceObject=req.body;
        const keyValue = req.params.keyvalue;
        if (keyValue != resourceObject[storage.PRIMARY_KEY]) {
            res.json(storage.MESSAGES.KEY_NO_NOT_MATCH(keyValue,resourceObject[storage.PRIMARY_KEY]))
        }
        else {
            try {
                await storage.getOne(keyValue);
                storage.update(resourceObject)
                    .then(result => res.json(result))
                    .catch(err => res.json(err))
                
            }
            catch (err) {
                storage.insert(resourceObject)
                    .then(result => res.json(result))
                    .catch(err => res.json(err))
            }
            
        }
    });

    app.delete(`/rest/${RESOURCE}/:key`,(req,res)=>
        storage.remove(req.params.key)
            .then(result => res.json(result))
            .catch(err => res.json(err))
    );

    app.all('*', (req,res)=>res.json('not supported'));

    app.listen(config.port,config.host, 
        ()=>console.log(`Rest server ${config.host}:${config.port} serving`))


}









