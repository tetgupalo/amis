/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     16.11.2017 22:13:46                          */
/*==============================================================*/


alter table "Coworker"
   drop constraint FK_COWORKER_COWORKER_COMPANY;

alter table "Coworker"
   drop constraint FK_COWORKER_COWORKER2_USERS;

alter table "Order Item"
   drop constraint "FK_ORDER IT_ORDER ITE_SERVISES";

alter table "Order Item"
   drop constraint "FK_ORDER IT_ORDER ITE_USERS";

alter table "Provide Servises"
   drop constraint "FK_PROVIDE _PROVIDE S_COMPANY";

alter table "Provide Servises"
   drop constraint "FK_PROVIDE _PROVIDE S_SERVISES";

drop table "Company" cascade constraints;

drop index "Coworker_FK";

drop index "Coworker2_FK";

drop table "Coworker" cascade constraints;

drop index "Order Item_FK";

drop index "Order Item2_FK";

drop table "Order Item" cascade constraints;

drop index "Provide Servises_FK";

drop index "Provide Servises2_FK";

drop table "Provide Servises" cascade constraints;

drop table "Servises" cascade constraints;

drop table "Users" cascade constraints;

/*==============================================================*/
/* Table: "Company"                                             */
/*==============================================================*/
create table "Company" 
(
   "company_name"       VARCHAR2(100)        not null,
   "company_email"      VARCHAR2(50)         not null,
   "company_addres"     VARCHAR2(100)        not null,
   "company_phone"      NUMBER(11)           not null,
   constraint PK_COMPANY primary key ("company_name")
);

/*==============================================================*/
/* Table: "Coworker"                                            */
/*==============================================================*/
create table "Coworker" 
(
   "company_name"       VARCHAR2(100)        not null,
   "user_id"            NUMBER(10)           not null,
   constraint PK_COWORKER primary key ("company_name", "user_id")
);

/*==============================================================*/
/* Index: "Coworker2_FK"                                        */
/*==============================================================*/
create index "Coworker2_FK" on "Coworker" (
   "user_id" ASC
);

/*==============================================================*/
/* Index: "Coworker_FK"                                         */
/*==============================================================*/
create index "Coworker_FK" on "Coworker" (
   "company_name" ASC
);

/*==============================================================*/
/* Table: "Order Item"                                          */
/*==============================================================*/
create table "Order Item" 
(
   "servises_name"      VARCHAR2(50)         not null,
   "servises_id"        NUMBER(15)           not null,
   "user_id"            NUMBER(10)           not null,
   constraint "PK_ORDER ITEM" primary key ("servises_name", "servises_id", "user_id")
);

/*==============================================================*/
/* Index: "Order Item2_FK"                                      */
/*==============================================================*/
create index "Order Item2_FK" on "Order Item" (
   "user_id" ASC
);

/*==============================================================*/
/* Index: "Order Item_FK"                                       */
/*==============================================================*/
create index "Order Item_FK" on "Order Item" (
   "servises_name" ASC,
   "servises_id" ASC
);

/*==============================================================*/
/* Table: "Provide Servises"                                    */
/*==============================================================*/
create table "Provide Servises" 
(
   "company_name"       VARCHAR2(100)        not null,
   "servises_name"      VARCHAR2(50)         not null,
   "servises_id"        NUMBER(15)           not null,
   constraint "PK_PROVIDE SERVISES" primary key ("company_name", "servises_name", "servises_id")
);

/*==============================================================*/
/* Index: "Provide Servises2_FK"                                */
/*==============================================================*/
create index "Provide Servises2_FK" on "Provide Servises" (
   "servises_name" ASC,
   "servises_id" ASC
);

/*==============================================================*/
/* Index: "Provide Servises_FK"                                 */
/*==============================================================*/
create index "Provide Servises_FK" on "Provide Servises" (
   "company_name" ASC
);

/*==============================================================*/
/* Table: "Servises"                                            */
/*==============================================================*/
create table "Servises" 
(
   "servises_id"        NUMBER(15)           not null,
   "servises_name"      VARCHAR2(50)         not null,
   "servises_price"     NUMBER(8)            not null,
   constraint PK_SERVISES primary key ("servises_name", "servises_id")
);

/*==============================================================*/
/* Table: "Users"                                               */
/*==============================================================*/
create table "Users" 
(
   "user_id"            NUMBER(10)           not null,
   "user_login"         VARCHAR2(50)         not null,
   "user_password"      VARCHAR2(50)         not null,
   "user_fl_name"       VARCHAR2(100)        not null,
   "user_email"         VARCHAR2(50)         not null,
   "user_coworker"      SMALLINT             not null,
   constraint PK_USERS primary key ("user_id")
);

ALTER TABLE "Users"
	ADD CONSTRAINT chek_user_name_len
	CHECK (length(user_fl_name) <= 99);
	
ALTER TABLE "Users"
	ADD CONSTRAINT chek_user_id_len
	CHECK (length(user_id) = 10);
	
ALTER TABLE "Users"
	ADD CONSTRAINT chek_user_password_len
	CHECK (length(user_password) <= 50);
	
ALTER TABLE "Users"
	ADD CONSTRAINT chek_user_email_len
	CHECK (length(user_email) <= 50);
	
ALTER TABLE "Servises"
	ADD CONSTRAINT chek_servises_id_len
	CHECK (length(servises_id) = 15);	
	
ALTER TABLE "Servises"
	ADD CONSTRAINT chek_user_name_len
	CHECK (length(servises_name) <= 50);	

ALTER TABLE "Users"
  ADD CONSTRAINT email_unique UNIQUE (user_id, user_email);
  
 ALTER TABLE "Users"
  ADD CONSTRAINT user_unique UNIQUE (user_login);
  
 ALTER TABLE "Servises"
  ADD CONSTRAINT id_order_unique UNIQUE (servises_id);
  
 ALTER TABLE "Company"
  ADD CONSTRAINT name_unique UNIQUE (company_name); 

 ALTER TABLE "Users"
  ADD CONSTRAINT check_user_email
  CHECK ( REGEXP_LIKE (user_email, '[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}')); 
  
 ALTER TABLE "Users"
  ADD CONSTRAINT check_user_name
  CHECK ( REGEXP_LIKE (user_fl_name, '[A-Z][a-z]{1,19}','c'));  

ALTER TABLE "Users"
  ADD CONSTRAINT check_user_id
  CHECK ( REGEXP_LIKE (user_id, '[0-9]{A-Z}{a-z}','c'));
  
 ALTER TABLE "Servises"
  ADD CONSTRAINT chek_servises_id
  CHECK ( REGEXP_LIKE (servises_id, '[0-9]{A-Z}{a-z}','c')); 

ALTER TABLE "Servises"
  ADD CONSTRAINT check_servises_name
  CHECK ( REGEXP_LIKE (servises_name, '[A-Z][a-z]{1,19}','c'));  
  
 ALTER TABLE "Company"
  ADD CONSTRAINT check_company_name
  CHECK ( REGEXP_LIKE (company_name, '[A-Z][a-z]{1,19}','c'));  
 
 ALTER TABLE "Company"
  ADD CONSTRAINT check_company_email
  CHECK ( REGEXP_LIKE (company_email, '[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}')); 
  
 ALTER TABLE "Company"
  ADD CONSTRAINT chek_company_phone
  CHECK ( REGEXP_LIKE (company_phone, '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]','c')); 

ALTER TABLE "Servises"
  ADD CONSTRAINT check_servises_price
  CHECK ((servises_price) >= 0);    
  
alter table "Coworker"
   add constraint FK_COWORKER_COWORKER_COMPANY foreign key ("company_name")
      references "Company" ("company_name");

alter table "Coworker"
   add constraint FK_COWORKER_COWORKER2_USERS foreign key ("user_id")
      references "Users" ("user_id");

alter table "Order Item"
   add constraint "FK_ORDER IT_ORDER ITE_SERVISES" foreign key ("servises_name", "servises_id")
      references "Servises" ("servises_name", "servises_id");

alter table "Order Item"
   add constraint "FK_ORDER IT_ORDER ITE_USERS" foreign key ("user_id")
      references "Users" ("user_id");

alter table "Provide Servises"
   add constraint "FK_PROVIDE _PROVIDE S_COMPANY" foreign key ("company_name")
      references "Company" ("company_name");

alter table "Provide Servises"
   add constraint "FK_PROVIDE _PROVIDE S_SERVISES" foreign key ("servises_name", "servises_id")
      references "Servises" ("servises_name", "servises_id");

