/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.1.0

Source Server         : Jsd1709
Source Server Version : 100200
Source Host           : localhost:1521
Source Schema         : TPCS

Target Server Type    : ORACLE
Target Server Version : 100200
File Encoding         : 65001

Date: 2018-01-04 17:15:20
*/


-- ----------------------------
-- Table structure for "TPCS"."TPCS_USER"
-- ----------------------------
DROP TABLE "TPCS"."TPCS_USER";
CREATE TABLE "TPCS"."TPCS_USER" (
"ID" NUMBER(19) NOT NULL ,
"CREATEDATE" TIMESTAMP(6)  NULL ,
"GENDER" VARCHAR2(255 CHAR) NULL ,
"PASSWORD" VARCHAR2(255 CHAR) NULL ,
"PHONE" VARCHAR2(255 CHAR) NULL ,
"POWER" NUMBER(10) NULL ,
"REALNAME" VARCHAR2(255 CHAR) NULL ,
"REMARK" VARCHAR2(255 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"USERNAME" VARCHAR2(255 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TPCS_USER
-- ----------------------------
INSERT INTO "TPCS"."TPCS_USER" VALUES ('1', TO_TIMESTAMP(' 2018-01-02 18:34:52:930000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'admin', '15906128572', '1', '管成功', '超级管理员', '1', 'admin');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('74', TO_TIMESTAMP(' 2018-01-02 19:38:51:482000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'liuli1108', '18895707365', '0', '刘莉', null, '0', 'lily1108');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('32', TO_TIMESTAMP(' 2018-01-02 19:32:27:678000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '199749', '18130426230', '0', '汪杰如', null, '0', 'piao97');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('33', TO_TIMESTAMP(' 2018-01-02 19:32:28:598000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'hsw0724', '18895700273', '0', '胡舍文', null, '0', 'hushewen');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('72', TO_TIMESTAMP(' 2018-01-02 19:38:36:550000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'ca746411', '15665393458', '0', '刘羿良', null, '0', 'v5876188');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('35', TO_TIMESTAMP(' 2018-01-02 19:32:33:586000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'Wliurui19961205@', '18895729657', '0', '刘瑞', null, '0', 'liurui');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('36', TO_TIMESTAMP(' 2018-01-02 19:32:41:683000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'dahui123', '18130429156', '0', '杨辉', null, '0', 'dahui123');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('37', TO_TIMESTAMP(' 2018-01-02 19:32:42:545000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '123456', '18130429897', '0', '刘腾', null, '0', 'ltttttttttt');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('38', TO_TIMESTAMP(' 2018-01-02 19:32:48:060000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'dabaobaozj520', '18130429895', '0', '赵振东', null, '0', 'emm666');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('39', TO_TIMESTAMP(' 2018-01-02 19:32:48:318000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'lq19950809', '18895701351', '0', '李倩', null, '0', 'liqian19950809');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('40', TO_TIMESTAMP(' 2018-01-02 19:32:50:303000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '515253575859', '13085012232', '0', '王洋', null, '0', 'wyzp123456789');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('41', TO_TIMESTAMP(' 2018-01-02 19:32:51:396000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '123456', '18130427501', '0', '代升扣', null, '0', 'jamesdsk133');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('42', TO_TIMESTAMP(' 2018-01-02 19:32:52:121000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'tkzc8888', '18895701002', '0', '杭诚', null, '0', 'hc123456');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('43', TO_TIMESTAMP(' 2018-01-02 19:32:56:549000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '272727', '18895700257', '0', '宗永健', null, '0', 'wosinimaye');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('44', TO_TIMESTAMP(' 2018-01-02 19:33:03:827000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '123456', '18895702102', '0', '梁青松', null, '0', '543189214');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('45', TO_TIMESTAMP(' 2018-01-02 19:33:05:926000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '18226024415mw', '18226024415', '0', '范梦伟', null, '0', 'fmw123');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('46', TO_TIMESTAMP(' 2018-01-02 19:33:07:005000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'weizi1996223', '18130428159', '0', '韦子', null, '0', 'wz1996223');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('47', TO_TIMESTAMP(' 2018-01-02 19:33:21:141000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '112233..', '18895701440', '0', '方诤言', null, '0', 'fzyfzy');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('48', TO_TIMESTAMP(' 2018-01-02 19:33:25:720000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '19970104', '18895701508', '0', '孙玉林', null, '0', '2014110635');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('49', TO_TIMESTAMP(' 2018-01-02 19:33:27:736000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '456852', '18130426587', '0', '李周', null, '0', 'lzzzzz');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('50', TO_TIMESTAMP(' 2018-01-02 19:33:28:268000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '18895700356', '18895700356', '0', '张德惠', null, '0', 'zdh18895700356');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('51', TO_TIMESTAMP(' 2018-01-02 19:33:29:864000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'asdf23456asdf', '15555726270', '0', '赵善兵', null, '0', 'tzsxzsb');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('52', TO_TIMESTAMP(' 2018-01-02 19:33:32:192000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '123456', '18130427501', '0', '代升扣', null, '0', 'jamesdsk133');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('30', TO_TIMESTAMP(' 2018-01-02 19:31:56:748000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '199749', '18130426230', '0', '汪杰如', null, '0', 'piao97');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('53', TO_TIMESTAMP(' 2018-01-02 19:33:37:592000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '52101314', '18895700526', '0', '赵帅', null, '0', '172438157');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('54', TO_TIMESTAMP(' 2018-01-02 19:33:44:249000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '363636', '18096607567', '0', '王娇', null, '0', 'qazxsw');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('55', TO_TIMESTAMP(' 2018-01-02 19:33:48:362000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '515253575859', '13085012232', '0', '王洋', null, '0', 'wyzp123456789');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('56', TO_TIMESTAMP(' 2018-01-02 19:34:11:380000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'jiangnan', '18055709983', '0', '江南', null, '0', '0123456');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('57', TO_TIMESTAMP(' 2018-01-02 19:34:13:944000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'dabaobaozj520', '18130429895', '0', '赵振东', null, '0', 'emm666');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('58', TO_TIMESTAMP(' 2018-01-02 19:34:19:705000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '152386', '18895707347', '0', '刘晨', null, '0', 'fffffff');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('59', TO_TIMESTAMP(' 2018-01-02 19:34:21:140000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'yang19950126', '18895700521', '0', '杨凯', null, '0', '0521yk');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('60', TO_TIMESTAMP(' 2018-01-02 19:34:30:690000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '272727', '18895700257', '0', '宗永健', null, '0', 'wosinimaye');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('61', TO_TIMESTAMP(' 2018-01-02 19:34:46:961000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'Yingjingping', '18130425779', '0', '殷金平', null, '0', '8323yjp');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('62', TO_TIMESTAMP(' 2018-01-02 19:34:50:288000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'wmy18895703200', '17358007087', '0', '王孟玉', null, '0', 'wmy666');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('63', TO_TIMESTAMP(' 2018-01-02 19:35:00:298000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '651392533', '18895701007', '0', '张健', null, '0', 'zj6513');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('64', TO_TIMESTAMP(' 2018-01-02 19:35:12:325000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '88888888', '18130426403', '0', '李晶晶', null, '0', 'wawa0818');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('65', TO_TIMESTAMP(' 2018-01-02 19:35:18:362000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '888888', '13083028705', '0', '韩风', null, '0', 'hanfeng123');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('66', TO_TIMESTAMP(' 2018-01-02 19:35:21:520000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'wyzp941114fe', '15556299063', '0', '郑佩', null, '0', 'beazheng');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('67', TO_TIMESTAMP(' 2018-01-02 19:35:22:487000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'zhumeiwujun123', '18895701779', '0', '吴晓宇', null, '0', 'wuxiaoyu');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('68', TO_TIMESTAMP(' 2018-01-02 19:36:09:554000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '/*-+/*-+', '13470715552', '0', '黄贲', null, '0', 'hbens0');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('69', TO_TIMESTAMP(' 2018-01-02 19:36:14:582000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '20180101', '18895701437', '0', '储震', null, '0', '2014110605');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('70', TO_TIMESTAMP(' 2018-01-02 19:36:39:720000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '000000', '13167777903', '0', '文正言', null, '0', 'wenzhengyan');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('71', TO_TIMESTAMP(' 2018-01-02 19:37:56:215000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '88888888', '18130426403', '0', '李晶晶', null, '0', 'wawa0818');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('73', TO_TIMESTAMP(' 2018-01-02 19:38:47:673000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '959611', '18130428801', '0', '曹银', null, '0', 'caoyin1995');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('75', TO_TIMESTAMP(' 2018-01-02 19:39:09:737000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', 'zxcvbnm', '18895706695', '0', '雷为伟', null, '0', 'lww199');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('84', TO_TIMESTAMP(' 2018-01-03 08:58:57:882000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '000000', '18895700769', '0', '刘庆', null, '0', '000000');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('85', TO_TIMESTAMP(' 2018-01-03 08:59:31:259000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'LXWWG9628', '18895701454', '0', '李晓皖', null, '0', 'tlibll');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('83', TO_TIMESTAMP(' 2018-01-03 08:57:42:301000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '123456789', '18895701017', '0', '张晓倩', null, '0', 'zzzzxq');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('86', TO_TIMESTAMP(' 2018-01-03 08:59:44:260000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '000000', '18895707685', '0', '徐丽丽', null, '0', '111111');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('87', TO_TIMESTAMP(' 2018-01-03 09:01:07:455000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '19950728', '18895700206', '0', '李傲雨', null, '0', 'mo958669827');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('88', TO_TIMESTAMP(' 2018-01-03 09:01:59:665000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '887037992839', '18856582839', '0', '张天娇', null, '0', '666888');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('89', TO_TIMESTAMP(' 2018-01-03 09:02:08:221000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'LIUYEQING265326', '18895700639', '0', '刘叶青', null, '0', 'lyq5326');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('90', TO_TIMESTAMP(' 2018-01-03 09:02:21:745000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'yf12201220', '18895701901', '0', '杨菲', null, '0', 'yffff666');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('91', TO_TIMESTAMP(' 2018-01-03 09:03:12:933000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'Iwb622923', '18895701713', '0', '汪蓓', null, '0', '666666');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('92', TO_TIMESTAMP(' 2018-01-03 09:04:51:982000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'chenxiaolu0728', '15556248900', '0', '陈曦', null, '0', '2014110353');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('93', TO_TIMESTAMP(' 2018-01-03 09:05:01:823000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '123123', '18895701014', '0', '李晓冉', null, '0', 'lixiaoran1');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('94', TO_TIMESTAMP(' 2018-01-03 09:09:35:381000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'n000126', '18130426466', '0', '聂男男', null, '0', 'nnn123');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('95', TO_TIMESTAMP(' 2018-01-03 09:13:21:363000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', '123123', '18895701014', '0', '李晓冉', null, '0', 'lixiaoran01');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('96', TO_TIMESTAMP(' 2018-01-03 10:31:00:586000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'F', 'yjl772171lily', '17755740269', '0', '袁金玲', null, '0', 'yjl777');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('97', TO_TIMESTAMP(' 2018-01-03 10:38:37:060000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '1234567890', '18895707061', '0', '李博', null, '0', 'java8888');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('104', TO_TIMESTAMP(' 2018-01-03 19:07:44:262000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '0987654321', '13135570630', '0', '朱继旺', null, '0', 'java999');
INSERT INTO "TPCS"."TPCS_USER" VALUES ('114', TO_TIMESTAMP(' 2018-01-04 12:25:02:215000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'M', '12q12q', '15906128571', '0', '管管', null, '0', 'success');

-- ----------------------------
-- Indexes structure for table TPCS_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table "TPCS"."TPCS_USER"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_USER" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TPCS"."TPCS_USER"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_USER" ADD PRIMARY KEY ("ID");