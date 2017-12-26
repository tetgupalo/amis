/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     13.11.2017 11:14:33                          */
/*==============================================================*/


alter table "Fertilizer"
   drop constraint FK_FERTILIZ_FERTILIZE_FLOWERS;

alter table "FlowersOfUser"
   drop constraint "FK_FLOWERSO_CURRENT U_USERS";

alter table "FlowersOfUser"
   drop constraint "FK_FLOWERSO_SELECTED _FLOWERS";

drop index "Fertilizer for flowers_FK";

drop table "Fertilizer" cascade constraints;

drop table "Flowers" cascade constraints;

drop index "Current user_FK";

drop index "Selected flowers_FK";

drop table "FlowersOfUser" cascade constraints;

drop table "Users" cascade constraints;

/*==============================================================*/
/* Table: "Fertilizer"                                          */
/*==============================================================*/
create table "Fertilizer" 
(
   "DoseL"              FLOAT,
   "DoseCount"          FLOAT,
   "FertName"           CHAR(256)            not null,
   "Name"               CHAR(256),
   constraint PK_FERTILIZER primary key ("FertName")
);

/*==============================================================*/
/* Index: "Fertilizer for flowers_FK"                           */
/*==============================================================*/
create index "Fertilizer for flowers_FK" on "Fertilizer" (
   "Name" ASC
);

/*==============================================================*/
/* Table: "Flowers"                                             */
/*==============================================================*/
create table "Flowers" 
(
   "Name"               CHAR(256)            not null,
   "Photo"              LONG,
   "Discription"        CHAR(1024),
   "WaterL"             FLOAT,
   "WaterCount"         FLOAT,
   "Season"             CHAR(256),
   constraint PK_FLOWERS primary key ("Name")
);

/*==============================================================*/
/* Table: "FlowersOfUser"                                       */
/*==============================================================*/
create table "FlowersOfUser" 
(
   "Name"               CHAR(256),
   "Login"              CHAR(256)            not null,
   "id"                 INTEGER              not null,
   constraint PK_FLOWERSOFUSER primary key ("id")
);

/*==============================================================*/
/* Index: "Selected flowers_FK"                                 */
/*==============================================================*/
create index "Selected flowers_FK" on "FlowersOfUser" (
   "Name" ASC
);

/*==============================================================*/
/* Index: "Current user_FK"                                     */
/*==============================================================*/
create index "Current user_FK" on "FlowersOfUser" (
   "Login" ASC
);

/*==============================================================*/
/* Table: "Users"                                               */
/*==============================================================*/
create table "Users" 
(
   "Login"              CHAR(256)            not null,
   "Password"           CHAR(256),
   "Type"               CHAR(256),
   constraint PK_USERS primary key ("Login")
);

alter table "Fertilizer"
   add constraint FK_FERTILIZ_FERTILIZE_FLOWERS foreign key ("Name")
      references "Flowers" ("Name");

alter table "FlowersOfUser"
   add constraint "FK_FLOWERSO_CURRENT U_USERS" foreign key ("Login")
      references "Users" ("Login");

alter table "FlowersOfUser"
   add constraint "FK_FLOWERSO_SELECTED _FLOWERS" foreign key ("Name")
      references "Flowers" ("Name");
      
/* ADDED REGEXP*/

ALTER TABLE "Users"
  ADD CONSTRAINT check_log 
  CHECK (REGEXP_LIKE("Login",'[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}'));
  
ALTER TABLE "Users"
   ADD CONSTRAINT check_len
   CHECK (length("Login") <= 50);
   
ALTER TABLE "Users"
  ADD CONSTRAINT check_password 
  CHECK (REGEXP_LIKE("Password",'[A-Za-z0-9]{6,8}'));
  
ALTER TABLE "Users"
  ADD CONSTRAINT check_type 
  CHECK (REGEXP_LIKE("Type",'[a-z]{4,20}'));
  
 ALTER TABLE "Flowers"
  ADD CONSTRAINT check_name 
  CHECK (REGEXP_LIKE(Name,'[A-Za-z ]{3,30}'));
  
 ALTER TABLE "Flowers"
  ADD CONSTRAINT check_photo 
  CHECK (REGEXP_LIKE(Photo,'[A-Za-z0-9.,:+-_/]{1,2000}'));
  
 ALTER TABLE "Flowers"
  ADD CONSTRAINT check_disc 
  CHECK (REGEXP_LIKE("Discription",'[A-Za-z0-9., ]'));
  
ALTER TABLE "Flowers"
   ADD CONSTRAINT check_disp_len
   CHECK (length("Discription") <= 1000);
  
 ALTER TABLE "Flowers"
  ADD CONSTRAINT check_WL 
  CHECK (REGEXP_LIKE("WaterL",'[0-9,]{1,3}'));
  
 ALTER TABLE "Flowers"
  ADD CONSTRAINT check_WaterCount 
  CHECK (REGEXP_LIKE("WaterCount",'[0-9]{1,2}'));
  
 ALTER TABLE "Flowers"
  ADD CONSTRAINT check_Season 
  CHECK (REGEXP_LIKE("Season",'[A-Za-z]{5,10}'));
  
 ALTER TABLE "Fertilizer"
  ADD CONSTRAINT check_DoseL 
  CHECK (REGEXP_LIKE("DoseL",'[0-9]+.[0-9]{2}'));
  
 ALTER TABLE "Fertilizer"
  ADD CONSTRAINT check_DoseCount 
  CHECK (REGEXP_LIKE("DoseCount",'[0-9]{1,2}'));
  
 ALTER TABLE "Fertilizer"
  ADD CONSTRAINT check_FertName 
  CHECK (REGEXP_LIKE("FertName",'[A-Za-z ]{3,30}'));
  
 ALTER TABLE "Fertilizer"
  ADD CONSTRAINT check_fname 
  CHECK (REGEXP_LIKE("Name",'[A-Za-z ]{3,30}'));
  
 ALTER TABLE "FlowersOfUser"
  ADD CONSTRAINT check_flname 
  CHECK (REGEXP_LIKE("Name",'[A-Za-z ]{3,30}'));
  
 ALTER TABLE "FlowersOfUser"
  ADD CONSTRAINT check_ulogin 
  CHECK (REGEXP_LIKE("Login",'[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}'));
  
 ALTER TABLE "FlowersOfUser"
  ADD CONSTRAINT check_id 
  CHECK (REGEXP_LIKE("id",'[0-9]{1,10}'));

