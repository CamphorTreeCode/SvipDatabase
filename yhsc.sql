/*
Navicat MySQL Data Transfer

Source Server         : yx1
Source Server Version : 50628
Source Host           : sh-cdb-q4bxvasa.sql.tencentcdb.com:63359
Source Database       : yhsc

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-07-26 09:49:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for AboutMe
-- ----------------------------
DROP TABLE IF EXISTS `AboutMe`;
CREATE TABLE `AboutMe` (
  `aboutMeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '关于我们的id',
  `aboutMeContent` text COLLATE utf8_bin COMMENT '品牌的内容',
  `aboutMeCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '关于我们时间',
  `aboutMeServer` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '关于我们服务',
  `aboutMeImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '小程序品牌的图片地址',
  PRIMARY KEY (`aboutMeId`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='关于我们';

-- ----------------------------
-- Table structure for Admin
-- ----------------------------
DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员的id',
  `adminPassword` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员的密码',
  `adminAccounts` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员的帐号',
  `adminName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员的昵称',
  `adminState` int(1) DEFAULT NULL COMMENT '管理员的状态 0是超级管理员 1是普通管理员',
  `adminUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员的头像',
  `adminCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员的创建时间',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='超级管理员';

-- ----------------------------
-- Table structure for Fabulous
-- ----------------------------
DROP TABLE IF EXISTS `Fabulous`;
CREATE TABLE `Fabulous` (
  `fabulousId` int(11) NOT NULL AUTO_INCREMENT COMMENT '点赞的id',
  `openId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的唯一标识',
  `fabulousCreatTime` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '点赞的创建时间',
  `learningWorldId` int(11) DEFAULT NULL COMMENT '学习天地的ID',
  PRIMARY KEY (`fabulousId`),
  KEY `Fabulous_learningWorldId` (`learningWorldId`),
  KEY `Fabulous_opneId` (`openId`),
  CONSTRAINT `Fabulous-LearningWorldId` FOREIGN KEY (`learningWorldId`) REFERENCES `LearningWorld` (`learningWorldId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fabulous-opneId` FOREIGN KEY (`openId`) REFERENCES `User` (`openId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='点赞数';

-- ----------------------------
-- Table structure for FranchiseDetails
-- ----------------------------
DROP TABLE IF EXISTS `FranchiseDetails`;
CREATE TABLE `FranchiseDetails` (
  `franchiseDetailsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '加盟展示页面的id',
  `franchiseDetailsImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟展示图片',
  `franchiseDetailsContent` text COLLATE utf8_bin COMMENT '加盟的内容展示',
  `franchiseDetailsCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟的展示详情的创建时间',
  PRIMARY KEY (`franchiseDetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='申请加盟的页面详情的展示';

-- ----------------------------
-- Table structure for Franchiser
-- ----------------------------
DROP TABLE IF EXISTS `Franchiser`;
CREATE TABLE `Franchiser` (
  `franchiserId` int(11) NOT NULL AUTO_INCREMENT COMMENT '加盟的id',
  `franchiseName` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟者姓名',
  `franchiseOrderNmuber` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟的订单号id',
  `franchisePhone` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `franchiseApplyReason` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '申请理由',
  `franchiseConsumption` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '消费平台 0是天猫，1是淘宝',
  `openId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的唯一标识',
  `franchiseCreatTime` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '申请联盟时间',
  `franchiseState` int(1) DEFAULT '0' COMMENT '加盟的状态 0代表待审核  1代表通过  2代表不通过 3帐号已添加',
  `readState` int(1) DEFAULT '0' COMMENT '阅读状态  0表示未读  1表示已读',
  `formId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '模版消息推送formId',
  PRIMARY KEY (`franchiserId`),
  KEY `Franchiser_openId` (`openId`),
  CONSTRAINT `Franchiser-User` FOREIGN KEY (`openId`) REFERENCES `User` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='加盟';

-- ----------------------------
-- Table structure for FranchiserUser
-- ----------------------------
DROP TABLE IF EXISTS `FranchiserUser`;
CREATE TABLE `FranchiserUser` (
  `franchiserUserId` int(11) NOT NULL AUTO_INCREMENT COMMENT '通过加盟的id',
  `openId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的唯一标识',
  `franchiserUserCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟用户通过时间',
  `franchiserUserAccounts` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟用户的帐号',
  `franchiserUserPassword` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟用户的密码',
  `franchiserUserUserName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '加盟用户的昵称',
  `franchiserUserPid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '用户加盟的pid',
  PRIMARY KEY (`franchiserUserId`),
  KEY `FranchiserUser_openId` (`openId`),
  CONSTRAINT `FranchiserUser-User` FOREIGN KEY (`openId`) REFERENCES `User` (`openId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for Learningfabulous
-- ----------------------------
DROP TABLE IF EXISTS `Learningfabulous`;
CREATE TABLE `Learningfabulous` (
  `fabulousId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学习天地点赞ID',
  `openId` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户唯一标识',
  `learningWorldId` int(11) DEFAULT NULL COMMENT '学习天地id',
  `fabulousCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地点赞时间',
  PRIMARY KEY (`fabulousId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for LearningWorld
-- ----------------------------
DROP TABLE IF EXISTS `LearningWorld`;
CREATE TABLE `LearningWorld` (
  `learningWorldId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学习天地id',
  `learningWorldTitle` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地的标题',
  `learningWorldContent` text COLLATE utf8_bin COMMENT '学习天地的内容',
  `learningWorldVideoUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地视频',
  `learningWorldCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地创建时间',
  `learningWorldBrowse` int(11) DEFAULT '0' COMMENT '浏览量',
  `learningWorldFabulous` int(11) DEFAULT '0' COMMENT '点赞',
  `learningWorldState` int(11) DEFAULT '0' COMMENT '学习天地的状态 0代表下架 1代表上架',
  `draftState` int(1) DEFAULT '0' COMMENT '草稿状态：0不是草稿  1是草稿',
  `learningWorldForward` int(11) DEFAULT '0' COMMENT '学习天地转发量',
  `learningWorldVideoImgUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地的视频封面',
  PRIMARY KEY (`learningWorldId`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学习天地';

-- ----------------------------
-- Table structure for LearningWorldImg
-- ----------------------------
DROP TABLE IF EXISTS `LearningWorldImg`;
CREATE TABLE `LearningWorldImg` (
  `learningWorldImgId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学习天地img的id',
  `learningWorldImgUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地图片的地址',
  `learningWorldImgCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '学习天地图片创建时间',
  `learningWorldId` int(11) DEFAULT NULL COMMENT '学习天地的id',
  PRIMARY KEY (`learningWorldImgId`),
  KEY `LearningWorldImg_learningWorldId` (`learningWorldId`),
  CONSTRAINT `LearningWorld-LearningWorld` FOREIGN KEY (`learningWorldId`) REFERENCES `LearningWorld` (`learningWorldId`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for Maintenance
-- ----------------------------
DROP TABLE IF EXISTS `Maintenance`;
CREATE TABLE `Maintenance` (
  `maintenanceId` int(11) NOT NULL AUTO_INCREMENT COMMENT '中央维修的id',
  `maintenanceCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '中央维修的创建时间',
  `maintenanceModel` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '机器型号',
  `maintenancePlatform` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '购买平台 0天猫  1淘宝',
  `maintenanceNumber` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单帐号',
  `maintenanceName` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '维修的姓名',
  `maintenancePhone` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `maintenanceAddress` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '选择地址',
  `maintenanceDetailed` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  `openId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的openid',
  `maintenanceState` int(1) DEFAULT '0' COMMENT '维修申请的状态 0代表待审核  1代表通过  2代表不通过',
  `readState` int(1) DEFAULT '0' COMMENT '阅读状态  0表示未读  1表示已读',
  `formId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '推送消息的id',
  PRIMARY KEY (`maintenanceId`),
  KEY `Maintenance_openId` (`openId`),
  CONSTRAINT `Maintenance-User` FOREIGN KEY (`openId`) REFERENCES `User` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='中央维修';

-- ----------------------------
-- Table structure for MyCard
-- ----------------------------
DROP TABLE IF EXISTS `MyCard`;
CREATE TABLE `MyCard` (
  `myCardId` int(11) NOT NULL AUTO_INCREMENT COMMENT '我的卡卷id',
  `openId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的唯一标识',
  `myCardTitle` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '我的优惠劵的标题',
  `myCardItem_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的id地址',
  `myCardCoupon_click_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '商品优惠券推广链接',
  `myCardZk_final_price` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品折扣价格',
  `myCardPict_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的图片',
  `myCardCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '卡劵的创建时间',
  `myCardCoupon_amount` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '优惠卷的金额',
  `shopId` int(11) DEFAULT NULL COMMENT '关联商品的id',
  PRIMARY KEY (`myCardId`),
  KEY `MyCard_openId` (`openId`),
  CONSTRAINT `MyCard-User` FOREIGN KEY (`openId`) REFERENCES `User` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='我的优惠券';

-- ----------------------------
-- Table structure for Orders
-- ----------------------------
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单Id，订单唯一标识',
  `openId` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户唯一标识',
  `orderCretatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '订单创建时间',
  `orderStatus` int(1) DEFAULT NULL COMMENT '订单状态，0代表未通过审核，1代表通过审核',
  `orderNumber` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for Recipes
-- ----------------------------
DROP TABLE IF EXISTS `Recipes`;
CREATE TABLE `Recipes` (
  `recipesId` int(11) NOT NULL AUTO_INCREMENT COMMENT '食谱的文章id',
  `recipesTitle` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的标题',
  `recipesImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱的图片的地址',
  `recipesBrowse` int(11) DEFAULT NULL COMMENT '食谱文章的阅读量',
  `recipesCreatTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱的创建的时间',
  `recipesTypeId` int(11) DEFAULT NULL COMMENT '食谱的分类id',
  `recipesData` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱的材料',
  `recipesStep` text COLLATE utf8_bin COMMENT '食谱的步骤保存json',
  `recipesTypeState` int(1) DEFAULT NULL COMMENT '上架状态:0是下架 1是上架 2已提交',
  PRIMARY KEY (`recipesId`),
  KEY `RecipesType_recipesTypeId` (`recipesTypeId`),
  CONSTRAINT `Recipes-RecipesType` FOREIGN KEY (`recipesTypeId`) REFERENCES `RecipesType` (`recipesTypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='超级食谱';

-- ----------------------------
-- Table structure for RecipesSwiper
-- ----------------------------
DROP TABLE IF EXISTS `RecipesSwiper`;
CREATE TABLE `RecipesSwiper` (
  `recipesSwiperId` int(11) NOT NULL AUTO_INCREMENT COMMENT '食谱展示图id',
  `recipesSwiperImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱展示图地址',
  `recipesId` int(11) DEFAULT NULL COMMENT '食谱的文章id',
  `recipesSwiperCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱展示图创建时间',
  PRIMARY KEY (`recipesSwiperId`),
  KEY `RecipesSwiper-Recipes` (`recipesId`),
  CONSTRAINT `RecipesSwiper-Recipes` FOREIGN KEY (`recipesId`) REFERENCES `Recipes` (`recipesId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for RecipesType
-- ----------------------------
DROP TABLE IF EXISTS `RecipesType`;
CREATE TABLE `RecipesType` (
  `recipesTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类的id',
  `recipesTypeCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱的创建时间',
  `recipesTypeName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '食谱类目',
  `recipesTypeState` int(1) DEFAULT NULL COMMENT '0是下架 1是上架',
  `recipseTypeImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '分类的图片',
  PRIMARY KEY (`recipesTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='食谱的分类的id';

-- ----------------------------
-- Table structure for Refund
-- ----------------------------
DROP TABLE IF EXISTS `Refund`;
CREATE TABLE `Refund` (
  `refundId` int(11) NOT NULL AUTO_INCREMENT COMMENT '退款 id   标识列',
  `openId` varchar(100) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `refundReason` varchar(1024) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `refundCreateTime` varchar(50) DEFAULT NULL COMMENT '申请 退款时间',
  `refundState` int(1) DEFAULT '1' COMMENT '退款状态    1 待审核  2 已退款  3不通过',
  `phone` varchar(20) DEFAULT NULL COMMENT '退款人电话',
  `formId` varchar(50) DEFAULT NULL,
  `partner_trade_no` varchar(50) DEFAULT NULL,
  `platform` varchar(11) DEFAULT NULL COMMENT '退款商品平台',
  PRIMARY KEY (`refundId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Shop
-- ----------------------------
DROP TABLE IF EXISTS `Shop`;
CREATE TABLE `Shop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的id',
  `shopName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的品牌',
  `shopTitle` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的title',
  `shopModel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的型号',
  `shopState` int(1) DEFAULT '0' COMMENT '商品的上架的状态 0是下架 1是上架 2已提交',
  `shopUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的地址',
  `shopDiscountUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的优惠券地址',
  `shopLable` text COLLATE utf8_bin COMMENT '商品的标签',
  `shopContent` text COLLATE utf8_bin COMMENT '存放小程序的富文本内容',
  `shopDetails` text COLLATE utf8_bin COMMENT '商品的属性 存放json',
  `shopTypeId` int(11) DEFAULT NULL COMMENT '分类的id',
  `shopCretatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品创建时间',
  `TaobaoToken` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '淘口令',
  `shopDiscountMoney` float(11,2) DEFAULT NULL COMMENT '商品优惠面额',
  `touristShopDiscountUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `touristShopDiscountMoney` float(11,0) DEFAULT NULL,
  PRIMARY KEY (`shopId`),
  KEY `Shop_shopTypeId` (`shopTypeId`),
  CONSTRAINT `Shop-ShopType` FOREIGN KEY (`shopTypeId`) REFERENCES `ShopType` (`shopTypeId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品的数据';

-- ----------------------------
-- Table structure for ShopSKU
-- ----------------------------
DROP TABLE IF EXISTS `ShopSKU`;
CREATE TABLE `ShopSKU` (
  `shopSKUId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的skuid',
  `shopId` int(11) DEFAULT NULL COMMENT '商品的id',
  `shopSKUSpecifications` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '选择规格 如选择颜色规格  红色',
  `shopSKU` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku唯一标识',
  `shopSKUImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku切换的地址',
  `shopSKUMoney` float(11,2) DEFAULT NULL COMMENT 'sku商品的价格',
  `shopSKUStock` int(11) DEFAULT NULL COMMENT '商品的sku的库存',
  `shopSKUTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku创建时间',
  PRIMARY KEY (`shopSKUId`),
  KEY `ShopSKU_shopId` (`shopId`),
  CONSTRAINT `ShopSKU-shop` FOREIGN KEY (`shopId`) REFERENCES `Shop` (`shopId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品小程序sku';

-- ----------------------------
-- Table structure for ShopSkuSwiper
-- ----------------------------
DROP TABLE IF EXISTS `ShopSkuSwiper`;
CREATE TABLE `ShopSkuSwiper` (
  `shopSkuSwiperId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sku的轮播图id',
  `shopSkuSwiperUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku的轮播图地址',
  `shopSkuSwiperCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku轮播图的创建时间',
  `shopSKUId` int(11) DEFAULT NULL COMMENT 'skuID',
  PRIMARY KEY (`shopSkuSwiperId`),
  KEY `ShopSkuSwiper_shopSkuSwiperId` (`shopSKUId`),
  CONSTRAINT `ShopSkuSwiper-ShopSKU` FOREIGN KEY (`shopSKUId`) REFERENCES `ShopSKU` (`shopSKUId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ShopSwiper
-- ----------------------------
DROP TABLE IF EXISTS `ShopSwiper`;
CREATE TABLE `ShopSwiper` (
  `shopSwiperId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的轮播图的id',
  `shopSwiperImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '轮播图的地址',
  `shopId` int(11) DEFAULT NULL COMMENT '商品的id',
  `shopSwiperCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的轮播图的创建时间',
  PRIMARY KEY (`shopSwiperId`),
  KEY `ShopSwiper_shopId` (`shopId`),
  CONSTRAINT `ShopSwiper-Shop` FOREIGN KEY (`shopId`) REFERENCES `Shop` (`shopId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=671 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品的轮播图';

-- ----------------------------
-- Table structure for ShopType
-- ----------------------------
DROP TABLE IF EXISTS `ShopType`;
CREATE TABLE `ShopType` (
  `shopTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的分类的id',
  `shopTypeName` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '小程序分类的名称',
  `shopTypeCreateTime` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品的创建时间',
  `shopTypeImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`shopTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for Swiper
-- ----------------------------
DROP TABLE IF EXISTS `Swiper`;
CREATE TABLE `Swiper` (
  `swiperId` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图id 或者类目的id',
  `swiperImg` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '轮播图的地址',
  `swiperCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '轮播图的创建时间',
  `shopId` int(11) NOT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`swiperId`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='首页的轮播图\r\n\r\n首页的类目图';

-- ----------------------------
-- Table structure for Template
-- ----------------------------
DROP TABLE IF EXISTS `Template`;
CREATE TABLE `Template` (
  `templateId` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信小程序的模版信息',
  `temolateTitle` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `templateContent` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '模版内容',
  `templateCreatTime` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '模版的创建或者修改的时间',
  `form_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '微信小程序的form_id 7天之内上传',
  PRIMARY KEY (`templateId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='推送模版消息';

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `openId` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户唯一标识',
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户的id',
  `avatarUrl` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `nickName` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户昵称',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '用户所在国家',
  `language` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `registerDate` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户注册的时间 第一次登录时间',
  PRIMARY KEY (`openId`),
  UNIQUE KEY `user_userId` (`userId`) COMMENT '用来连接简历',
  UNIQUE KEY `user_openid` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=66666711 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';
