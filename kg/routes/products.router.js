const express=require("express");
const router=express.Router();
const pool=require("../pool");
//http://localhost:3000/products
router.get("/",(req,res)=>{
  var kwords=req.query.kwords;
  var pno=req.query.pno;
  if(pno===undefined) pno=0;
  kwords=kwords.split(" ");
  var arr=kwords.map(function(){
    return " title like ? ";
  })
  var titles=arr.join(" and ");
  var sql="select * ,(select md from kg_earpiece_pic where earpiece_id=lid limit 1) as md from xz_laptop where "+titles;
  var sql1="select * ,(select md from kg_mouse_pic where laptop_id=lid limit 1) as md from xz_laptop where "+titles;
  var sql2="select * ,(select md from kg_keyboard_pic where laptop_id=lid limit 1) as md from xz_laptop where "+titles;
  kwords.forEach(function(val,i,arr){
    kwords[i]=`%${val}%`;
  })
  pool.query(sql,sql1,sql2,kwords,(err,result)=>{
    if(err) console.log(err);
    var count=result.length;
    var pageCount=Math.ceil(count/9)
    var products=result.slice(pno*9,pno*9+9)
    var output={pno,count,pageCount,products}
    res.send(output);
  })
})

module.exports=router;