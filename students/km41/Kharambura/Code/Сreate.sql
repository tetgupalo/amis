/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/11/2017 11:50:11 AM                       */
/*==============================================================*/


alter table "Order"
   drop constraint "FK_ORDER_USERS HAV_USER";

alter table "OrderItem"
   drop constraint "FK_ORDERITE_ORDER HAS_ORDER";

alter table "OrderItem"
   drop constraint "FK_ORDERITE_TICKET IN_TICKET";

alter table "User"
   drop constraint "FK_USER_USERS HAV_ROLES";

drop index "users have orders_FK";

drop table "Order" cascade constraints;

drop index "ticket in orders_FK";

drop table "OrderItem" cascade constraints;

drop table "Roles" cascade constraints;

drop table "Ticket" cascade constraints;

drop index "Users have roles_FK";

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   "user_email"         VARCHAR2(20)         not null,
   "order_date"         DATE                 not null,
   "order_id"           VARCHAR2(10)         not null,
   constraint PK_ORDER primary key ("user_email", "order_id")
);

/*==============================================================*/
/* Index: "users have orders_FK"                                */
/*==============================================================*/
create index "users have orders_FK" on "Order" (
   "user_email" ASC
);

/*==============================================================*/
/* Table: "OrderItem"                                           */
/*==============================================================*/
create table "OrderItem" 
(
   "ticket_type"        VARCHAR2(30)         not null,
   "user_email"         VARCHAR2(20)         not null,
   "order_id"           VARCHAR2(10)         not null,
   "tickets_quantity"   NUMBER               not null,
   constraint PK_ORDERITEM primary key ("user_email", "order_id")
);

/*==============================================================*/
/* Index: "ticket in orders_FK"                                 */
/*==============================================================*/
create index "ticket in orders_FK" on "OrderItem" (
   "ticket_type" ASC
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
/* Table: "Ticket"                                              */
/*==============================================================*/
create table "Ticket" 
(
   "ticket_type"        VARCHAR2(30)         not null,
   "ticket_price"       NUMBER(8,2)          not null,
   "transport_company"  VARCHAR2(30),
   constraint PK_TICKET primary key ("ticket_type")
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   "user_email"         VARCHAR2(20)         not null,
   "role_name"          VARCHAR2(30)         not null,
   "user_password"      VARCHAR2(20)         not null,
   "user_firstname"     VARCHAR2(20)         not null,
   "user_lastname"      VARCHAR2(20)         not null,
   "user_cardnumber"    CHAR(12),
   "user_adress"        VARCHAR2(100),
   constraint PK_USER primary key ("user_email")
);

/*==============================================================*/
/* Index: "Users have roles_FK"                                 */
/*==============================================================*/
create index "Users have roles_FK" on "User" (
   "role_name" ASC
);

alter table "Order"
   add constraint "FK_ORDER_USERS HAV_USER" foreign key ("user_email")
      references "User" ("user_email");

alter table "OrderItem"
   add constraint "FK_ORDERITE_ORDER HAS_ORDER" foreign key ("user_email", "order_id")
      references "Order" ("user_email", "order_id");

alter table "OrderItem"
   add constraint "FK_ORDERITE_TICKET IN_TICKET" foreign key ("ticket_type")
      references "Ticket" ("ticket_type");

alter table "User"
   add constraint "FK_USER_USERS HAV_ROLES" foreign key ("role_name")
      references "Roles" ("role_name");

alter table "User"
   ADD CONSTRAINT valid_unique UNIQUE ("user_email");
   
alter table "User"
   ADD CONSTRAINT valid_unique UNIQUE ("user_cardnumber")   
   
alter table "OrderItem"
   ADD CONSTRAINT valid_unique UNIQUE ("order_id");
   
alter table "User"
   ADD CONSTRAINT checking_password
   CHECK ( REGEXP_LIKE ("user_password", '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));   
   
alter table "User"
  ADD CONSTRAINT check_password_lenght
  CHECK(length("user_password")>5 and length("user_password")<21);

alter table "User"
  ADD CONSTRAINT check_cardnumber_lenght
  CHECK(length("user_cardnumber")=12;
 
alter table "User"
   ADD CONSTRAINT checking_firstname
   CHECK ( REGEXP_LIKE ("user_firstname", '[A-Za-z ,-]{1,20}')); 
 
alter table "User"
   ADD CONSTRAINT checking_lastname
   CHECK ( REGEXP_LIKE ("user_lastname", '[A-Za-z ,-]{1,20}')); 

alter table "Roles"
   ADD CONSTRAINT checking_role
   CHECK ( REGEXP_LIKE ("role_name", '[A-Za-z]{4,7}'));   
 
alter table "Roles"
  ADD CONSTRAINT check_role_lenght
  CHECK(length("role_name")>3 and length("role_name")<8);       

alter table "User"
  ADD CONSTRAINT check_firstname_lenght
  CHECK(length("user_firstname")>0 and length("user_firstname")<21);
    
alter table "User"
  ADD CONSTRAINT check_lastname_lenght
  CHECK(length("user_lastname")>0 and length("user_lastname")<21);       
        
alter table "User"
   ADD CONSTRAINT checking_user_adress
   CHECK ( REGEXP_LIKE ("user_adress", '[A-Za-z 0-9.,-]{10, 100}'));   
 
alter table "User"
  ADD CONSTRAINT check_ruser_adress
  CHECK(length("user_adress")>9 and length("user_adress")<101);         
   
