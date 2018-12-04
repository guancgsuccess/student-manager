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

Date: 2018-01-04 17:14:56
*/


-- ----------------------------
-- Table structure for "TPCS"."TPCS_LEAVE"
-- ----------------------------
DROP TABLE "TPCS"."TPCS_LEAVE";
CREATE TABLE "TPCS"."TPCS_LEAVE" (
"ID" NUMBER(19) NOT NULL ,
"DAY" NUMBER(10) NULL ,
"ENDDATE" TIMESTAMP(6)  NULL ,
"HOURS" FLOAT NULL ,
"PHONE" VARCHAR2(255 CHAR) NULL ,
"REMARKS" VARCHAR2(255 CHAR) NULL ,
"STARTDATE" TIMESTAMP(6)  NULL ,
"USER_ID" NUMBER(19) NULL ,
"REALNAME" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TPCS_LEAVE
-- ----------------------------
INSERT INTO "TPCS"."TPCS_LEAVE" VALUES ('110', '0', TO_TIMESTAMP(' 2018-01-03 10:30:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1.5', '18895701440', '陪同班长朱继旺一起去医院看喉咙', TO_TIMESTAMP(' 2018-01-03 09:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '47', '方诤言');
INSERT INTO "TPCS"."TPCS_LEAVE" VALUES ('108', '2', TO_TIMESTAMP(' 2017-12-28 09:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '0', '13167777903', '生病住院.', TO_TIMESTAMP(' 2017-12-26 09:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '70', '文正言');
INSERT INTO "TPCS"."TPCS_LEAVE" VALUES ('109', '0', TO_TIMESTAMP(' 2018-01-03 10:30:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '1.5', '13135570630', '吃食堂馒头,卡主喉咙了.去了医院.', TO_TIMESTAMP(' 2018-01-03 09:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '104', '朱继旺');
INSERT INTO "TPCS"."TPCS_LEAVE" VALUES ('111', '1', TO_TIMESTAMP(' 2017-12-28 09:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '6', '18895700273', '请假面试', TO_TIMESTAMP(' 2017-12-26 14:30:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '33', '胡舍文');

-- ----------------------------
-- Indexes structure for table TPCS_LEAVE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "TPCS"."TPCS_LEAVE"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_LEAVE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TPCS"."TPCS_LEAVE"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_LEAVE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "TPCS"."TPCS_LEAVE"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_LEAVE" ADD FOREIGN KEY ("USER_ID") REFERENCES "TPCS"."TPCS_USER" ("ID");
