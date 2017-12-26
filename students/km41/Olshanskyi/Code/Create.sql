/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/11/2017 10:37:18 AM                       */
/*==============================================================*/


alter table "Order"
   drop constraint "FK_ORDER_PHONE IN _PHONE";

alter table "Order"
   drop constraint "FK_ORDER_USER HAS _USER";

alter table "USER"
   drop constraint "FK_USER_USER HAS _ROLES";

drop index "Phone in orders_FK";

drop index "User has orders_FK";

drop table "Order" cascade constraints;

drop table "Phone" cascade constraints;

drop table "Roles" cascade constraints;

drop index "User has role_FK";

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   "id_order"           CHAR(20)             not null,
   "phone_id"           CHAR(30)             not null,
   "user_id"            INTEGER              not null,
   "quantity"           INTEGER              not null,
   constraint PK_ORDER primary key ("id_order")
);

/*==============================================================*/
/* Index: "User has orders_FK"                                  */
/*==============================================================*/
create index "User has orders_FK" on "Order" (
   "user_id" ASC
);

/*==============================================================*/
/* Index: "Phone in orders_FK"                                  */
/*==============================================================*/
create index "Phone in orders_FK" on "Order" (
   "phone_id" ASC
);

/*==============================================================*/
/* Table: "Phone"                                               */
/*==============================================================*/
create table "Phone" 
(
   "phone_id"           CHAR(30)             not null,
   "Model"              VARCHAR2(30)         not null,
   "Description"        VARCHAR2(30),
   "phone_photo"        VARCHAR2(30),
   "price"              NUMBER               not null,
   constraint PK_PHONE primary key ("phone_id")
);

/*==============================================================*/
/* Table: "Roles"                                               */
/*==============================================================*/
create table "Roles" 
(
   "role_name"          VARCHAR2(30)         not null,
   "Description"        VARCHAR2(30),
   constraint PK_ROLES primary key ("role_name")
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   "user_id"            INTEGER              not null,
   "role_name"          VARCHAR2(30)         not null,
   "user_login"         VARCHAR2(30)         not null,
   "user_password"      VARCHAR2(30)         not null,
   "user_email"         VARCHAR2(30)         not null,
   "user_firstname"     VARCHAR2(30),
   "user_lastname"      VARCHAR2(30),
   constraint PK_USER primary key ("user_id")
);

/*==============================================================*/
/* Index: "User has role_FK"                                    */
/*==============================================================*/
create index "User has role_FK" on "USER" (
   "role_name" ASC
);

alter table "Order"
   add constraint "FK_ORDER_PHONE IN _PHONE" foreign key ("phone_id")
      references "Phone" ("phone_id");

alter table "Order"
   add constraint "FK_ORDER_USER HAS _USER" foreign key ("user_id")
      references "USER" ("user_id");

alter table "USER"
   add constraint "FK_USER_USER HAS _ROLES" foreign key ("role_name")
      references "Roles" ("role_name");

alter table "USER"
  add constraint check_email
  check (REGEXP_LIKE (user_email, '[A-Za-z0-9._]+@[A-Za-z0-9._]+\.[A-Za-z]{2,5}'));

alter table "USER"
  add constraint check_login 
  check (REGEXP_LIKE (user_login,'[A-Za-z1-9_]{1,30}','i'));  

alter table "USER"
   ADD CONSTRAINT valid_unique UNIQUE ("user_id");

  alter table "USER"
   ADD CONSTRAINT valid_unique UNIQUE ("user_email");

alter table "USER"
   ADD CONSTRAINT check_password
   CHECK ( REGEXP_LIKE ("user_password", '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));    

 alter table "User"
  ADD CONSTRAINT check_password_lenght
  CHECK(length("user_password")>6 and length("user_password")<20);


 alter table "User"
   ADD CONSTRAINT check_firstname
   CHECK ( REGEXP_LIKE ("user_firstname", '[A-Za-z ,-]{5,25}')); 
 
alter table "User"
   ADD CONSTRAINT check_lastname
   CHECK ( REGEXP_LIKE ("user_lastname", '[A-Za-z ,-]{5,25}')); 

alter table "Phone"
   ADD CONSTRAINT valid_unique UNIQUE ("phone_id");


alter table "Order"
   ADD CONSTRAINT valid_unique UNIQUE ("order_id");

alter table "Roles"
   ADD CONSTRAINT check_role
   CHECK ( REGEXP_LIKE ("role_name", '[A-Za-z]{3,5}'));   
 
alter table "Roles"
  ADD CONSTRAINT check_role_lenght
  CHECK(length("role_name")>2 and length("role_name")<8);  

alter table "User"
  ADD CONSTRAINT check_firstname_lenght
  CHECK(length("user_firstname")>4 and length("user_firstname")<26);
    
alter table "User"
  ADD CONSTRAINT check_lastname_lenght
  CHECK(length("user_lastname")>4 and length("user_lastname")<26);  






