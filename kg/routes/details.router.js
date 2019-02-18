const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://localhost:3000/detials?lid=5
router.get("/",(req,res)=>{
  var output={product:{},specs:[],pics:[]};
  var lid=req.query.lid;
  if(lid!==undefined){
    var sql=
      "select * from kg_earpiece where lid=?";
    pool.query(sql,[lid],(err,result)=>{
      if(err) console.log(err);
      output.product=result[0];
      var family_id=output.product.family_id;
      var sql="select lid,spec from kg_earpiece where family_id=?";
      pool.query(sql,[family_id],(err,result)=>{
        if(err) console.log(err);
        output.specs=result;
        var sql="select * from kg_earpiece_pic where laptop_id=?";
        pool.query(sql,[lid],(err,result)=>{
          if(err) console.log(err);
          output.pics=result;
          res.send(output);
        })
      })
    })
    var sql=
    "select * from kg_mouse where lid=?";
  pool.query(sql,[lid],(err,result)=>{
    if(err) console.log(err);
    output.product=result[0];
    var family_id=output.product.family_id;
    var sql="select lid,spec from kg_mouse where family_id=?";
    pool.query(sql,[family_id],(err,result)=>{
      if(err) console.log(err);
      output.specs=result;
      var sql="select * from kg_mouse_pic where laptop_id=?";
      pool.query(sql,[lid],(err,result)=>{
        if(err) console.log(err);
        output.pics=result;
        res.send(output);
      })
    })
  })
  var sql=
  "select * from kg_keyboard where lid=?";
pool.query(sql,[lid],(err,result)=>{
  if(err) console.log(err);
  output.product=result[0];
  var family_id=output.product.family_id;
  var sql="select lid,spec from kg_keyboard where family_id=?";
  pool.query(sql,[family_id],(err,result)=>{
    if(err) console.log(err);
    output.specs=result;
    var sql="select * from kg_keyboard_pic where laptop_id=?";
    pool.query(sql,[lid],(err,result)=>{
      if(err) console.log(err);
      output.pics=result;
      res.send(output);
    })
  })
})
  }else{
    output.err="请提供lid"
    res.send(output);
  }
})

module.exports=router;