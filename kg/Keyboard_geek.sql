SET NAMES UTF8;
DROP DATABASE IF EXISTS kg;
CREATE DATABASE kg CHARSET=UTF8;
USE kg;


/**耳机型号家族**/
CREATE TABLE kg_earpiece_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);  

/**耳机**/
CREATE TABLE kg_earpiece(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  spec VARCHAR(64),           #规格/颜色

  lname VARCHAR(32),          #商品名称
  du  VARCHAR(64),            #驱动单元
  rg  VARCHAR(64),            #抗阻
  sensitivity VARCHAR(32),    #灵敏度
  frequency  VARCHAR(32),     #频率响应
  kg  VARCHAR(32),            #重量

  shelf_time DATE,            #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);


/**耳机麦克风**/
CREATE TABLE kg_earpiece_micro(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  earpiece_id INT,                  #所属耳机编号
  sensitivity_micro  VARCHAR(32),   #灵敏度
  rg_micro  VARCHAR(32),            #抗阻
  way_micro  VARCHAR(32),           #拾音方式
  frequency_micro  VARCHAR(32),     #频率响应
  FreeAir_micro  INT,               #无线传输距离
  finite_micro  INT                 #有线长度
);



/**耳机图片**/
CREATE TABLE kg_earpiece_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  earpiece_id INT,            #耳机编号
  sm VARCHAR(128),            #小图片路径
  lg VARCHAR(128)             #大图片路径
);



/**鼠标**/
CREATE TABLE kg_mouse(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  pname VARCHAR(32),          #商品名称
  pcard VARCHAR(32),          #商品型号
  spec VARCHAR(64),           #颜色
  category VARCHAR(32),       #传感器类型
  resolution VARCHAR(32),     #分辨率
  IPS VARCHAR(32),            #IPS
  key_num INT,                #键数
  light VARCHAR(32),          #灯效
  texture VARCHAR(32),        #材质
  pweight VARCHAR(32),        #重量
  psize VARCHAR(32),          #尺寸
  plength VARCHAR(32)         #线缆长度
);

/**鼠标图片**/
CREATE TABLE kg_mouse_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #鼠标编号
  sm VARCHAR(128),            #小图片路径
  lg VARCHAR(128)             #大图片路径
);

/**键盘**/
CREATE TABLE kg_keyboard(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  spec VARCHAR(64),           #规格/颜色

  lname VARCHAR(32),          #商品名称
  led VARCHAR(255),            #灯效
  knum TINYINT,                #键数
  we  FLOAT,                   #重量
  wl  FLOAT,                   #连线长度 

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**键盘图片**/
CREATE TABLE kg_keyboard_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #鼠标编号
  sm VARCHAR(128),            #小图片路径
  -- md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE kg_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE kg_product_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE kg_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE kg_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE kg_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE kg_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE kg_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**耳机、鼠标、键盘型号家族**/
INSERT INTO kg_earpiece_family VALUES
(NULL,'SONY'),
(NULL,'雷蛇'),
(NULL,'罗技Logitech'),
(NULL,'CHERRY'),
(NULL,'Beats');



/**耳机**/
INSERT INTO kg_earpiece VALUES
(1,1,'索尼（SONY）WH-1000XM2 Hi-Res无线蓝牙耳机',1649,'智能降噪耳机 头戴式 1000x二代 黑色','SONY','WH-1000XM2 Hi-Res','46 Ω（1 kHz）（在本机开启的情况下通过 耳机连接线连接时） 14 Ω（1 kHz）（在本机关闭的情况下通过 耳机连接线连接时）','103 dB/mW（在本机开启的情况下通过耳机 连接线连接时） 98 dB/mW（在本机关闭的情况下通过耳机连 接线连接时）','4 Hz - 40000 Hz（JEITA）（在本机开启的 情况下通过耳机连接线连接时）','约275 g','2018-12-14',569,true),
(2,1,'索尼（SONY） WH-1000XM3 头戴式无线蓝牙降噪手机耳机',2469,'国行WH-1000XM2升级重低音 黑色','SONY','WH-1000XM2 Hi-Res','46 Ω（1 kHz）（在本机开启的情况下通过 耳机连接线连接时） 14 Ω（1 kHz）（在本机关闭的情况下通过 耳机连接线连接时）','103 dB/mW（在本机开启的情况下通过耳机 连接线连接时） 98 dB/mW（在本机关闭的情况下通过耳机连 接线连接时）','4 Hz - 40000 Hz（JEITA）（在本机开启的 情况下通过耳机连接线连接时）','约275 g','2018-10-1',132,false),
(3,1,'索尼（SONY） MDR-Z7M2头戴式4.4平衡HIFI高解析耳机',3899,'Z7升级版监听耳机旗舰动圈 MDR-Z7M2耳机','SONY','WH-1000XM2 Hi-Res','46 Ω（1 kHz）（在本机开启的情况下通过 耳机连接线连接时） 14 Ω（1 kHz）（在本机关闭的情况下通过 耳机连接线连接时）','103 dB/mW（在本机开启的情况下通过耳机 连接线连接时） 98 dB/mW（在本机关闭的情况下通过耳机连 接线连接时）','4 Hz - 40000 Hz（JEITA）（在本机开启的 情况下通过耳机连接线连接时）','约275 g','2018-12-30',66,false),
(4,1,'索尼（SONY）MDR-XB950B1 无线蓝牙',749,'重低音立体声耳机 头戴式 黑色','SONY','WH-1000XM2 Hi-Res','46 Ω（1 kHz）（在本机开启的情况下通过 耳机连接线连接时） 14 Ω（1 kHz）（在本机关闭的情况下通过 耳机连接线连接时）','103 dB/mW（在本机开启的情况下通过耳机 连接线连接时） 98 dB/mW（在本机关闭的情况下通过耳机连 接线连接时）','4 Hz - 40000 Hz（JEITA）（在本机开启的 情况下通过耳机连接线连接时）','约275 g','2018-8-30',1169,true),
(7,2,'雷蛇（Razer）Tiamat 迪亚海魔2.2 V2 游戏耳麦 电竞耳机',849,'头戴式 电脑耳机 绝地求生耳机 吃鸡耳机','雷蛇','4个50mm镀钛膜片钕磁铁单元','前置32Ω，后置16Ω',NULL,'20Hz – 20,000Hz','415g','2018-6-1',1438,true),
(8,2,'Razer 雷蛇Nari影鲛终极版无线游戏耳麦',1699,'THX头戴式无线电竞游戏耳麦7.1声道吃鸡耳机','雷蛇','4个50mm镀钛膜片钕磁铁单元','32?（1 kHz 时）',NULL,'20 Hz - 20 kHz','433g','2018-10-15',2668,false),
(9,2,'雷蛇（Razer）战神 7.1无线幻彩游戏耳机',1099,'电竞耳机 头戴式 电脑耳机 绝地求生耳机 吃鸡耳机','雷蛇','4个50mm镀钛膜片钕磁铁单元','前置32Ω，后置16Ω','112 ± 3 分贝','20Hz – 20,000Hz','375g','2018-5-12',689,false),
(10,2,'雷蛇（Razer）MEKA《守望先锋》D.Va定制',649,'游戏耳麦 电脑手机通用耳麦','雷蛇','4个50mm镀钛膜片钕磁铁单元','前置32Ω，后置16Ω','117+/-3 DB(@1 kHz)','20Hz – 20,000Hz','322g','2018-3-1',5623,true),
(11,3,'Beats Solo3Wireless',2268,'游戏耳机 - Pop 黑 MRRG2PA/A','Beats','NULL','前置32Ω，后置16Ω','115dB','20Hz – 20,000Hz','215g','2018-12-1',423,true),
(12,3,'beatsstudio3',2858,'蓝牙无线降噪耳机 游戏耳机','Beat','4个50mm镀钛膜片钕磁铁单元','前置32Ω，后置16Ω','115dB','20Hz – 20,000Hz','126','2018-10-1',561,false),
(13,3,'Beats EP头戴式耳机手机电脑耳麦',399,'降噪运动音乐耳机重低音hifi魔音耳机 黑色','Beat','4个50mm镀钛膜片钕磁铁单元','前置32Ω，后置16Ω','115dB','20Hz – 20,000Hz','80g','2018-4-10',6648,true),
(14,3,'beats Beats Solo3 Wireless 无线蓝牙头戴式运动魔音耳机',1499,'降噪苹果耳机 黑色','Beat','4个50mm镀钛膜片钕磁铁单元','前置32Ω，后置16Ω','115dB','20Hz – 20,000Hz','215g','2018-6-1',428,true);
/**耳机麦克风**/
INSERT INTO kg_earpiece_micro VALUES
(1,1,NULL,NULL,NULL,'50 HZ-8000 HZ',10,1),
(2,1,NULL,'驻极体电容器',NULL,'50 HZ-6000 HZ',11,1),
(3,1,NULL,NULL,'215dB','50 HZ-8000 HZ',15,1),
(4,1,NULL,'驻极体电容器',NULL,'50 HZ-8000 HZ',13,1),
(5,2,NULL,NULL,'32欧姆','20 HZ-20000 HZ',10,NULL),
(6,2,NULL,NULL,'32欧姆','20 HZ-20000 HZ',10,1),
(7,2,NULL,NULL,'32欧姆','20 HZ-20000 HZ',10,NULL),
(8,2,NULL,NULL,'32欧姆','20 HZ-20000 HZ',10,1),
(9,3,NULL,NULL,NULL,'50 HZ-8000 HZ',10,1),
(10,3,NULL,NULL,NULL,'50 HZ-8000 HZ',10,1),
(11,3,NULL,NULL,NULL,'50 HZ-8000 HZ',10,1),
(12,3,NULL,NULL,NULL,'50 HZ-8000 HZ',10,1);
/**耳机图片**/
INSERT INTO kg_earpiece_pic VALUES
(NULL, 1, 'img/lg/SONY/h1.jpg','img/lg/SONY/h1.jpg'),
(NULL, 1, 'img/lg/SONY/sony01.jpg','img/lg/SONY/sony01.jpg'),
(NULL, 1, 'img/lg/SONY/sony02.jpg','img/lg/SONY/sony02.jpg'),
(NULL, 1, 'img/lg/SONY/sony03.jpg','img/lg/SONY/sony03.jpg'),
(NULL, 1, 'img/lg/SONY/sony04.jpg','img/lg/SONY/sony04.jpg'),
(NULL, 1, 'img/lg/SONY/h2.jpg','img/lg/SONY/h2.jpg'),
(NULL, 1, 'img/lg/SONY/sony05.jpg','img/lg/SONY/sony05.jpg'),
(NULL, 1, 'img/lg/SONY/sony06.jpg','img/lg/SONY/sony06.jpg'),
(NULL, 1, 'img/lg/SONY/sony07.jpg','img/lg/SONY/sony07.jpg'),
(NULL, 1, 'img/lg/SONY/h3.jpg','img/lg/SONY/h3.jpg'),
(NULL, 1, 'img/lg/SONY/sony08.jpg','img/lg/SONY/sony08.jpg'),
(NULL, 1, 'img/lg/SONY/sony09.jpg','img/lg/SONY/sony09.jpg'),
(NULL, 1, 'img/lg/SONY/h4.jpg','img/lg/SONY/h4.jpg'),
(NULL, 1, 'img/lg/SONY/sony10.jpg','img/lg/SONY/sony10.jpg'),
(NULL, 1, 'img/lg/SONY/sony11.jpg','img/lg/SONY/sony11.jpg'),
(NULL, 1, 'img/lg/SONY/sony12.jpg','img/lg/SONY/sony12.jpg'),
(NULL, 2, 'img/lg/LS/ls01.jpg','img/lg/LS/ls01.jpg'),
(NULL, 2, 'img/lg/LS/ls02.jpg','img/lg/LS/ls02.jpg'),
(NULL, 2, 'img/lg/LS/ls03.jpg','img/lg/LS/ls03.jpg'),
(NULL, 2, 'img/lg/LS/ls04.jpg','img/lg/LS/ls04.jpg'),
(NULL, 2, 'img/lg/LS/ls05.jpg','img/lg/LS/ls05.jpg'),
(NULL, 2, 'img/lg/LS/ls06.jpg','img/lg/LS/ls06.jpg'),
(NULL, 2, 'img/lg/LS/ls07.jpg','img/lg/LS/ls07.jpg'),
(NULL, 2, 'img/lg/LS/ls08.jpg','img/lg/LS/ls08.jpg'),
(NULL, 2, 'img/lg/LS/ls09.jpg','img/lg/LS/ls09.jpg'),
(NULL, 2, 'img/lg/LS/ls10.jpg','img/lg/LS/ls10.jpg'),
(NULL, 2, 'img/lg/LS/ls11.jpg','img/lg/LS/ls11.jpg'),
(NULL, 2, 'img/lg/LS/ls12.jpg','img/lg/LS/ls12.jpg'),
(NULL, 2, 'img/lg/LS/ls13.png','img/lg/LS/ls13.png'),
(NULL, 2, 'img/lg/LS/ls14.png','img/lg/LS/ls14.png'),
(NULL, 2, 'img/lg/LS/ls15.png','img/lg/LS/ls15.png'),
(NULL, 2, 'img/lg/LS/ls16.png','img/lg/LS/ls16.png'),
(NULL, 3, 'img/lg/Beat/bt01.jpg','img/lg/SONY/bt01.jpg'),
(NULL, 3, 'img/lg/Beat/bt02.jpg','img/lg/SONY/bt02.jpg'),
(NULL, 3, 'img/lg/Beat/bt03.jpg','img/lg/SONY/bt03.jpg'),
(NULL, 3, 'img/lg/Beat/bt04.jpg','img/lg/SONY/bt04.jpg'),
(NULL, 3, 'img/lg/Beat/bt05.jpg','img/lg/SONY/bt05.jpg'),
(NULL, 3, 'img/lg/Beat/bt06.jpg','img/lg/SONY/bt06.jpg'),
(NULL, 3, 'img/lg/Beat/bt07.jpg','img/lg/SONY/bt07.jpg'),
(NULL, 3, 'img/lg/Beat/bt08.jpg','img/lg/SONY/bt08.jpg'),
(NULL, 3, 'img/lg/Beat/bt09.jpg','img/lg/SONY/bt09.jpg'),
(NULL, 3, 'img/lg/Beat/bt10.jpg','img/lg/SONY/bt10.jpg'),
(NULL, 3, 'img/lg/Beat/bt11.jpg','img/lg/SONY/bt11.jpg'),
(NULL, 3, 'img/lg/Beat/bt12.jpg','img/lg/SONY/bt12.jpg'),
(NULL, 3, 'img/lg/Beat/bt14.jpg','img/lg/SONY/bt14.jpg'),
(NULL, 3, 'img/lg/Beat/bt15.jpg','img/lg/SONY/bt15.jpg'),
(NULL, 3, 'img/lg/Beat/bt16.jpg','img/lg/SONY/bt16.jpg'),
(NULL, 3, 'img/lg/Beat/bt17.jpg','img/lg/SONY/bt17.jpg');


/**鼠标**/
INSERT INTO kg_mouse VALUES
(1,1,'雷蛇（Razer）曼巴眼镜蛇无线版 游戏鼠标','549','雷蛇 Razer','曼巴眼镜蛇无线版','黑色','PAW3390光学引擎','16000DPI','450IPS','9个','CHROMA幻彩灯光系统','磨砂材质','106g','125.7mm x 70mm x 43.2mm','约2.1m编织线缆，附USB延长接口'),
(2,1,'雷蛇（Razer）锐蝮蛇 Lancehead 无线游戏鼠标 16000dpi 5G版 双手通用对称式设计 绝地求生鼠标 吃鸡鼠标','549','雷蛇 Razer','锐蝮蛇','灰色','激光传感器','16000DPI','450IPS','9个独立可编程 Hyperesponse 超快响应按键','CHROMA幻彩灯光系统','磨砂材质','111g','117 毫米（长度）x 71 毫米（宽度）x 38 毫米（高度）','约2.1米'),
(3,1,'雷蛇（Razer）曼巴眼镜蛇精英版 黑色 有线电竞游戏鼠标 绝地求生鼠标 ','349','雷蛇 Razer','曼巴眼镜蛇精英版','黑色','激光传感器','16000DPI','450IPS','9个独立可编程按键','CHROMA幻彩灯光系统','磨砂材质','96g(不包含线缆)','125 （长度）x 70（宽度）x 43.3（高度）','约2.1米'),
(4,1,'雷蛇（Razer）蝰蛇标准版 有线游戏鼠标 人体工程学设计 6400DPI  黑色','139','雷蛇 Razer','雷蛇蝰蛇标准版','黑色','PAW3390光学引擎','6400DPI','450IPS','5个','CHROMA幻彩灯光系统','磨砂材质','96g','约127mm x 73mm x 43mm','约 2.1 米超轻编织纤维线缆'),
(5,1,'雷蛇（Razer）蝰蛇精英版 RGB幻彩 游戏鼠标 电竞鼠标 绝地求生鼠标','469','雷蛇 Razer','蝰蛇精英版','黑色','PMW3389光学引擎','16000DPI','450IPS','7个','CHROMA幻彩灯光系统','磨砂材质','96g','127 毫米（长度）x 73 毫米（宽度）x 43 毫米（高度）','约2.1m'),
(6,1,'雷蛇（Razer）命运2定制 蝰蛇精英版 RGB幻彩游戏鼠标 电竞鼠标 绝地求生鼠标 吃鸡鼠标','319','雷蛇 Razer','蝰蛇精英版','黑色','PMW3389光学引擎','16000DPI','450IPS','7个','CHROMA幻彩灯光系统','磨砂材质','96g','127 毫米（长度）x 73 毫米（宽度）x 43 毫米（高度）','约2.1m'),
(7,1,'雷蛇（Razer）Atheris 刺鳞树蝰无线鼠标 蓝牙2.4GHz双模办公游戏 绝地求生鼠标 吃鸡鼠标','369','雷蛇 Razer','刺鳞树蝰','黑色','光学传感器','7200DPI','450IPS','6个高速响应按键','CHROMA幻彩灯光系统','磨砂材质','66g（不包含电池）','99.5mm × 62.8mm × 34.1mm','约2m'),
(8,1,'雷蛇（Razer）锐蝮蛇 Lancehead 无线游戏鼠标 16000dpi 5G版 双手通用对称式设计 绝地求生鼠标 吃鸡鼠标','699','雷蛇 Razer','锐蝮蛇','灰色','激光传感器','16000DPI','450IPS','9 个独立可编程 Hyperesponse 超快响应按键','CHROMA幻彩灯光系统','磨砂材质','111 g','117 毫米（长度）x 71 毫米（宽度）x 38 毫米（高度）','约2m'),
(9,2,'罗技 （Logitech ）MX ERGO 无线轨迹球-深灰 优联蓝牙连接 可调节转轴 人体工学设计','649','罗技 Logitech','MX ERGO 无线轨迹球','深灰','Logitech 光学追踪技术','320 dpi - 440 dpi','450IPS','8','其他','类肤材质','164.3g','132.5 X 99.8 X 51.4','无线'),
(10,2,'罗技（Logitech）MX Master 2S 无线鼠标 无线蓝牙优联双模跨计算机控制鼠标 儒雅黑','579','罗技 Logitech','MX Mater 2S','黑色','无界激光技术','4000DPI','450IPS','9','其他','磨砂材质','145g','126mm×85.7mm×48.4mm','无线'),
(11,2,'罗技（Logitech）MX Anywhere 2S 无线蓝牙优联双模跨计算机控制鼠标 快速充电 玻璃面可用 旗舰 睿智蓝','459','罗技 Logitech','MX Anywhere 2S','黑色','Logitech 光学追踪技术','4000DPI','450IPS','7','其他','磨砂材质','106g','100.3mm×61.6mm×34.4mm','无线'),
(12,2,'罗技（Logitech）M720 蓝牙优联双模无线鼠标 蓝牙鼠标 侧键 大手鼠标 舒适','289','罗技 Logitech','M720','黑色','Logitech 光学追踪技术','4000DPI','450IPS','8','其他','磨砂材质','135g','115 mm x 74 mm x 45 mm','无线+蓝牙'),
(13,2,'罗技（Logitech）M585 多设备无线鼠标 蓝牙鼠标 蓝牙、优联 砂岩灰','179','罗技 Logitech','M585','黑色','Logitech 光学追踪技术','1000DPI','450IPS','7','其他','类肤材质','135g','103mmX64mmX40mm','无线+蓝牙'),
(14,2,'罗技（Logitech）M590 多设备静音无线鼠标 无线蓝牙优联双模跨计算机控制鼠标 侧键 石墨黑','169','罗技 Logitech','M590','黑色','Logitech 光学追踪技术','1000DPI','450IPS','7','其他','类肤材质','101g','103mmX64mmX40mm','无线+蓝牙'),
(15,2,'罗技（Logitech）M545（M546）无线鼠标 黑色','149','罗技 Logitech','M545','黑色','Logitech 光学追踪技术','1000DPI','450IPS','4','其他','磨砂材质','95.5g','102*58.5*38.4','无线+蓝牙'),
(16,2,'罗技（Logitech）蓝牙鼠标M336（M337）黑色','109','罗技 Logitech','M337','黑色','Logitech 光学追踪技术','1000DPI','450IPS','4','其他','磨砂材质','82g','61.1x100.5x33','无线+蓝牙');




/**鼠标图片**/
INSERT INTO kg_mouse_pic VALUES
(NULL, 1, 'img/product/sm/11.jpg','img/product/lg/11.jpg'),
(NULL, 1, 'img/product/sm/12.jpg','img/product/lg/12.jpg'),
(NULL, 1, 'img/product/sm/13.jpg','img/product/lg/13.jpg'),
(NULL, 1, 'img/product/sm/14.jpg','img/product/lg/14.jpg'),
(NULL, 2, 'img/product/sm/21.jpg','img/product/lg/21.jpg'),
(NULL, 2, 'img/product/sm/22.jpg','img/product/lg/22.jpg'),
(NULL, 2, 'img/product/sm/23.jpg','img/product/lg/23.jpg'),
(NULL, 2, 'img/product/sm/24.jpg','img/product/lg/24.jpg'),
(NULL, 3, 'img/product/sm/31.jpg','img/product/lg/31.jpg'),
(NULL, 3, 'img/product/sm/32.jpg','img/product/lg/32.jpg'),
(NULL, 3, 'img/product/sm/33.jpg','img/product/lg/33.jpg'),
(NULL, 3, 'img/product/sm/34.jpg','img/product/lg/34.jpg'),
(NULL, 4, 'img/product/sm/41.jpg','img/product/lg/41.jpg'),
(NULL, 4, 'img/product/sm/42.jpg','img/product/lg/42.jpg'),
(NULL, 4, 'img/product/sm/43.jpg','img/product/lg/43.jpg'),
(NULL, 4, 'img/product/sm/44.jpg','img/product/lg/44.jpg'), 
(NULL, 5, 'img/product/sm/51.jpg','img/product/lg/51.jpg'),
(NULL, 5, 'img/product/sm/52.jpg','img/product/lg/52.jpg'),
(NULL, 5, 'img/product/sm/53.jpg','img/product/lg/53.jpg'),
(NULL, 5, 'img/product/sm/54.jpg','img/product/lg/54.jpg'),
(NULL, 6, 'img/product/sm/61.jpg','img/product/lg/61.jpg'),
(NULL, 6, 'img/product/sm/62.jpg','img/product/lg/62.jpg'),
(NULL, 6, 'img/product/sm/63.jpg','img/product/lg/63.jpg'),
(NULL, 6, 'img/product/sm/64.jpg','img/product/lg/64.jpg'),
(NULL, 7, 'img/product/sm/71.jpg','img/product/lg/71.jpg'),
(NULL, 7, 'img/product/sm/72.jpg','img/product/lg/72.jpg'),
(NULL, 7, 'img/product/sm/73.jpg','img/product/lg/73.jpg'),
(NULL, 7, 'img/product/sm/74.jpg','img/product/lg/74.jpg'),
(NULL, 8, 'img/product/sm/81.jpg','img/product/lg/81.jpg'),
(NULL, 8, 'img/product/sm/82.jpg','img/product/lg/82.jpg'),
(NULL, 8, 'img/product/sm/83.jpg','img/product/lg/83.jpg'),
(NULL, 8, 'img/product/sm/84.jpg','img/product/lg/84.jpg'),
(NULL, 9, 'img/product/sm/91.jpg','img/product/lg/91.jpg'),
(NULL, 9, 'img/product/sm/92.png','img/product/lg/92.png'),
(NULL, 9, 'img/product/sm/93.png','img/product/lg/93.png'),
(NULL, 9, 'img/product/sm/94.png','img/product/lg/94.png'),
(NULL, 10, 'img/product/sm/101.png','img/product/lg/101.png'),
(NULL, 10, 'img/product/sm/102.png','img/product/lg/102.png'),
(NULL, 10, 'img/product/sm/103.png','img/product/lg/103.png'),
(NULL, 10, 'img/product/sm/104.png','img/product/lg/104.png'),
(NULL, 11, 'img/product/sm/111.png','img/product/lg/111.png'),
(NULL, 11, 'img/product/sm/112.png','img/product/lg/112.png'),
(NULL, 11, 'img/product/sm/113.png','img/product/lg/113.png'),
(NULL, 11, 'img/product/sm/114.png','img/product/lg/114.png'),
(NULL, 12, 'img/product/sm/121.png','img/product/lg/121.png'),
(NULL, 12, 'img/product/sm/122.png','img/product/lg/122.png'),
(NULL, 12, 'img/product/sm/123.png','img/product/lg/123.png'),
(NULL, 12, 'img/product/sm/124.png','img/product/lg/124.png'),
(NULL, 13, 'img/product/sm/131.png','img/product/lg/131.png'),
(NULL, 13, 'img/product/sm/132.png','img/product/lg/132.png'),
(NULL, 13, 'img/product/sm/133.png','img/product/lg/133.png'),
(NULL, 13, 'img/product/sm/134.png','img/product/lg/134.png'),
(NULL, 14, 'img/product/sm/141.png','img/product/lg/141.png'),
(NULL, 14, 'img/product/sm/142.png','img/product/lg/142.png'),
(NULL, 14, 'img/product/sm/143.png','img/product/lg/143.png'),
(NULL, 14, 'img/product/sm/144.png','img/product/lg/144.png'),
(NULL, 15, 'img/product/sm/151.png','img/product/lg/151.png'),
(NULL, 15, 'img/product/sm/152.png','img/product/lg/152.png'),
(NULL, 15, 'img/product/sm/153.png','img/product/lg/153.png'),
(NULL, 15, 'img/product/sm/154.png','img/product/lg/154.png'),
(NULL, 16, 'img/product/sm/161.png','img/product/lg/161.png'),
(NULL, 16, 'img/product/sm/162.png','img/product/lg/162.png'),
(NULL, 16, 'img/product/sm/163.png','img/product/lg/163.png'),
(NULL, 16, 'img/product/sm/164.png','img/product/lg/164.png');


/**键盘**/
INSERT INTO kg_keyboard VALUES
(1,1,'罗技Craft无线键盘智能控制旋钮蓝牙优联双模连接三设备多屏操作',1699.00,'430*149*34mm,K310+M100R黑色','罗技Craft','无','103','490','无线',150123456789,2968,true),
(2,1,'罗技G213有线RGB炫彩背光游戏机械手感键盘绝地求生宏编程带手托',648.00,'452*218*33mm,G213+G102','罗技','背光','117','1.1kg','2m',150123456789,2968,true),
(3,1,'罗技G910游戏RGB炫彩背光电竞机械键盘可编程吃鸡绝地求生',1299.00,'505.5*210*35.5mm,黑色','罗技','幻彩','113','1.5kg','1.8m',150123456789,2968,true),
(4,1,'罗技G810游戏机械键盘鼠标键鼠套装有线电竞机械游戏',1209.00,'505.5*210*35.5mm,G910+G102黑色','罗技','星光','123','1.5kg','1.8m',150123456789,2968,true),
(5,1,'罗技G512有线电竞背光笔记本台式电脑吃鸡游戏机械键盘',179.00,'395*200*32mm,黑色','罗技','支持(蓝光)','87','850g','1.8m',150123456789,2968,true),
(6,1,'罗技Pro RGB 游戏键盘 有线电竞机械手感守望先锋吃鸡键盘 RGB全尺寸游戏键盘',1799.00,'452*218*33mm,黑色','罗技','星光','117','1.1kg','2m',150123456789,2968,true),
(7,2,'Razer雷蛇 黑寡妇蜘蛛竞技幻彩版V2 机械键盘粉晶电竞游戏RGB背光',1499.00,'484*181.5*42,黑色','Razer/雷蛇','幻彩','104','1.46kg','2m',150123456789,2968,true),
(8,2,'雷蛇 Huntsman猎魂光蛛精英版光轴RGB游戏机械键盘电竞吃鸡 精英版  幻彩腕托',1249.00,'448*234*36mm,黑色','Razer/雷蛇','CHROMA幻彩','104','490','2m',150123456789,2968,true),
(9,2,'Razer雷蛇 Cynosa 萨诺狼蛛 专业电竞薄膜游戏键盘 防水',599.00,'457*174*32.8mm,黑色','Razer/雷蛇','CHROMA幻彩','104','878g','1.8m',150123456789,2968,true),
(10,2,'Razer雷蛇 DeathStalker噬魂金蝎有线幻彩背光薄膜游戏电脑键盘',399.00,'460*214*30mm,黑色','Razer/雷蛇','幻彩','104','1.61kg','1.8m',150123456789,2968,true),
(11,2,'Razer雷蛇 黑寡妇蜘蛛X幻彩耀金版 电竞游戏机械键盘有线RGB背光',1999.00,'462*160*50mm,幻彩耀金','Razer/雷蛇','火焰','104','1.44kg','2m',150123456789,2968,true),
(12,2,'Razer雷蛇 黑寡妇蜘蛛X竞技/终极/幻彩版 有线游戏雷蛇绿轴/樱桃青轴真机械键盘 吃鸡键盘 樱桃Cherry青轴终极版（可编程 有背光）',799.00,'463*154*31mm,黑色','Razer/雷蛇','幻彩','107','950g','2m',150123456789,2968,true),
(13,3,'CHERRY樱桃 MX Board 8.0 G80-3888HYAEU-0 RGB 背光游戏机械键盘 白色红轴 绝地求生 吃鸡键盘',1779.00,'351*145*44mm,白色','CHERRY','支持（三色）','87','2.2kg','1.8m',150123456789,2968,true),
(14,3,'Cherry樱桃 MX-BOARD 6.0 发光键盘无冲背光游戏机械键盘红轴青轴',1899.00,'454*147*28.4mm,黑色','CHERRY','CHERRY 全背光键盘','108','1.35kg','2m',150123456789,2968,true),
(15,3,'CHERRY樱桃 轻薄机械键盘 MX-BOARD 2.0',179.00,'446*158*28mm,黑色','CHERRY','无','104','1.05kg','2m',150123456789,2968,true),
(16,3,'CHERRY樱桃 MX BAORD 1.0 RGB G80-3819',1299.00,'446*158*31.5mm,黑色','CHERRY','背光','108','1.25kg','2m',150123456789,2968,true),
(17,3,'CHERRY樱桃 超薄机械键盘 MX-BOARD 3.0',579.00,'458*156*29mm,黑色','CHERRY','背光','108','1.05kg','2m',150123456789,2968,true),
(18,3,'CHERRY樱桃 限量机械键盘 G80-1865',779.00,'455*164*30mm,黑色','CHERRY','背光','108','1.15kg','1.6-1.8m',150123456789,2968,true);



/**键盘图片**/
INSERT INTO kg_keyboard_pic VALUES
(NULL, 1, 
'img/Logitech/SM/Craft-1.png','img/Logitech/LG/Craft-1.png'),
(NULL, 1, 
'img/Logitech/SM/Craft-2.jpg','img/Logitech/LG/Craft-2.jpg'),
(NULL, 1,
 'img/Logitech/SM/Craft-3.jpg','img/Logitech/LG/Craft-3.jpg'),
(NULL, 1,
 'img/Logitech/SM/Craft-4.jpg','img/Logitech/LG/Craft-4.jpg'),
(NULL, 2,
 'img/Logitech/SM/G213-1.jpeg','img/Logitech/LG/G213-1.jpeg'),
(NULL, 2, 
'img/Logitech/SM/G213-2.jpeg','img/Logitech/LG/G213-2.jpeg'),
(NULL, 2, 
'img/Logitech/SM/G213-3.jpeg','img/Logitech/LG/G213-3.jpeg'),
(NULL, 2,
 'img/Logitech/SM/G213-4.jpeg','img/Logitech/LG/G213-4.jpeg'),
(NULL, 3,
 'img/Logitech/SM/G512-1.jpeg','img/Logitech/LG/G512-1.jpeg'),
(NULL, 3,
 'img/Logitech/SM/G512-2.jpeg','img/Logitech/LG/G512-2.jpeg'),
(NULL, 3,
 'img/Logitech/SM/G512-3.jpeg','img/Logitech/LG/G512-3.jpeg'),
(NULL, 3,
 'img/Logitech/SM/G512-4.jpeg','img/Logitech/LG/G512-4.jpeg'),
(NULL, 4,
 'img/Logitech/SM/G810-1.jpeg','img/Logitech/LG/G810-1.jpeg'),
(NULL, 4,
 'img/Logitech/SM/G810-2.jpeg','img/Logitech/LG/G810-2.jpeg'),
(NULL, 4,
 'img/Logitech/SM/G810-3.jpeg','img/Logitech/LG/G810-3.jpeg'),
(NULL, 4,
 'img/Logitech/SM/G810-4.jpeg','img/Logitech/LG/G810-4.jpeg'),
(NULL, 5,
 'img/Logitech/SM/G910-1.png','img/Logitech/LG/G910-1.png'),
(NULL, 5,
 'img/Logitech/SM/G910-2.jpeg','img/Logitech/LG/G910-2.jpeg'),
(NULL, 5,
 'img/Logitech/SM/G910-3.png','img/Logitech/LG/G910-3.png'),
(NULL, 5,
 'img/Logitech/SM/G910-4.jpeg','img/Logitech/LG/G910-4.jpeg'),
(NULL, 6,
'img/Logitech/SM/Pro-1.png','img/Logitech/LG/Pro-1.png'),
(NULL, 6,
'img/Logitech/SM/Pro-2.png','img/Logitech/LG/Pro-2.png'),
(NULL, 6,
'img/Logitech/SM/Pro-3.png','img/Logitech/LG/Pro-3.png'),
(NULL, 6,
'img/Logitech/SM/Pro-4.jpeg','img/Logitech/LG/Pro-4.jpeg'),
(NULL, 7,
'img/Razer/SM/Bwx-1.png','img/Razer/LG/Bwx-1.png'),
(NULL, 7,
'img/Razer/SM/Bwx-2.jpg','img/Razer/LG/Bwx-2.jpg'),
(NULL, 7,
'img/Razer/SM/Bwx-3.jpg','img/Razer/LG/Bwx-3.jpg'),
(NULL, 7,
'img/Razer/SM/Bwx-4.jpg','img/Razer/LG/Bwx-4.jpg'),
(NULL, 8,
'img/Razer/SM/Cyn-1.jpg','img/Razer/LG/Cyn-1.jpg'),
(NULL, 8,
'img/Razer/SM/Cyn-2.jpg','img/Razer/LG/Cyn-2.jpg'),
(NULL, 8,
'img/Razer/SM/Cyn-3.jpg','img/Razer/LG/Cyn-3.jpg'),
(NULL, 8,
'img/Razer/SM/Cyn-4.jpg','img/Razer/LG/Cyn-4.jpg'),
(NULL, 9,
'img/Razer/SM/Dea-1.jpg','img/Razer/LG/Dea-1.jpg'),
(NULL, 9,
'img/Razer/SM/Dea-2.jpg','img/Razer/LG/Dea-2.jpg'),
(NULL, 9,
'img/Razer/SM/Dea-3.jpg','img/Razer/LG/Dea-3.jpg'),
(NULL, 9,
'img/Razer/SM/Dea-4.jpg','img/Razer/LG/Dea-4.jpg'),
(NULL, 10,
'img/Razer/SM/Hun-1.png','img/Razer/LG/Hun-1.png'),
(NULL, 10,
'img/Razer/SM/Hun-2.jpg','img/Razer/LG/Hun-2.jpg'),
(NULL, 10,
'img/Razer/SM/Hun-3.jpg','img/Razer/LG/Hun-3.jpg'),
(NULL, 10,
'img/Razer/SM/Hun-4.jpg','img/Razer/LG/Hun-4.jpg'),
(NULL, 11,
'img/Razer/SM/Rv2-1.jpg','img/Razer/LG/Rv2-1.jpg'),
(NULL, 11,
'img/Razer/SM/Rv2-2.jpg','img/Razer/LG/Rv2-2.jpg'),
(NULL, 11,
'img/Razer/SM/Rv2-3.jpg','img/Razer/LG/Rv2-3.jpg'),
(NULL, 11,
'img/Razer/SM/Rv2-4.jpg','img/Razer/LG/Rv2-4.jpg'),
(NULL, 12,
'img/Razer/SM/X-1.jpg','img/Razer/LG/X-1.jpg'),
(NULL, 12,
'img/Razer/SM/X-2.jpg','img/Razer/LG/X-2.jpg'),
(NULL, 12,
'img/Razer/SM/X-3.jpg','img/Razer/LG/X-3.jpg'),
(NULL, 12,
'img/Razer/SM/X-4.jpg','img/Razer/LG/X-4.jpg'),
(NULL, 13,
'img/Cherry/SM/Ch-1.png','img/Cherry/LG/Ch-1.png'),
(NULL, 13,
'img/Cherry/SM/Ch-2.jpg','img/Cherry/LG/Ch-2.jpg'),
(NULL, 13,
'img/Cherry/SM/Ch-3.jpg','img/Cherry/LG/Ch-3.jpg'),
(NULL, 13,
'img/Cherry/SM/Ch-4.jpg','img/Cherry/LG/Ch-4.jpg'),
(NULL, 14,
'img/Cherry/SM/Che-1.png','img/Cherry/LG/Che-1.png'),
(NULL, 14,
'img/Cherry/SM/Che-2.png','img/Cherry/LG/Che-2.png'),
(NULL, 14,
'img/Cherry/SM/Che-3.png','img/Cherry/LG/Che-3.png'),
(NULL, 14,
'img/Cherry/SM/Che-4.jpg','img/Cherry/LG/Che-4.jpg'),
(NULL, 15,
'img/Cherry/SM/G8-1.jpg','img/Cherry/LG/G8-1.jpg'),
(NULL, 15,
'img/Cherry/SM/G8-2.jpg','img/Cherry/LG/G8-2.jpg'),
(NULL, 15,
'img/Cherry/SM/G8-3.jpg','img/Cherry/LG/G8-3.jpg'),
(NULL, 15,
'img/Cherry/SM/G8-4.jpg','img/Cherry/LG/G8-4.jpg'),
(NULL, 16,
'img/Cherry/SM/Jc-1.jpg','img/Cherry/LG/Jc-1.jpg'),
(NULL, 16,
'img/Cherry/SM/Jc-2.jpg','img/Cherry/LG/Jc-2.jpg'),
(NULL, 16,
'img/Cherry/SM/Jc-3.jpg','img/Cherry/LG/Jc-3.jpg'),
(NULL, 16,
'img/Cherry/SM/Jc-4.jpg','img/Cherry/LG/Jc-4.jpg'),
(NULL, 17,
'img/Cherry/SM/Mx-1.png','img/Cherry/LG/Mx-1.png'),
(NULL, 17,
'img/Cherry/SM/Mx-2.png','img/Cherry/LG/Mx-2.png'),
(NULL, 17,
'img/Cherry/SM/Mx-3.png','img/Cherry/LG/Mx-3.png'),
(NULL, 17,
'img/Cherry/SM/Mx-4.png','img/Cherry/LG/Mx-4.png'),
(NULL, 18,
'img/Cherry/SM/MxB-1.png','img/Cherry/LG/MxB-1.png'),
(NULL, 18,
'img/Cherry/SM/MxB-2.png','img/Cherry/LG/MxB-2.png'),
(NULL, 18,
'img/Cherry/SM/MxB-3.png','img/Cherry/LG/MxB-3.png'),
(NULL, 18,
'img/Cherry/SM/MxB-4.png','img/Cherry/LG/MxB-4.png');


/**用户信息**/
INSERT INTO kg_user VALUES
(NULL, 'tom', '123456', 'tom@qq.com', '13501254567','汤姆', '1'),
(NULL, 'bob', '123456', 'bob@qq.com', '13524234568','鲍勃', '1'),
(NULL, 'tina', '123456', 'tina@qq.com', '13361234569','蒂娜', '0'),
(NULL, 'lucy', '123456', 'lucy@qq.com', '13485234560','露丝', '0');

/****首页轮播广告商品****/
INSERT INTO kg_index_carousel VALUES
(NULL, 'img/lg/LS/ls01.png','轮播广告商品1','product_details.html?lid=1'),
(NULL, 'img/lg/LS/ls04.png','轮播广告商品2','product_details.html?lid=4'),
(NULL, 'img/Razer/SM/Rv2-1.jpg','轮播广告商品3','lookforward.html'),
(NULL, 'img/Razer/SM/Rv2-3.jpg','轮播广告商品4','lookforward.html'),
(NULL, 'img/Razer/SM/Hun-4.jpg','轮播广告商品5','lookforward.html'),
(NULL, 'img/product/sm/31.jpg','轮播广告商品6','lookforward.html'),
(NULL, 'img/lg/SONY/sony07.jpg','轮播广告商品7','lookforward.html');

/****首页商品****/
INSERT INTO kg_index_product VALUES
(NULL, '索尼（SONY）WH-1000XM2 Hi-Res', '智能降噪耳机 头戴式 1000x二代 黑色', 'img/lg/SONY/sony06.jpg', 1649, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '索尼（SONY）WH-1000XM2 Hi-Res', '智能降噪耳机 头戴式 1000x二代 黑色', 'img/lg/SONY/sony07.jpg', 1649, 'product_details.html?lid=2', 1, 1, 1),
(NULL, '索尼（SONY）WH-1000XM2 Hi-Res', '智能降噪耳机 头戴式 1000x二代 黑色', 'img/lg/SONY/sony08.jpg', 1649, 'product_details.html?lid=3', 1, 1, 1),
(NULL, '雷蛇（Razer）Tiamat 迪亚海魔2.2 V2 游戏耳麦 电竞耳机', '头戴式 电脑耳机 绝地求生耳机 吃鸡耳机', 'img/lg/LS/ls04', 1649, 'product_details.html?lid=4', 1, 1, 1),
(NULL, '雷蛇（Razer）Tiamat 迪亚海魔2.2 V2 游戏耳麦 电竞耳机', '头戴式 电脑耳机 绝地求生耳机 吃鸡耳机', 'img/lg/LS/ls02', 1649, 'product_details.html?lid=5', 1, 1, 1),
(NULL, 'Beats Solo3Wireless', '游戏耳机 - Pop 黑 MRRG2PA/A', 'img/lg/Beat/bt10.jpg', 1649, 'product_details.html?lid=6', 1, 1, 1),
(NULL, 'Beats EP头戴式耳机手机电脑耳麦', '降噪运动音乐耳机重低音hifi魔音耳机 黑色', 'img/lg/Beat/bt11.jpg', 1649, 'product_details.html?lid=7', 1, 1, 1),
(NULL, 'beats Beats Solo3 Wireless', '无线蓝牙头戴式运动魔音耳机', 'img/lg/Beat/bt12.jpg', 1649, 'product_details.html?lid=8', 1, 1, 1),
(NULL, '罗技Craft无线键盘智能控制旋钮蓝牙优联双模连接三设备多屏操作', '430*149*34mm,K310+M100R黑色', 'img/Logitech/SM/Craft-1.png', 1699.00, 'product_details.html?lid=9', 1, 1, 1),
(NULL, 'Razer雷蛇 黑寡妇蜘蛛竞技幻彩版V2 机械键盘粉晶电竞游戏RGB背光', '*菜鸟七仓发货 *兼顾耐用  *多媒体键', 'img/Logitech/SM/G213-2.jpeg', 1249.00, 'product_details.html?lid=10', 1, 1, 1),
(NULL, '雷蛇（Razer）曼巴眼镜蛇无线版 游戏鼠标', '雷蛇 Razer 曼巴眼镜蛇无线版 黑色', 'img/product/sm/11.jpg', 549, 'product_details.html?lid=11', 1, 1, 1),
(NULL, 'CHERRY樱桃 超薄机械键盘 MX-BOARD 3.0', '458*156*29mm,黑色', 'img/Logitech/SM/G910-4.jpeg', 579.00, 'product_details.html?lid=12', 1, 1, 1),
(NULL, '罗技 （Logitech ）MX ERGO 无线轨迹球-深灰 优联蓝牙连接 可调节转轴 人体工学设计', '罗技 Logitech MX ERGO 无线轨迹球 深灰', 'img/product/lg/92.png', 649, 'product_details.html?lid=1', 1, 1, 1);





