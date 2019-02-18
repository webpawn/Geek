const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:3000/index
router.get("/",(req,res)=>{
  var sql=`select * from kg_index_product
  where seq_recommended!=0
  order by seq_recommended`;
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

module.exports=router;