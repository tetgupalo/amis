--------------------------------------------------------
--  File created - вторник-декабря-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AUTH_GROUP_PERMISSIONS_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."AUTH_GROUP_PERMISSIONS_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTH_GROUP_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."AUTH_GROUP_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTH_PERMISSION_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."AUTH_PERMISSION_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTH_USER_GROUPS_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."AUTH_USER_GROUPS_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTH_USER_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."AUTH_USER_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTH_USER_USER_PERMISSIONS_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."AUTH_USER_USER_PERMISSIONS_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DJANGO_ADMIN_LOG_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."DJANGO_ADMIN_LOG_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DJANGO_CONTENT_TYPE_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."DJANGO_CONTENT_TYPE_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DJANGO_MIGRATIONS_SQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."DJANGO_MIGRATIONS_SQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MAIL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."MAIL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MAIL_THEMA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_USER"."MAIL_THEMA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AUTH_GROUP
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."AUTH_GROUP" 
   (	"ID" NUMBER(11,0), 
	"NAME" NVARCHAR2(80)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AUTH_GROUP_PERMISSIONS
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" 
   (	"ID" NUMBER(11,0), 
	"GROUP_ID" NUMBER(11,0), 
	"PERMISSION_ID" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AUTH_PERMISSION
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."AUTH_PERMISSION" 
   (	"ID" NUMBER(11,0), 
	"NAME" NVARCHAR2(255), 
	"CONTENT_TYPE_ID" NUMBER(11,0), 
	"CODENAME" NVARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AUTH_USER
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."AUTH_USER" 
   (	"ID" NUMBER(11,0), 
	"PASSWORD" NVARCHAR2(128), 
	"LAST_LOGIN" TIMESTAMP (6), 
	"IS_SUPERUSER" NUMBER(1,0), 
	"USERNAME" NVARCHAR2(150), 
	"FIRST_NAME" NVARCHAR2(30), 
	"LAST_NAME" NVARCHAR2(30), 
	"EMAIL" NVARCHAR2(254), 
	"IS_STAFF" NUMBER(1,0), 
	"IS_ACTIVE" NUMBER(1,0), 
	"DATE_JOINED" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AUTH_USER_GROUPS
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."AUTH_USER_GROUPS" 
   (	"ID" NUMBER(11,0), 
	"USER_ID" NUMBER(11,0), 
	"GROUP_ID" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AUTH_USER_USER_PERMISSIONS
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" 
   (	"ID" NUMBER(11,0), 
	"USER_ID" NUMBER(11,0), 
	"PERMISSION_ID" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DJANGO_CONTENT_TYPE
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."DJANGO_CONTENT_TYPE" 
   (	"ID" NUMBER(11,0), 
	"APP_LABEL" NVARCHAR2(100), 
	"MODEL" NVARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MAIL
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."MAIL" 
   (	"MESSAGE" VARCHAR2(2000 BYTE), 
	"DATE_MAIL" TIMESTAMP (6), 
	"RUSH_FK" VARCHAR2(40 BYTE), 
	"MAIL_ID" NUMBER(10,0), 
	"DELETED" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MAIL_THEMA
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."MAIL_THEMA" 
   (	"THEMA_FK" VARCHAR2(40 BYTE), 
	"MAIL_ID_FK" NUMBER(10,0), 
	"ID_ARTIFICIAL" NUMBER(10,0), 
	"DELETED" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RUSH
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."RUSH" 
   (	"RUSH" VARCHAR2(40 BYTE), 
	"DELETED" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table THEMA
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."THEMA" 
   (	"THEMA" VARCHAR2(40 BYTE), 
	"DESCRIPTION_THEMA" VARCHAR2(400 BYTE), 
	"DELETED" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEST_USER.AUTH_GROUP
SET DEFINE OFF;
REM INSERTING into TEST_USER.AUTH_GROUP_PERMISSIONS
SET DEFINE OFF;
REM INSERTING into TEST_USER.AUTH_PERMISSION
SET DEFINE OFF;
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('1','Can add log entry','1','add_logentry');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('2','Can change log entry','1','change_logentry');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('3','Can delete log entry','1','delete_logentry');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('4','Can add permission','2','add_permission');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('5','Can change permission','2','change_permission');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('6','Can delete permission','2','delete_permission');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('7','Can add group','3','add_group');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('8','Can change group','3','change_group');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('9','Can delete group','3','delete_group');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('10','Can add user','4','add_user');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('11','Can change user','4','change_user');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('12','Can delete user','4','delete_user');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('13','Can add content type','5','add_contenttype');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('14','Can change content type','5','change_contenttype');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('15','Can delete content type','5','delete_contenttype');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('16','Can add session','6','add_session');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('17','Can change session','6','change_session');
Insert into TEST_USER.AUTH_PERMISSION (ID,NAME,CONTENT_TYPE_ID,CODENAME) values ('18','Can delete session','6','delete_session');
REM INSERTING into TEST_USER.AUTH_USER
SET DEFINE OFF;
REM INSERTING into TEST_USER.AUTH_USER_GROUPS
SET DEFINE OFF;
REM INSERTING into TEST_USER.AUTH_USER_USER_PERMISSIONS
SET DEFINE OFF;
REM INSERTING into TEST_USER.DJANGO_CONTENT_TYPE
SET DEFINE OFF;
Insert into TEST_USER.DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values ('1','admin','logentry');
Insert into TEST_USER.DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values ('2','auth','permission');
Insert into TEST_USER.DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values ('3','auth','group');
Insert into TEST_USER.DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values ('4','auth','user');
Insert into TEST_USER.DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values ('5','contenttypes','contenttype');
Insert into TEST_USER.DJANGO_CONTENT_TYPE (ID,APP_LABEL,MODEL) values ('6','sessions','session');
REM INSERTING into TEST_USER.MAIL
SET DEFINE OFF;
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('orr',to_timestamp('26.12.17 02:02:09,323000000','DD.MM.RR HH24:MI:SSXFF'),'fast','2','0');
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('99',to_timestamp('26.12.17 14:05:20,641000000','DD.MM.RR HH24:MI:SSXFF'),'fast','5','1');
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('51255',to_timestamp('26.12.17 14:05:30,168000000','DD.MM.RR HH24:MI:SSXFF'),'fast','6','1');
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('safasree',to_timestamp('26.12.17 14:23:02,683000000','DD.MM.RR HH24:MI:SSXFF'),'fast','7','1');
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('safasreeaaaaaa',to_timestamp('26.12.17 14:23:19,712000000','DD.MM.RR HH24:MI:SSXFF'),'fast','9','0');
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('fffff',to_timestamp('26.12.17 15:09:18,855000000','DD.MM.RR HH24:MI:SSXFF'),'fast','12','0');
Insert into TEST_USER.MAIL (MESSAGE,DATE_MAIL,RUSH_FK,MAIL_ID,DELETED) values ('fffff',to_timestamp('26.12.17 15:09:31,084000000','DD.MM.RR HH24:MI:SSXFF'),'low','13','0');
REM INSERTING into TEST_USER.MAIL_THEMA
SET DEFINE OFF;
Insert into TEST_USER.MAIL_THEMA (THEMA_FK,MAIL_ID_FK,ID_ARTIFICIAL,DELETED) values ('pomidoru','2','1','0');
REM INSERTING into TEST_USER.RUSH
SET DEFINE OFF;
Insert into TEST_USER.RUSH (RUSH,DELETED) values ('fast','0');
Insert into TEST_USER.RUSH (RUSH,DELETED) values ('llll','1');
Insert into TEST_USER.RUSH (RUSH,DELETED) values ('fsafasf','0');
Insert into TEST_USER.RUSH (RUSH,DELETED) values ('fsafasffasfsaf','1');
Insert into TEST_USER.RUSH (RUSH,DELETED) values ('fsafasffasfsaffsaf','1');
Insert into TEST_USER.RUSH (RUSH,DELETED) values ('low','1');
REM INSERTING into TEST_USER.THEMA
SET DEFINE OFF;
Insert into TEST_USER.THEMA (THEMA,DESCRIPTION_THEMA,DELETED) values ('pomidoru','kak ih sobiratb','0');
Insert into TEST_USER.THEMA (THEMA,DESCRIPTION_THEMA,DELETED) values ('kartoshka','kak kopatb kartoshky','1');
Insert into TEST_USER.THEMA (THEMA,DESCRIPTION_THEMA,DELETED) values ('ignor','ignored list','0');
Insert into TEST_USER.THEMA (THEMA,DESCRIPTION_THEMA,DELETED) values ('ogyrec','kak kopatb ogyrcu','0');
--------------------------------------------------------
--  DDL for Index AUTH_USER_USER_ID_G_94350C0C_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."AUTH_USER_USER_ID_G_94350C0C_U" ON "TEST_USER"."AUTH_USER_GROUPS" ("USER_ID", "GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MAIL_THEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."MAIL_THEMA_PK" ON "TEST_USER"."MAIL_THEMA" ("ID_ARTIFICIAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_GROU_GROUP_ID__0CD325B0_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."AUTH_GROU_GROUP_ID__0CD325B0_U" ON "TEST_USER"."AUTH_GROUP_PERMISSIONS" ("GROUP_ID", "PERMISSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index THEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."THEMA_PK" ON "TEST_USER"."THEMA" ("THEMA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_USER__USER_ID_6A12ED8B
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_USER__USER_ID_6A12ED8B" ON "TEST_USER"."AUTH_USER_GROUPS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_PERMI_CONTENT_TY_2F476E4B
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_PERMI_CONTENT_TY_2F476E4B" ON "TEST_USER"."AUTH_PERMISSION" ("CONTENT_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_GROUP_GROUP_ID_B120CBF9
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_GROUP_GROUP_ID_B120CBF9" ON "TEST_USER"."AUTH_GROUP_PERMISSIONS" ("GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_PERM_CONTENT_T_01AB375A_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."AUTH_PERM_CONTENT_T_01AB375A_U" ON "TEST_USER"."AUTH_PERMISSION" ("CONTENT_TYPE_ID", "CODENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_USER__USER_ID_A95EAD1B
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_USER__USER_ID_A95EAD1B" ON "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RUSH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."RUSH_PK" ON "TEST_USER"."RUSH" ("RUSH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_USER__PERMISSION_1FBB5F2C
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_USER__PERMISSION_1FBB5F2C" ON "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ("PERMISSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_USER__GROUP_ID_97559544
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_USER__GROUP_ID_97559544" ON "TEST_USER"."AUTH_USER_GROUPS" ("GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DJANGO_CO_APP_LABEL_76BD3D3B_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."DJANGO_CO_APP_LABEL_76BD3D3B_U" ON "TEST_USER"."DJANGO_CONTENT_TYPE" ("APP_LABEL", "MODEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_GROUP_PERMISSION_84C5C92E
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."AUTH_GROUP_PERMISSION_84C5C92E" ON "TEST_USER"."AUTH_GROUP_PERMISSIONS" ("PERMISSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index AUTH_USER_USER_ID_P_14A6B632_U
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."AUTH_USER_USER_ID_P_14A6B632_U" ON "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ("USER_ID", "PERMISSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MAIL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_USER"."MAIL_PK" ON "TEST_USER"."MAIL" ("MAIL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger AUTH_GROUP_PERMISSIONS_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."AUTH_GROUP_PERMISSIONS_TR" 
BEFORE INSERT ON "AUTH_GROUP_PERMISSIONS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_GROUP_PERMISSIONS_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."AUTH_GROUP_PERMISSIONS_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTH_GROUP_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."AUTH_GROUP_TR" 
BEFORE INSERT ON "AUTH_GROUP"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_GROUP_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."AUTH_GROUP_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTH_PERMISSION_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."AUTH_PERMISSION_TR" 
BEFORE INSERT ON "AUTH_PERMISSION"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_PERMISSION_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."AUTH_PERMISSION_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTH_USER_GROUPS_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."AUTH_USER_GROUPS_TR" 
BEFORE INSERT ON "AUTH_USER_GROUPS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_USER_GROUPS_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."AUTH_USER_GROUPS_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTH_USER_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."AUTH_USER_TR" 
BEFORE INSERT ON "AUTH_USER"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_USER_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."AUTH_USER_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTH_USER_USER_PERMISSIONS_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."AUTH_USER_USER_PERMISSIONS_TR" 
BEFORE INSERT ON "AUTH_USER_USER_PERMISSIONS"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "AUTH_USER_USER_PERMISSIONS_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."AUTH_USER_USER_PERMISSIONS_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DJANGO_CONTENT_TYPE_TR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."DJANGO_CONTENT_TYPE_TR" 
BEFORE INSERT ON "DJANGO_CONTENT_TYPE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
        SELECT "DJANGO_CONTENT_TYPE_SQ".nextval
        INTO :new."ID" FROM dual;
    END;

/
ALTER TRIGGER "TEST_USER"."DJANGO_CONTENT_TYPE_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MAIL_BIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."MAIL_BIR" 
BEFORE INSERT ON mail
FOR EACH ROW

BEGIN 
SELECT mail_seq.NEXTVAL
INTO :new.mail_id
FROM dual;
END;
/
ALTER TRIGGER "TEST_USER"."MAIL_BIR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MAIL_THEMA_BIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST_USER"."MAIL_THEMA_BIR" 
BEFORE INSERT ON mail_thema
FOR EACH ROW

BEGIN 
SELECT mail_thema_seq.NEXTVAL
INTO :new.id_artificial
FROM dual;
END;


/
ALTER TRIGGER "TEST_USER"."MAIL_THEMA_BIR" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_MAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."ADD_MAIL" (message_p IN mail.message%TYPE, rush_p IN mail.rush_fk%TYPE) AS 
BEGIN
INSERT INTO mail(message, date_mail, rush_fk, mail_id) 
SELECT message_p, CURRENT_TIMESTAMP, rush_p, 1 from dual;
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_MAIL_THEMA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."ADD_MAIL_THEMA" (id_fk_p IN mail_thema.mail_id_fk%TYPE, thema_fk_p IN mail_thema.thema_fk%TYPE) AS 
BEGIN
INSERT INTO mail_thema(mail_id_fk, thema_fk) 
SELECT id_fk_p, thema_fk_p from dual WHERE NOT EXISTS (select mail_id_fk,thema_fk from mail_thema WHERE mail_id_fk = id_fk_p and thema_fk = thema_fk_p);
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_RUSH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."ADD_RUSH" (rush_p IN rush.rush%TYPE) AS 
BEGIN
INSERT INTO rush(rush, deleted) 
SELECT rush_p, 0 from dual WHERE NOT EXISTS (select rush from rush WHERE rush = rush_p);
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_THEMA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."ADD_THEMA" (thema_p IN thema.thema%TYPE, description_p IN thema.description_thema%TYPE) AS 
BEGIN
INSERT INTO thema(thema, description_thema, deleted) 
SELECT thema_p, description_p, 0 from dual WHERE NOT EXISTS (select thema from thema WHERE thema = thema_p);
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_MAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."DELETE_MAIL" (message_p IN mail.message%TYPE) AS 
BEGIN
UPDATE mail
SET deleted = 1
WHERE message = message_p;
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_MAIL_THEMA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."DELETE_MAIL_THEMA" (id_fk_p IN mail_thema.mail_id_fk%TYPE, thema_fk_p IN mail_thema.thema_fk%TYPE) AS 
BEGIN
UPDATE mail_thema
SET deleted = 1
WHERE mail_id_fk = id_fk_p and thema_fk = thema_fk_p;
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_RUSH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."DELETE_RUSH" (rush_p IN rush.rush%TYPE) AS 
BEGIN
UPDATE rush
SET deleted = 1
WHERE rush = rush_p;
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_THEMA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."DELETE_THEMA" (thema_p IN thema.thema%TYPE) AS 
BEGIN
UPDATE thema
SET deleted = 1
WHERE thema = thema_p;
COMMIT; 
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_MAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_MAIL" (mail_id_p IN mail.mail_id%TYPE) IS
cursor  get_mail IS
    SELECT message,date_mail,rush_fk,mail_id FROM mail WHERE mail_id = mail_id_p and deleted = 0;
    l_get_mail get_mail%ROWTYPE;
BEGIN 
OPEN get_mail;
loop 
    fetch get_mail into l_get_mail;
    exit when get_mail%NOTFOUND;
end loop;
close get_mail;
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_MAIL_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_MAIL_ALL" 
(MAIL OUT SYS_REFCURSOR)
AS
MAIL_CUR SYS_REFCURSOR;
BEGIN 
OPEN MAIL_CUR FOR SELECT MESSAGE, DATE_MAIL, RUSH_FK FROM mail WHERE deleted = 0;
MAIL := MAIL_CUR;
END show_mail_all;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_MAIL_THEMA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_MAIL_THEMA" (id_p IN mail_thema.ID_ARTIFICIAL%TYPE) IS
cursor  get_mail_thema IS
    SELECT mail_id_fk, thema_fk FROM mail_thema WHERE ID_ARTIFICIAL = id_p and deleted = 0;
    l_get_mail_thema get_mail_thema%ROWTYPE;
BEGIN 
OPEN get_mail_thema;
loop 
    fetch get_mail_thema into l_get_mail_thema;
    exit when get_mail_thema%NOTFOUND;
end loop;
close get_mail_thema;
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_MAIL_THEMA_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_MAIL_THEMA_ALL" AS
cursor  get_mail_thema_all(delete_num thema.deleted%TYPE) IS
    SELECT thema_fk, mail_id_fk FROM mail_thema WHERE deleted = delete_num;
    deleted_num_as thema.deleted%TYPE;
BEGIN 
deleted_num_as := 0;
OPEN get_mail_thema_all(deleted_num_as);
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_RUSH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_RUSH" (rush_p IN rush.rush%TYPE) IS
cursor  get_rush IS
    SELECT rush FROM rush WHERE rush = rush_p and deleted = 0;
    l_get_rush get_rush%ROWTYPE;
BEGIN 
OPEN get_rush;
loop 
    fetch get_rush into l_get_rush;
    exit when get_rush%NOTFOUND;
end loop;
close get_rush;
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_RUSH_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_RUSH_ALL" 
(RUSH OUT SYS_REFCURSOR)
AS
RUSH_CUR SYS_REFCURSOR;
BEGIN 
OPEN RUSH_CUR FOR SELECT rush from rush where deleted = 0;
RUSH := RUSH_CUR;
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_THEMA_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_THEMA_ALL" 
(THEMA OUT SYS_REFCURSOR)
AS
THEMA_CUR SYS_REFCURSOR;
BEGIN 
OPEN THEMA_CUR FOR SELECT THEMA, DESCRIPTION_THEMA FROM THEMA where DELETED = 0;
THEMA := THEMA_CUR;
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_THEMA_DESCRIPTION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "TEST_USER"."SHOW_THEMA_DESCRIPTION" (thema_p IN thema.thema%TYPE) IS
cursor  get_thema IS
    SELECT thema,description_thema FROM thema WHERE thema = thema_p and deleted = 0;
    l_get_thema get_thema%ROWTYPE;
BEGIN 
OPEN get_thema;
loop 
    fetch get_thema into l_get_thema;
    exit when get_thema%NOTFOUND;
end loop;
close get_thema;
END;

/
--------------------------------------------------------
--  Constraints for Table AUTH_USER_GROUPS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" ADD CONSTRAINT "AUTH_USER_USER_ID_G_94350C0C_U" UNIQUE ("USER_ID", "GROUP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAIL_THEMA
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."MAIL_THEMA" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL_THEMA" ADD CONSTRAINT "MAIL_THEMA_PK" PRIMARY KEY ("ID_ARTIFICIAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."MAIL_THEMA" MODIFY ("ID_ARTIFICIAL" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL_THEMA" MODIFY ("MAIL_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL_THEMA" MODIFY ("THEMA_FK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTH_GROUP_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" ADD CONSTRAINT "AUTH_GROU_GROUP_ID__0CD325B0_U" UNIQUE ("GROUP_ID", "PERMISSION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" MODIFY ("PERMISSION_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTH_USER
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_USER" ADD UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER" ADD CHECK ("IS_ACTIVE" IN (0,1)) ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER" ADD CHECK ("IS_STAFF" IN (0,1)) ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER" ADD CHECK ("IS_SUPERUSER" IN (0,1)) ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER" MODIFY ("DATE_JOINED" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER" MODIFY ("IS_STAFF" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER" MODIFY ("IS_SUPERUSER" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTH_GROUP
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_GROUP" ADD UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_GROUP" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_GROUP" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTH_USER_USER_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ADD CONSTRAINT "AUTH_USER_USER_ID_P_14A6B632_U" UNIQUE ("USER_ID", "PERMISSION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" MODIFY ("PERMISSION_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DJANGO_CONTENT_TYPE
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."DJANGO_CONTENT_TYPE" ADD CONSTRAINT "DJANGO_CO_APP_LABEL_76BD3D3B_U" UNIQUE ("APP_LABEL", "MODEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."DJANGO_CONTENT_TYPE" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."DJANGO_CONTENT_TYPE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table THEMA
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."THEMA" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."THEMA" ADD CONSTRAINT "THEMA_PK" PRIMARY KEY ("THEMA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."THEMA" MODIFY ("THEMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAIL
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."MAIL" ADD CONSTRAINT "MAIL_PK" PRIMARY KEY ("MAIL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."MAIL" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL" MODIFY ("MAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL" MODIFY ("RUSH_FK" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL" MODIFY ("DATE_MAIL" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL" MODIFY ("MESSAGE" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."MAIL" ADD CONSTRAINT "CHECK_MESSAGE" CHECK (REGEXP_LIKE(message, '\s*', 'i')) ENABLE;
--------------------------------------------------------
--  Constraints for Table RUSH
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."RUSH" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."RUSH" ADD CONSTRAINT "RUSH_PK" PRIMARY KEY ("RUSH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."RUSH" MODIFY ("RUSH" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTH_PERMISSION
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_PERMISSION" ADD CONSTRAINT "AUTH_PERM_CONTENT_T_01AB375A_U" UNIQUE ("CONTENT_TYPE_ID", "CODENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_PERMISSION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_PERMISSION" MODIFY ("CONTENT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUTH_PERMISSION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table AUTH_GROUP_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" ADD CONSTRAINT "AUTH_GROU_GROUP_ID_B120CBF9_F" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "TEST_USER"."AUTH_GROUP" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_GROUP_PERMISSIONS" ADD CONSTRAINT "AUTH_GROU_PERMISSIO_84C5C92E_F" FOREIGN KEY ("PERMISSION_ID")
	  REFERENCES "TEST_USER"."AUTH_PERMISSION" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTH_PERMISSION
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_PERMISSION" ADD CONSTRAINT "AUTH_PERM_CONTENT_T_2F476E4B_F" FOREIGN KEY ("CONTENT_TYPE_ID")
	  REFERENCES "TEST_USER"."DJANGO_CONTENT_TYPE" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTH_USER_GROUPS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" ADD CONSTRAINT "AUTH_USER_GROUP_ID_97559544_F" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "TEST_USER"."AUTH_GROUP" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER_GROUPS" ADD CONSTRAINT "AUTH_USER_USER_ID_6A12ED8B_F" FOREIGN KEY ("USER_ID")
	  REFERENCES "TEST_USER"."AUTH_USER" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTH_USER_USER_PERMISSIONS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ADD CONSTRAINT "AUTH_USER_PERMISSIO_1FBB5F2C_F" FOREIGN KEY ("PERMISSION_ID")
	  REFERENCES "TEST_USER"."AUTH_PERMISSION" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "TEST_USER"."AUTH_USER_USER_PERMISSIONS" ADD CONSTRAINT "AUTH_USER_USER_ID_A95EAD1B_F" FOREIGN KEY ("USER_ID")
	  REFERENCES "TEST_USER"."AUTH_USER" ("ID") DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MAIL
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."MAIL" ADD FOREIGN KEY ("RUSH_FK")
	  REFERENCES "TEST_USER"."RUSH" ("RUSH") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MAIL_THEMA
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."MAIL_THEMA" ADD FOREIGN KEY ("THEMA_FK")
	  REFERENCES "TEST_USER"."THEMA" ("THEMA") ENABLE;
  ALTER TABLE "TEST_USER"."MAIL_THEMA" ADD FOREIGN KEY ("MAIL_ID_FK")
	  REFERENCES "TEST_USER"."MAIL" ("MAIL_ID") ENABLE;
