/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     15.11.2017 21:59:32                          */
/*==============================================================*/


alter table List
   drop constraint FK_USER_CREATE_LIST;

alter table List
   drop constraint FK_PRODUCTS_IN_LIST;

alter table "Order"
   drop constraint FK_BOOKING_LIST;

alter table "Prodact in the shop"
   drop constraint FK_PRODACT_IN_SHOP;

alter table "Prodact in the shop"
   drop constraint FK_SHOP_SELLS_PRODUCTS;

drop index "Product belonsg to the list_FK";

drop index "Creation of the list_FK";

drop table List cascade constraints;

drop index "Booking an order_FK";

drop table "Order" cascade constraints;

drop index "Selles products_FK";

drop index "Selles products2_FK";

drop table "Prodact in the shop" cascade constraints;

drop table Product cascade constraints;

drop table Shop cascade constraints;

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: List                                                  */
/*==============================================================*/
create table List 
(
   product_name         VARCHAR2(30)         not null,
   shop_id              INTEGER              not null,
   user_email           VARCHAR2(20)         not null,
   list_id              INTEGER              not null,
   product_quantity     INTEGER              not null,
   constraint PK_LIST primary key (product_name, shop_id, user_email, list_id)
);

/*==============================================================*/
/* Index: "Creation of the list_FK"                             */
/*==============================================================*/
create index "Creation of the list_FK" on List (
   user_email ASC
);

/*==============================================================*/
/* Index: "Product belonsg to the list_FK"                      */
/*==============================================================*/
create index "Product belonsg to the list_FK" on List (
   product_name ASC,
   shop_id ASC
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   product_name         VARCHAR2(30)         not null,
   shop_id              INTEGER              not null,
   user_email           VARCHAR2(20)         not null,
   list_id              INTEGER              not null,
   order_id             INTEGER              not null,
   order_date           VARCHAR2(20)         not null,
   constraint PK_ORDER primary key (product_name, shop_id, user_email, list_id, order_id)
);

/*==============================================================*/
/* Index: "Booking an order_FK"                                 */
/*==============================================================*/
create index "Booking an order_FK" on "Order" (
   product_name ASC,
   shop_id ASC,
   user_email ASC,
   list_id ASC
);

/*==============================================================*/
/* Table: "Prodact in the shop"                                 */
/*==============================================================*/
create table "Prodact in the shop" 
(
   product_name         VARCHAR2(30)         not null,
   shop_id              INTEGER              not null,
   adding_date          VARCHAR2(20)         not null,
   constraint "PK_PRODACT IN THE SHOP" primary key (product_name, shop_id)
);

/*==============================================================*/
/* Index: "Selles products2_FK"                                 */
/*==============================================================*/
create index "Selles products2_FK" on "Prodact in the shop" (
   shop_id ASC
);

/*==============================================================*/
/* Index: "Selles products_FK"                                  */
/*==============================================================*/
create index "Selles products_FK" on "Prodact in the shop" (
   product_name ASC
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product 
(
   product_name         VARCHAR2(30)         not null,
   product_tm           VARCHAR2(25)         not null,
   product_country      VARCHAR2(20)         not null,
   product_price        FLOAT(10)            not null,
   product_category     VARCHAR2(18)         not null,
   product_photo        VARCHAR2(60),         
   constraint PK_PRODUCT primary key (product_name)
);

/*==============================================================*/
/* Table: Shop                                                  */
/*==============================================================*/
create table Shop 
(
   shop_id              INTEGER              not null,
   shop_adress          VARCHAR2(30)         not null,
   shop_name            VARCHAR2(20)         not null,
   shop_email           VARCHAR2(18)         not null,
   shop_phone           NUMBER(10)           not null,
   shop_admin_name      VARCHAR2(40)         not null,
   shop_password        VARCHAR2(10)         not null,
   constraint PK_SHOP primary key (shop_id)
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_email           VARCHAR2(20)         not null,
   user_name            VARCHAR2(30)         not null,
   user_lastname        VARCHAR2(30)         not null,
   user_password        VARCHAR2(10)         not null,
   constraint PK_USER primary key (user_email)
);

alter table List
   add constraint FK_USER_CREATE_LIST foreign key (user_email)
      references "User" (user_email);

alter table List
   add constraint FK_PRODUCTS_IN_LIST foreign key (product_name, shop_id)
      references "Prodact in the shop" (product_name, shop_id);

alter table "Order"
   add constraint FK_BOOKING_LIST foreign key (product_name, shop_id, user_email, list_id)
      references List (product_name, shop_id, user_email, list_id);

alter table "Prodact in the shop"
   add constraint FK_PRODACT_IN_SHOP foreign key (product_name)
      references Product (product_name);

alter table "Prodact in the shop"
   add constraint FK_SHOP_SELLS_PRODUCTS foreign key (shop_id)
      references Shop (shop_id);

/*==============================================================*/
/* Added manually                                               */
/*==============================================================*/

ALTER TABLE "User"
   ADD CONSTRAINT user_unique UNIQUE (user_email);

ALTER TABLE "User"
   ADD CONSTRAINT check_user_email
      CHECK ( REGEXP_LIKE (user_email, '[a-z0-9._]+@[a-z0-9._]+\.[a-z]{2,4}'));

ALTER TABLE "User"
   ADD CONSTRAINT check_user_name
      CHECK (REGEXP_LIKE(user_name,'[A-Z][a-z]{1,25}','c'));

ALTER TABLE "User"
   ADD CONSTRAINT check_user_lastname
      CHECK (REGEXP_LIKE(user_lastname,'[A-Z][a-z]{1,25}','c'));

ALTER TABLE "User"
   ADD CONSTRAINT check_user_password
      CHECK (REGEXP_LIKE(user_password,'[A-Za-z0-9_]{6,10}'));

ALTER TABLE Shop
   ADD CONSTRAINT shop_id_unique UNIQUE (shop_id);

ALTER TABLE Shop
   ADD CONSTRAINT shop_details_unique UNIQUE (shop_adress, shop_name, shop_email);

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_id
      CHECK ( REGEXP_LIKE (shop_id, '[0-9]{1,10}'));

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_adress
      CHECK ( REGEXP_LIKE (shop_adress, '[A-Za-z0-9_., /]{10,30}'));

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_email
      CHECK ( REGEXP_LIKE (shop_email, '[a-z0-9._]+@[a-z0-9._]+\.[a-z]{2,4}'));

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_name
      CHECK (REGEXP_LIKE(shop_name,'[A-Z a-z]{2,20}'));

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_phone
      CHECK (shop_phone LIKE '[(.]?\d{3}[).]\d{3}[-.]?\d{2}[-.]?\d{2}');

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_admin_name
      CHECK (REGEXP_LIKE(shop_admin_name,'[A-Z][a-z]{1,20}','c'));

ALTER TABLE Shop
   ADD CONSTRAINT check_shop_pass
      CHECK (REGEXP_LIKE(shop_password,'[A-Za-z0-9_]{6,10}'));

ALTER TABLE Product
   ADD CONSTRAINT product_name_unique UNIQUE (product_name);

ALTER TABLE Product
   ADD CONSTRAINT check_product_name
      CHECK (REGEXP_LIKE(product_name,'[A-Z][a-z]{3,30}','c'));

ALTER TABLE Product
   ADD CONSTRAINT check_product_tm
      CHECK (REGEXP_LIKE(product_tm,'[A-Z][a-z]{1,25}','c'));

ALTER TABLE Product
   ADD CONSTRAINT check_product_country
      CHECK (REGEXP_LIKE(product_country,'[A-Z][a-z]{1,20}','c'));

ALTER TABLE Product
   ADD CONSTRAINT check_product_price
      CHECK (REGEXP_LIKE(product_price,'[0-9]{1,6}.[0-9]{1,2}'));

ALTER TABLE Product
   ADD CONSTRAINT check_product_category
      CHECK (REGEXP_LIKE(product_category,'[A-Z][a-z]{3,18}','c'));

ALTER TABLE Product
   ADD CONSTRAINT check_product_photo
      CHECK (REGEXP_LIKE(product_photo,'[A-Za-z0-9_\-/.,]{2,60}'));

ALTER TABLE "Order"
   ADD CONSTRAINT order_id_unique UNIQUE (order_id);

ALTER TABLE "Order"
   ADD CONSTRAINT check_order_id
      CHECK (REGEXP_LIKE(order_id,'[0-9]{1,10}'));

ALTER TABLE "Order"
   ADD CONSTRAINT check_order_date
      CHECK (REGEXP_LIKE(order_date,'\b\d{2}[./]?\d{2}[./]?\d{4}\b'));

ALTER TABLE "Prodact in the shop"
   ADD CONSTRAINT check_adding_date
      CHECK (REGEXP_LIKE(adding_date,'\b\d{2}[./]?\d{2}[./]?\d{4}\b'));

ALTER TABLE List
   ADD CONSTRAINT list_id_unique UNIQUE (list_id);

ALTER TABLE List
   ADD CONSTRAINT check_list_id
      CHECK (REGEXP_LIKE(list_id,'[0-9]{1,10}'));

ALTER TABLE List
   ADD CONSTRAINT check_product_quantity
      CHECK (length(product_quantity) > 0 and length(product_quantity) <= 20);