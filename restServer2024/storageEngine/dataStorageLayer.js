'use strict';
const path = require('path');



function createDataStorage(paths) {

    const { CODES, TYPES, MESSAGES } = require(paths.statuscodes);
    
    const Database = require(paths.databaseLayer);
    const config = require(paths.storageConfigFile);
    const sql = require(path.join(paths.storagePath, config.sqlStatements));
    const {
        insertParameters,
        updateParameters
    } = require(path.join(paths.storagePath, config.parameterFunctionsFile));

    let adapt = item => item;
    
    if (config.adapterFile && config.adapterFile.length > 3) {
        adapt = require(path.join(paths.storagePath, config.adapterFile));
    }
    
    const options = {
        host: config.host,
        port: config.port,
        user: config.user,
        password: config.password,
        database: config.database
    }
    
    const getAllSql = sql.getAll.join(' ');
    const getOneSql = sql.getOne.join(' ');
    const insertSql = sql.insert.join(' ');
    const updateSql = sql.update.join(' ');
    const removeSql = sql.remove.join(' ');
    const search = sql.search;

    const primary_key = sql.primary_key;
    //Datastorage class

    class Datastorage{
        constructor(){
            this.db=new Database(options);
        }

        get CODES(){
            return CODES;
        }

        get TYPES(){
            return TYPES;
        }

        get MESSAGES(){
            return MESSAGES;
        }

        get KEYS(){
            return Promise.resolve(Object.keys(search));
        }

        get PRIMARY_KEY(){
            return primary_key;
        }

        get RESOURCE(){
            return config.resource;
        }

        getAll(){
            return new Promise(async (resolve,reject)=>{
                try{
                    const result = await this.db.doQuery(getAllSql);
                    resolve(result.queryResult.map(item=>adapt(item)));
                }
                catch (err) {
                    console.log(err)
                    reject(MESSAGES.PROGRAM_ERROR());
                }
            });  
        }

        getOne(value){
            return new Promise(async (resolve,reject)=>{
                try{
                    if (value==undefined) {
                        reject(MESSAGES.NOT_FOUND(primary_key,'---empty---'));
                    }
                    else {
                        const result = await this.db.doQuery(getOneSql,[value]);
                        if (result.queryResult.length>0) {
                            resolve(adapt(result.queryResult[0]));
                        }
                        else {
                            reject(MESSAGES.NOT_FOUND(primary_key,value))
                        }
                    }
                }
                catch(err){
                    console.log(err)
                    reject(MESSAGES.PROGRAM_ERROR());
                }
            
            });
        } //end of getOne

        get(value, key = primary_key) {
            const searchSql = search[key];

            return new Promise(async (resolve, reject) => {
                try {
                    if (!searchSql) {
                        reject(MESSAGES.NOT_FOUND(key,value));
                    }
                    else if (value == undefined) {
                        reject(MESSAGES.NOT_FOUND(key,'-- empty --'));
                    }
                    else {
                        const result = await this.db.doQuery(searchSql.join(' '),[value]);
                        resolve(result.queryResult.map(item => adapt(item)));
                    }
                   
                }
                catch (err) {
                    console.log(err)
                    reject(MESSAGES.PROGRAM_ERROR());
                }
            });
        }

        insert(newItem){
            return new Promise(async (resolve,reject)=>{
                try{
                    if (newItem) {
                        if (newItem[primary_key] == undefined) {
                            reject(MESSAGES.NOT_INSERTED());
                        }
                        else {
                            const result=await this.db.doQuery(getOneSql,[newItem[primary_key]]);
                            if (result.queryResult.length>0) {
                                reject(MESSAGES.ALREADY_IN_USE(newItem[primary_key]));
                            }
                            else{
                                await this.db.doQuery(insertSql,insertParameters(newItem));
                                resolve(MESSAGES.INSERT_OK(primary_key,newItem[primary_key]));
                            }
                        }
                    
                    }
                    else {
                        reject(MESSAGES.NOT_INSERTED());
                    }
                }
                catch(error){
                    console.log(error);
                    reject(MESSAGES.NOT_INSERTED())
                }
                
            });
        } //end of insert
        
        update(item){
            return new Promise(async (resolve,reject)=>{
                try{
                    if (item) {
                        const status = await this.db.doQuery(updateSql,updateParameters(item));
                        if (status.queryResult.rowsChanged>0) {
                            resolve(MESSAGES.UPDATE_OK(primary_key,item[primary_key]));
                        }
                        else {
                            reject(MESSAGES.NOT_UPDATED());
                        }
                    }
                    else {
                        reject(MESSAGES.NOT_UPDATED());
                    }
                }
                catch(error){
                    console.log(error);
                    reject(MESSAGES.NOT_UPDATED());
                }
                
            });
        } //end update


        remove(value){
            return new Promise(async (resolve,reject)=>{
                try{
                    if (value == undefined) {
                        reject(MESSAGES.NOT_FOUND(primary_key,'---empty---'));
                    }
                    else {
                        const status=await this.db.doQuery(removeSql,[value]);
                        if(status.queryResult.rowsChanged>0){
                            resolve(MESSAGES.REMOVE_OK(primary_key,value));
                        }
                        else{
                            reject(MESSAGES.NOT_REMOVED(primary_key,value));
                        }
                    } 
                }
                catch(error){
                    reject(MESSAGES.PROGRAM_ERROR());
                }       
            });
        } //end of remove
        

    } //end of class

    return new Datastorage();

} //end of function createDataStorage

module.exports = { createDataStorage }