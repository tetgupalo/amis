/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     16.11.2017 22:11:22                          */
/*==============================================================*/


alter table "Order"
   drop constraint FK_ORDER_USER_ORDE_USER;

alter table Order_item
   drop constraint FK_ORDER_IT_ORDER_ITE_ORDER;

alter table Order_item
   drop constraint FK_ORDER_IT_PRODUCT_O_PRODUCT;

alter table Product
   drop constraint FK_PRODUCT_PRODUCT_C_CATEGORY;

alter table Product
   drop constraint FK_PRODUCT_STOREHOUS_STOREHOU;

drop table Category cascade constraints;

drop index user_order_FK;

drop table "Order" cascade constraints;

drop index order_item_in_order_FK;

drop index product_order_item_FK;

drop table Order_item cascade constraints;

drop index product_category_FK;

drop index storehouse_supply_product_FK;

drop table Product cascade constraints;

drop table Storehouse cascade constraints;

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category 
(
   product_category     VARCHAR2(32)         not null,
   constraint PK_CATEGORY primary key (product_category)
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   order_id             INTEGER              not null,
   user_login           VARCHAR2(32)         not null,
   order_date           DATE                 not null,
   order_status         CLOB                 not null,
   constraint PK_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on "Order" (
   user_login ASC
);

/*==============================================================*/
/* Table: Order_item                                            */
/*==============================================================*/
create table Order_item 
(
   order_id             INTEGER              not null,
   product_id           INTEGER              not null,
   Item_quatity         NUMBER(6)            not null,
   constraint PK_ORDER_ITEM primary key (order_id, product_id, Item_quatity)
);

/*==============================================================*/
/* Index: product_order_item_FK                                 */
/*==============================================================*/
create index product_order_item_FK on Order_item (
   product_id ASC
);

/*==============================================================*/
/* Index: order_item_in_order_FK                                */
/*==============================================================*/
create index order_item_in_order_FK on Order_item (
   order_id ASC
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product 
(
   product_id           INTEGER              not null,
   product_category     VARCHAR2(32)         not null,
   storehouse_number    NUMBER(6)            not null,
   storehouse_adress    VARCHAR2(56)         not null,
   product_name         VARCHAR2(32)         not null,
   product_price        NUMBER(6)            not null,
   product_info         VARCHAR2(250),
   constraint PK_PRODUCT primary key (product_id)
);

/*==============================================================*/
/* Index: storehouse_supply_product_FK                          */
/*==============================================================*/
create index storehouse_supply_product_FK on Product (
   storehouse_number ASC,
   storehouse_adress ASC
);

/*==============================================================*/
/* Index: product_category_FK                                   */
/*==============================================================*/
create index product_category_FK on Product (
   product_category ASC
);

/*==============================================================*/
/* Table: Storehouse                                            */
/*==============================================================*/
create table Storehouse 
(
   storehouse_number    NUMBER(6)            not null,
   storehouse_adress    VARCHAR2(56)         not null,
   storehouse_phonenum  NUMBER(10),
   constraint PK_STOREHOUSE primary key (storehouse_number, storehouse_adress)
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_login           VARCHAR2(32)         not null,
   user_name            VARCHAR2(32)         not null,
   user_email           VARCHAR2(32)         not null,
   user_password        VARCHAR2(32)         not null,
   user_phonenum        NUMBER(10),
   constraint PK_USER primary key (user_login)
);

alter table "Order"
   add constraint FK_ORDER_USER_ORDE_USER foreign key (user_login)
      references "User" (user_login);

alter table Order_item
   add constraint FK_ORDER_IT_ORDER_ITE_ORDER foreign key (order_id)
      references "Order" (order_id);

alter table Order_item
   add constraint FK_ORDER_IT_PRODUCT_O_PRODUCT foreign key (product_id)
      references Product (product_id);

alter table Product
   add constraint FK_PRODUCT_PRODUCT_C_CATEGORY foreign key (product_category)
      references Category (product_category);

alter table Product
   add constraint FK_PRODUCT_STOREHOUS_STOREHOU foreign key (storehouse_number, storehouse_adress)
      references Storehouse (storehouse_number, storehouse_adress);

/*==============================================================*/
/* Table: Constraints                                             */
/*==============================================================*/

ALTER TABLE "User"
	ADD CONSTRAINT user_login_regexp
	CHECK ( REGEXP_LIKE (user_login, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_login_len
	CHECK (length(user_login) <= 32);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_name_regexp
	CHECK ( REGEXP_LIKE (user_name, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_name_len
	CHECK (length(user_name) <= 32);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_email_regexp
	CHECK( REGEXP_LIKE (user_email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_email_length
	CHECK(length(user_email) < 32);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_password_regexp
	CHECK ( REGEXP_LIKE (user_password, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_password_len
	CHECK (length(user_password) >= 3 and length(user_password) <= 32);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_phonenum_regexp
	CHECK ( REGEXP_LIKE (user_phone, '^[0-9]{2,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_phonenum_len
	CHECK (length(user_phone) > 7 and length(user_phone) <= 10);
	

	
ALTER TABLE Product
	ADD CONSTRAINT product_id_regexp
	CHECK ( REGEXP_LIKE (product_id, '^[0-9]{2,15}($|\s)', 'c'));
	
ALTER TABLE Product
	ADD CONSTRAINT product_category_regexp
	CHECK ( REGEXP_LIKE (product_category, '^[A-Z][a-z]+($|\s)', 'c'));

ALTER TABLE Product
	ADD CONSTRAINT product_category_len
	CHECK (length(product_category) <= 32);
	
ALTER TABLE Product
	ADD CONSTRAINT storehouse_number_regexp
	CHECK ( REGEXP_LIKE (storehouse_number, '^[0-9]{2,15}($|\s)', 'c'));
	
ALTER TABLE Product
	ADD CONSTRAINT storehouse_number_len
	CHECK (length(storehouse_number) <= 6);
	
ALTER TABLE Product
	ADD CONSTRAINT storehouse_adress_regexp
	CHECK ( REGEXP_LIKE (storehouse_adress, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)'));

ALTER TABLE Product
	ADD CONSTRAINT storehouse_adress_len
	CHECK (length(storehouse_adress) <= 56);
	
ALTER TABLE Product
	ADD CONSTRAINT product_name_regexp
	CHECK ( REGEXP_LIKE (product_name, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE Product
	ADD CONSTRAINT product_name_len
	CHECK (length(product_name) <= 32);	
	
ALTER TABLE Product
	ADD CONSTRAINT product_price_regexp
	CHECK ( REGEXP_LIKE (product_price, '^[0-9]{2,15}($|\s)', 'c'));

ALTER TABLE Product
	ADD CONSTRAINT product_price_len
	CHECK (length(product_price) <= 6);

ALTER TABLE Product
	ADD CONSTRAINT product_info_regexp
	CHECK ( REGEXP_LIKE (product_info, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)', 'c'));
	
ALTER TABLE Product
	ADD CONSTRAINT product_name_len
	CHECK (length(product_name) <= 250);	
	
	
ALTER TABLE "Order_item"
	ADD CONSTRAINT order_id_regexp
	CHECK ( REGEXP_LIKE (order_id, '^[0-9]{1,10}($|\s)'));
	
ALTER TABLE "Order_item"
	ADD CONSTRAINT product_id_regexp
	CHECK ( REGEXP_LIKE (product_id, '^[0-9]{1,10}($|\s)'));

ALTER TABLE "Order_item"
	ADD CONSTRAINT Item_quatity_regexp
	CHECK ( REGEXP_LIKE (Item_quatity, '^[0-9]{1,10}($|\s)'));
	
ALTER TABLE "Order_item"
	ADD CONSTRAINT Item_quatity_len
	CHECK (length(Item_quatity) <= 6);	

	
ALTER TABLE "Order"
	ADD CONSTRAINT order_id_regexp
	CHECK ( REGEXP_LIKE (order_id, '^[0-9]{1,10}($|\s)'));

ALTER TABLE "Order"
	ADD CONSTRAINT user_login_regexp
	CHECK ( REGEXP_LIKE (user_login, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE "Order"
	ADD CONSTRAINT user_login_len
	CHECK (length(user_login) <= 32);
	
ALTER TABLE "Order"
	ADD CONSTRAINT order_check_status_regexp
	CHECK ( REGEXP_LIKE (order_status, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE "Order"
	ADD CONSTRAINT order_check_status_len
	CHECK (length(order_status) <= 12);	

	
ALTER TABLE "Category"
	ADD CONSTRAINT product_category_regexp
	CHECK ( REGEXP_LIKE (product_category, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE "Category"
	ADD CONSTRAINT product_category_len
	CHECK (length(product_category) <= 32);