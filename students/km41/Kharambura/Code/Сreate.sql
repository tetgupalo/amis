/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/11/2017 11:50:11 AM                       */
/*==============================================================*/

alter table "ORDERS"
   drop constraint "FK_ORDER_USERS HAV_USER";

alter table "ORDERITEM"
   drop constraint "FK_ORDERITE_ORDER HAS_ORDER";

alter table "ORDERITEM"
   drop constraint "FK_ORDERITE_TICKET IN_TICKET";

alter table "USERS"
   drop constraint "FK_USER_USERS HAV_ROLES";

drop index "users have orders_FK";

drop table "ORDERS" cascade constraints;

drop index "Ticket in orders_FK";

drop table "ORDERITEM" cascade constraints;

drop table "Roles" cascade constraints;

drop table "TICKET" cascade constraints;

drop index "Users have roles_FK";

drop table "USERS" cascade constraints;

/*==============================================================*/
/* Table: "ORDERS"                                               */
/*==============================================================*/
create table "ORDERS" 
(
   "user_email"         VARCHAR2(50)         not null,
   "order_date"         DATE                 not null,
   "order_id"           NUMBER(10)           not null,
   constraint PK_ORDER primary key ("user_email", "order_id")
);

/*==============================================================*/
/* Index: "users have orders_FK"                                */
/*==============================================================*/
create index "users have orders_FK" on "ORDERS" (
   "user_email" ASC
);

/*==============================================================*/
/* Table: "ORDERITEM"                                           */
/*==============================================================*/
create table "ORDERITEM"
(
   "ticket_type"        VARCHAR2(30)         not null,
   "user_email"         VARCHAR2(50)         not null,
   "order_id"           NUMBER(10)           not null,
   "tickets_quantity"   NUMBER               not null
);

/*==============================================================*/
/* Index: "ticket in orders_FK"                                 */
/*==============================================================*/
create index "ticket in orders_FK" on "ORDERITEM" (
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
/* Table: "TICKET"                                              */
/*==============================================================*/
create table "TICKET" 
(
   "ticket_type"        VARCHAR2(30)         not null,
   "ticket_price"       NUMBER(8,2)          not null,
   "transport_company"  VARCHAR2(30),
   "AMOUNT"		NUMBER		     not null,
   constraint PK_TICKET primary key ("ticket_type")
);

/*==============================================================*/
/* Table: "USERS"                                               */
/*==============================================================*/
create table "USERS" 
(
   "user_email"         VARCHAR2(50)         not null,
   "role_name"          VARCHAR2(30)         not null,
   "user_password"      VARCHAR2(20)         not null,
   "user_firstname"     VARCHAR2(50)         not null,
   "user_lastname"      VARCHAR2(50)         not null,
   "user_cardnumber"    CHAR(12),
   "user_adress"        VARCHAR2(100),
   constraint PK_USER primary key ("user_email")
);

/*==============================================================*/
/* Index: "Users have roles_FK"                                 */
/*==============================================================*/
create index "Users have roles_FK" on "USERS" (
   "role_name" ASC
);

alter table "ORDERS"
   add constraint "FK_ORDER_USERS HAV_USER" foreign key ("user_email")
      references "USERS" ("user_email");

alter table "ORDERITEM"
   add constraint "FK_ORDERITE_ORDER HAS_ORDER" foreign key ("user_email", "order_id")
      references "ORDERS" ("user_email", "order_id");

alter table "ORDERITEM"
   add constraint "FK_ORDERITE_TICKET IN_TICKET" foreign key ("ticket_type")
      references "TICKET" ("ticket_type");

alter table "USERS"
   add constraint "FK_USER_USERS HAV_ROLES" foreign key ("role_name")
      references "Roles" ("role_name");

alter table "USERS"
   ADD CONSTRAINT valid_unique UNIQUE ("user_email");
   
alter table "USERS"
   ADD CONSTRAINT valid_unique UNIQUE ("user_cardnumber");   
   
alter table "USERS"
   ADD CONSTRAINT checking_password
   CHECK ( REGEXP_LIKE ("user_password", '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));   
   
alter table "USERS"
  ADD CONSTRAINT check_password_lenght
  CHECK(length("user_password")>5 and length("user_password")<21);

alter table "USERS"
  ADD CONSTRAINT check_cardnumber_lenght
  CHECK(length("user_cardnumber")=12);
 
alter table "USERS"
   ADD CONSTRAINT checking_firstname
   CHECK ( REGEXP_LIKE ("user_firstname", '[A-Za-z ,-]{1,20}')); 
 
alter table "USERS"
   ADD CONSTRAINT checking_lastname
   CHECK ( REGEXP_LIKE ("user_lastname", '[A-Za-z ,-]{1,20}')); 

alter table "Roles"
   ADD CONSTRAINT checking_role
   CHECK ( REGEXP_LIKE ("role_name", '[A-Za-z]{4,7}'));   
 
alter table "Roles"
  ADD CONSTRAINT check_role_lenght
  CHECK(length("role_name")>3 and length("role_name")<8);       

alter table "USERS"
  ADD CONSTRAINT check_firstname_lenght
  CHECK(length("user_firstname")>0 and length("user_firstname")<50);
    
alter table "USERS"
  ADD CONSTRAINT check_lastname_lenght
  CHECK(length("user_lastname")>0 and length("user_lastname")<50);      

alter table "TICKET"
  ADD CONSTRAINT check_AMOUNT_lenght
  CHECK("AMOUNT" BETWEEN 0 AND 100000000);

alter table "TICKET"
  ADD CONSTRAINT check_price_lenght
  CHECK(length("ticket_price")>0);
  
  alter table "TICKET"
  ADD CONSTRAINT check_price
  CHECK("ticket_price" BETWEEN 0 AND 10000);

alter table "USERS”
  add constraint check_email
  check ( REGEXP_LIKE (user_email, '[a-z0-9._]+@[a-z0-9._]+\.[a-z]{2,4}'));   

// TRIGGERS

create or replace TRIGGER ticket_amount_update
AFTER INSERT ON "ORDERITEM"
FOR EACH ROW
BEGIN
update "TICKET"
set "AMOUNT" = "AMOUNT" - :NEW."tickets_quantity"
where "ticket_type" = :NEW."ticket_type";
END;

create or replace TRIGGER ID_TRIGGER 
BEFORE INSERT ON "ORDERS"
FOR EACH ROW
BEGIN
  :NEW."order_id" := MY_SEQ.NEXTVAL;
END ID_TRIGGER;
