//使用express构建web服务器 --11:25
const express = require('express');
const bodyParser = require('body-parser');
const cors=require("cors");
// const pool = require("./pool");
var app = express();
app.listen(3000);
app.use(express.static('public'));
//加载第三方模块: express-session
const session = require("express-session");
//对模块配置
app.use(session({
  secret:"128位随机字符串",   //安全令牌
  resave:false,              //请求保存
  saveUninitialized:true,    //初始化
  cookie:{                   //sessionid保存时
    maxAge:1000*60*60*24     //间1天 cookie
  }
}));
/*引入路由模块*/
const Cdetails = require("./routes/Cdetails.router");
const userRouter=require('./routes/user.js');
const index=require("./routes/index.router");
const details=require("./routes/details.router.js");
const products=require("./routes/products.router.js")
app.use(bodyParser.urlencoded({extended:false}))
app.use(cors({
	origin:["http://127.0.0.1:5500",'http://localhost:3000']
}))
/*使用路由器来管理路由*/
app.use("/user",userRouter);
app.use("/index",index);
app.use("/details",details);
app.use("/products",products);
app.use("/Cdetails",Cdetails);

