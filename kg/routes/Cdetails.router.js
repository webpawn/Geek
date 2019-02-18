const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    var kwords=req.query.kwords;
    console.log(kwords);
    var sql="SELECT * ,(select sm from kg_mouse_pic where laptop_id=lid limit 1) as sm FROM kg_mouse WHERE title = "
    +"'"+kwords+"'";
    console.log(sql);
    pool.query(sql,kwords,(err,result)=>{
        if(err) console.log(err);
        res.send(result);
    })
})

module.exports=router;