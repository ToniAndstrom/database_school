"use strict";

(function(){
let method ="GET";
let urifield;
let jsonarea;
let messagearea;

document.addEventListener("DOMContentLoaded",init);

function init(){
urifield= document.getElementById("urifield");
jsonarea= document.getElementById("jsonarea");
messagearea=document.getElementById("messagearea");

document.getElementById("submit")
.addEventListener("click", send);

document.getElementById("methods")
.addEventListener("change", choose);

urifield.value="http://localhost:3000/rest";
} //end of init

function clearSelections(){
    messagearea.textContent="";
    jsonarea.value="";
    method="GET";
    document.getElementById("get").checked=true;
}

function choose(e){
    messagearea.textContent="";
    method=e.target.value;
}

async function send(){
const options={
    method:method,
    mode:"cors"
};
if (method==="PUT" || method === "Post"){
    options.body=jsonarea.value;
    options.headers={"Content-type": "application/json"};
} try{
const result = await fetch(urifield.value, options);
const data= await result.json();
messagearea.textContent=JSON.stringify(data,null,4);
}
catch(err){
messagearea.textContent=err.message;

}finally{

}
}
})();