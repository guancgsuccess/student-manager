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

Date: 2018-01-04 17:14:23
*/


-- ----------------------------
-- Table structure for "TPCS"."TPCS_LAZY"
-- ----------------------------
DROP TABLE "TPCS"."TPCS_LAZY";
CREATE TABLE "TPCS"."TPCS_LAZY" (
"ID" NUMBER(19) NOT NULL ,
"LAZYDATE" DATE NULL ,
"STATUS" number(1),
"REMARKS" varchar2(50),
"USER_ID" NUMBER(19) NULL 
);

-- ----------------------------
-- Records of TPCS_LAZY
-- ----------------------------

-- ----------------------------
-- Indexes structure for table TPCS_LAZY
-- ----------------------------

-- ----------------------------
-- Checks structure for table "TPCS"."TPCS_LAZY"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_LAZY" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TPCS"."TPCS_LAZY"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_LAZY" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "TPCS"."TPCS_LAZY"
-- ----------------------------
ALTER TABLE "TPCS"."TPCS_LAZY" ADD FOREIGN KEY ("USER_ID") REFERENCES "TPCS"."TPCS_USER" ("ID");
