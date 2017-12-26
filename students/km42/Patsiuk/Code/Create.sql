/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     20.11.2017 19:57:44                          */
/*==============================================================*/


alter table DISHES
   drop constraint "FK_DISHES_TYPE OF D_TYPEDISH";

alter table "Dish in menu"
   drop constraint "FK_DISH IN _DISH IN M_DISHES";

alter table "Dish in menu"
   drop constraint "FK_DISH IN _DISH IN M_WEDDINGD";

alter table HALL
   drop constraint "FK_HALL_OWN HALL_USERS";

alter table HALL
   drop constraint "FK_HALL_TYPE OF H_TYPEHALL";

alter table "PhotoHall"
   drop constraint "FK_PHOTOHAL_PHOTO OF _HALL";

alter table USERS
   drop constraint "FK_USERS_USER ROLE_ROLE";

alter table "WeddingDay"
   drop constraint "FK_WEDDINGD_BE BRIDE_USERS";

alter table "WeddingDay"
   drop constraint "FK_WEDDINGD_BE BRIDEG_USERS";

alter table "WeddingDay"
   drop constraint "FK_WEDDINGD_HALL IN O_HALL";

drop index "Type of dish_FK";

drop table DISHES cascade constraints;

drop index "Dish in menu_FK";

drop index "Dish in menu2_FK";

drop table "Dish in menu" cascade constraints;

drop index "Own hall_FK";

drop table HALL cascade constraints;

drop index "Photo of hall_FK";

drop table "PhotoHall" cascade constraints;

drop table ROLE cascade constraints;

drop table "TypeDishe" cascade constraints;

drop table "TypeHall" cascade constraints;

drop index "User role`s_FK";

drop table USERS cascade constraints;

drop index "Be bride_FK";

drop index "Be bridegroom_FK";

drop index "Hall in order_FK";

drop table "WeddingDay" cascade constraints;

/*==============================================================*/
/* Table: DISHES                                                */
/*==============================================================*/
create table DISHES 
(
   "DISHES_name"        VARCHAR2(20)         not null,
   "DISHES_type"        VARCHAR2(20),
   "DISHES_weight"      FLOAT                not null,
   "DISHES_price"       FLOAT                not null,
   "DISHES_amount_people" FLOAT                not null,
   constraint PK_DISHES primary key ("DISHES_name")
);

/*==============================================================*/
/* Index: "Type of dish_FK"                                     */
/*==============================================================*/
create index "Type of dish_FK" on DISHES (
   "DISHES_type" ASC
);

/*==============================================================*/
/* Table: "Dish in menu"                                        */
/*==============================================================*/
create table "Dish in menu" 
(
   "DISHES_name"        VARCHAR2(20)         not null,
   "order_num"          NUMBER(5)            not null,
   "DISHES_count"       NUMBER,
   constraint "PK_DISH IN MENU" primary key ("DISHES_name", "order_num")
);

/*==============================================================*/
/* Index: "Dish in menu2_FK"                                    */
/*==============================================================*/
create index "Dish in menu2_FK" on "Dish in menu" (
   "order_num" ASC
);

/*==============================================================*/
/* Index: "Dish in menu_FK"                                     */
/*==============================================================*/
create index "Dish in menu_FK" on "Dish in menu" (
   "DISHES_name" ASC
);

/*==============================================================*/
/* Table: HALL                                                  */
/*==============================================================*/
create table HALL 
(
   "HALL_name"          VARCHAR2(100)        not null,
   "HALL_address"       VARCHAR2(300)        not null,
   "USERS_email"        VARCHAR2(20),
   "HALL_type"          VARCHAR2(20),
   "HALL_area"          FLOAT                not null,
   "HALL_volume"        NUMBER               not null,
   "HALL_prise_for_hour" FLOAT                not null,
   constraint PK_HALL primary key ("HALL_address")
);

/*==============================================================*/
/* Index: "Own hall_FK"                                         */
/*==============================================================*/
create index "Own hall_FK" on HALL (
   "USERS_email" ASC
);

/*==============================================================*/
/* Table: "PhotoHall"                                           */
/*==============================================================*/
create table "PhotoHall" 
(
   "PhotoHall_photo"    VARCHAR2(100)        not null,
   "HALL_address"       VARCHAR2(300),
   "PhotoHall_desc"     CLOB,
   constraint PK_PHOTOHALL primary key ("PhotoHall_photo")
);

/*==============================================================*/
/* Index: "Photo of hall_FK"                                    */
/*==============================================================*/
create index "Photo of hall_FK" on "PhotoHall" (
   "HALL_address" ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE 
(
   "ROLE_type"          VARCHAR2(40)         not null,
   constraint PK_ROLE primary key ("ROLE_type")
);

/*==============================================================*/
/* Table: "TypeDishe"                                           */
/*==============================================================*/
create table "TypeDishe" 
(
   "DISHES_type"        VARCHAR2(20)         not null,
   constraint PK_TYPEDISHE primary key ("DISHES_type")
);

/*==============================================================*/
/* Table: "TypeHall"                                            */
/*==============================================================*/
create table "TypeHall" 
(
   "HALL_type"          VARCHAR2(20)         not null,
   constraint PK_TYPEHALL primary key ("HALL_type")
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS 
(
   "USERS_name"         VARCHAR2(20)         not null,
   "USERS_surname"      VARCHAR2(20)         not null,
   "USERS_phone"        VARCHAR2(20)         not null,
   "USERS_email"        VARCHAR2(20)         not null,
   "ROLE_type"          VARCHAR2(40)         not null,
   "USERS_pass"         VARCHAR2(20)         not null,
   constraint PK_USERS primary key ("USERS_email")
);

/*==============================================================*/
/* Index: "User role`s_FK"                                      */
/*==============================================================*/
create index "User role`s_FK" on USERS (
   "ROLE_type" ASC
);

/*==============================================================*/
/* Table: "WeddingDay"                                          */
/*==============================================================*/
create table "WeddingDay" 
(
   "order_num"          NUMBER(5)            not null,
   "HALL_address"       VARCHAR2(300),
   "USERS_email"        VARCHAR2(20),
   "USE_USERS_email"    VARCHAR2(20),
   "data"               DATE,
   constraint PK_WEDDINGDAY primary key ("order_num")
);

/*==============================================================*/
/* Index: "Hall in order_FK"                                    */
/*==============================================================*/
create index "Hall in order_FK" on "WeddingDay" (
   "HALL_address" ASC
);

/*==============================================================*/
/* Index: "Be bridegroom_FK"                                    */
/*==============================================================*/
create index "Be bridegroom_FK" on "WeddingDay" (
   "USERS_email" ASC
);

/*==============================================================*/
/* Index: "Be bride_FK"                                         */
/*==============================================================*/
create index "Be bride_FK" on "WeddingDay" (
   "USE_USERS_email" ASC
);

alter table DISHES
   add constraint "FK_DISHES_TYPE OF D_TYPEDISH" foreign key ("DISHES_type")
      references "TypeDishe" ("DISHES_type");

alter table "Dish in menu"
   add constraint "FK_DISH IN _DISH IN M_DISHES" foreign key ("DISHES_name")
      references DISHES ("DISHES_name");

alter table "Dish in menu"
   add constraint "FK_DISH IN _DISH IN M_WEDDINGD" foreign key ("order_num")
      references "WeddingDay" ("order_num");

alter table HALL
   add constraint "FK_HALL_OWN HALL_USERS" foreign key ("USERS_email")
      references USERS ("USERS_email");

alter table HALL
   add constraint "FK_HALL_TYPE OF H_TYPEHALL" foreign key ("HALL_type")
      references "TypeHall" ("HALL_type");

alter table "PhotoHall"
   add constraint "FK_PHOTOHAL_PHOTO OF _HALL" foreign key ("HALL_address")
      references HALL ("HALL_address");

alter table USERS
   add constraint "FK_USERS_USER ROLE_ROLE" foreign key ("ROLE_type")
      references ROLE ("ROLE_type");

alter table "WeddingDay"
   add constraint "FK_WEDDINGD_BE BRIDE_USERS" foreign key ("USE_USERS_email")
      references USERS ("USERS_email");

alter table "WeddingDay"
   add constraint "FK_WEDDINGD_BE BRIDEG_USERS" foreign key ("USERS_email")
      references USERS ("USERS_email");

alter table "WeddingDay"
   add constraint "FK_WEDDINGD_HALL IN O_HALL" foreign key ("HALL_address")
      references HALL ("HALL_address");



/*======ADDED MANUALLY=======*/

/*======TABLE USERS=======*/
ALTER TABLE "USERS"
  ADD CONSTRAINT check_USERS_name
  CHECK (REGEXP_LIKE("USERS_name",'^[À-ß²]{1}[à-ÿ³]{2,19}($|\s)','c'));
ALTER TABLE "USERS"
  ADD CONSTRAINT check_USERS_surname
  CHECK (REGEXP_LIKE("USERS_surname",'^[À-ß²]{1}[à-ÿ³]{2,19}($|\s)','c'));
ALTER TABLE "USERS"
  ADD CONSTRAINT unique_id_USERS_phone
  UNIQUE ("USERS_phone");
ALTER TABLE "USERS"
  ADD CONSTRAINT check_USERS_phone
  CHECK (REGEXP_LIKE("USERS_phone",'^\+38-\([0-9]{3}\)-[0-9]{3}-[0-9]{2}-[0-9]{2}($|\s)','c'));
ALTER TABLE "USERS"
  ADD CONSTRAINT check_USERS_email
  CHECK (REGEXP_LIKE ("USERS_email", '^[A-Za-z\.0-9-_]+@[a-z-.]+\.[a-z]{2,3}($|\s)','c'));
  
/*======TABLE ROLE=======*/
ALTER TABLE "ROLE"
  ADD CONSTRAINT check_ROLE_type
  CHECK (REGEXP_LIKE("ROLE_type",'^[À-ß]{1}[à-ÿ³]{2,19}($|\s)','c'));


/*======TABLE TYPE HALL=======*/
ALTER TABLE "TypeHall"
  ADD CONSTRAINT check_type 
  CHECK (REGEXP_LIKE("HALL_type",'^[À-ß]{1}[à-ÿ³]{2,19}($|\s)','c'));

/*======TABLE HALL=======*/
ALTER TABLE "HALL"
  ADD CONSTRAINT check_HALL_name
  CHECK (REGEXP_LIKE("HALL_name",'^[A-ZÀ-ß²¯ªà-ÿ³¿ºa-z -0-9]{2,40}($|\s)','c'));
ALTER TABLE "HALL"
  ADD CONSTRAINT check_address 
  CHECK (REGEXP_LIKE("HALL_address",'^[À-ß][à-ÿ¿]{1,19} (âóë\.|ïðîâóë\.|ïðîñï\.)[À-ß][À-ßà-ÿ¿ "]{1,30}\, [0-9]{1,3}\/[0-9]{1,3}[À-ßà-ÿ]{0,1}($|\s)','c'));  
ALTER TABLE "HALL"
  ADD CONSTRAINT unique_HALL
  UNIQUE ("HALL_name","HALL_address");
ALTER TABLE "HALL"
  ADD CONSTRAINT chek_volume
  CHECK (2<="HALL_volume" and  "HALL_volume"<=500); 
ALTER TABLE "HALL"
  ADD CONSTRAINT chek_area
  CHECK (10<"HALL_area" and "HALL_area"<=200);
ALTER TABLE "HALL"
  ADD CONSTRAINT chek_prise_for_hour
  CHECK (0<"HALL_prise_for_hour");
  
/*======TABLE HALL PHOTO=======*/ 
ALTER TABLE "PhotoHall"
  ADD CONSTRAINT check_photo
  CHECK (REGEXP_LIKE("PhotoHall_photo",'^[A-Zà-ÿ³¿º,?!=+a-z\/\.0-9]{5,50}(\.jpg)($|\s)','c'));
ALTER TABLE "PhotoHall"
  ADD CONSTRAINT check_desc
CHECK ( REGEXP_LIKE ("PhotoHall_desc", '^[A-ZÀ-ß²¯ª][à-ÿ³¿º,?!=+a-z .-0-9]{1,600}($|\s)','c'));

/*======TABLE DISH TYPE=======*/ 
ALTER TABLE "TypeDishe"
  ADD CONSTRAINT check_dish_type
  CHECK (REGEXP_LIKE("DISHES_type",'^[À-ß]{1}[à-ÿ³¿]{2,19}($|\s)','c'));
  
/*======TABLE DISHES=======*/ 
ALTER TABLE "DISHES"
  ADD CONSTRAINT check_name 
  CHECK (REGEXP_LIKE("DISHES_name",'^[A-ZÀ-ß²¯ªà-ÿ³¿ºa-z -0-9]{2,40}($|\s)','c'));  

ALTER TABLE "DISHES"
  ADD CONSTRAINT chek_weight
  CHECK (0<"DISHES_weight" and "DISHES_weight"<1000 ); 

ALTER TABLE "DISHES"
  ADD CONSTRAINT chek_price
  CHECK (0<"DISHES_price"and "DISHES_price"<5000);

ALTER TABLE "DISHES"
  ADD CONSTRAINT chek__amount_people
  CHECK (0<"DISHES_amount_people" and "DISHES_amount_people"<10);
  

/*======TABLE Dish in menu=======*/ 
ALTER TABLE "Dish in menu"
  ADD CONSTRAINT chek_count
  CHECK (0<"DISHES_count"); 

/*======TABLE WEDING DAY=======*/ 
ALTER TABLE "WeddingDay"
  ADD CONSTRAINT chek_num
  CHECK (0<"order_num");
ALTER TABLE "WeddingDay"
  ADD CONSTRAINT chek_data
  CHECK ("data">TO_DATE('2017-12-31', 'YYYY-MM-DD'));

ALTER TABLE "WeddingDay"
  ADD CONSTRAINT unique_data
  UNIQUE ("data","USERS_email", "USE_USERS_email");



