/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     15.11.2017 21:16:21                          */
/*==============================================================*/


alter table Delivery
   drop constraint FK_DELIVE_ORDER;

alter table "Order"
   drop constraint FK_ORDER_USER;

alter table Order_item
   drop constraint FK_FLOWER_IS_ORDER;

alter table Order_item
   drop constraint FK_ORDER_IT_FLOWER;

alter table "User"
   drop constraint FK_USER_TYPE;

drop table Delivery cascade constraints;

drop table Flower cascade constraints;

drop index user_order_FK;

drop table "Order" cascade constraints;

drop index flower_is_ordered_FK;

drop index flower_is_ordered2_FK;

drop table Order_item cascade constraints;

drop index user_type_FK;

drop table "User" cascade constraints;

drop table User_type cascade constraints;

/*==============================================================*/
/* Table: Delivery                                              */
/*==============================================================*/
create table Delivery 
(
   order_id             INTEGER              not null,
   city                 VARCHAR2(30)         not null,
   street               VARCHAR2(30)         not null,
   house                VARCHAR2(30)         not null,
   flat                 VARCHAR2(10),
   del_price            FLOAT(8)             not null,
   constraint PK_DELIVERY primary key (order_id)
);

/*==============================================================*/
/* Table: Flower                                                */
/*==============================================================*/
create table Flower 
(
   flower_name          VARCHAR2(30)         not null,
   flower_price         FLOAT(8)             not null,
   flower_status        VARCHAR2(30)         not null,
   flower_quontity      INTEGER              not null,
   flower_comment       VARCHAR2(1000),
   flower_image         VARCHAR2(256),
   constraint PK_FLOWER primary key (flower_name)
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   order_id             INTEGER              not null,
   type_name            VARCHAR2(30)         not null,
   user_login           VARCHAR2(30)         not null,
   order_date           DATE                 not null,
   order_status         VARCHAR2(30)         not null,
   constraint PK_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on "Order" (
   type_name ASC,
   user_login ASC
);

/*==============================================================*/
/* Table: Order_item                                            */
/*==============================================================*/
create table Order_item 
(
   order_id             INTEGER              not null,
   flower_name          VARCHAR2(30)         not null,
   constraint PK_ORDER_ITEM primary key (order_id, flower_name)
);

/*==============================================================*/
/* Index: flower_is_ordered2_FK                                 */
/*==============================================================*/
create index flower_is_ordered2_FK on Order_item (
   flower_name ASC
);

/*==============================================================*/
/* Index: flower_is_ordered_FK                                  */
/*==============================================================*/
create index flower_is_ordered_FK on Order_item (
   order_id ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   type_name            VARCHAR2(30)         not null,
   user_login           VARCHAR2(30)         not null,
   user_name            VARCHAR2(30)         not null,
   user_email           VARCHAR2(30)         not null,
   user_password        VARCHAR2(30)         not null,
   user_phone           VARCHAR2(15)         not null,
   user_image           VARCHAR2(256),
   constraint PK_USER primary key (type_name, user_login)
);

/*==============================================================*/
/* Index: user_type_FK                                          */
/*==============================================================*/
create index user_type_FK on "User" (
   type_name ASC
);

/*==============================================================*/
/* Table: User_type                                             */
/*==============================================================*/
create table User_type 
(
   type_name            VARCHAR2(30)         not null,
   constraint PK_USER_TYPE primary key (type_name)
);

/*==============================================================*/
/* Table: Constraints                                             */
/*==============================================================*/

ALTER TABLE "User"
	ADD CONSTRAINT user_check_name_regexp
	CHECK ( REGEXP_LIKE (user_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_name_len
	CHECK (length(user_name) <= 30);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_login_regexp
	CHECK ( REGEXP_LIKE (user_login, '^[A-Za-z0-9.@#_]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_login_len
	CHECK (length(user_login) <= 30);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_email_regexp
	CHECK( REGEXP_LIKE (user_email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_email_length
	CHECK(length(user_email) < 30);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_password_regexp
	CHECK ( REGEXP_LIKE (user_password, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_password_len
	CHECK (length(user_password) >= 6 and length(user_password) <= 30);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_phone_regexp
	CHECK ( REGEXP_LIKE (user_phone, '^[0-9]{2,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_phone_len
	CHECK (length(user_phone) > 2 and length(user_phone) <= 15);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_image_regexp
	CHECK ( REGEXP_LIKE (user_image, '^[.0-9A-Za-z]{3,15}+\/+[0-9]{1,10}\/[.0-9a-zA-Z]{3,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_image_len
	CHECK (length(user_image) <= 256);
	
ALTER TABLE User_type
	ADD CONSTRAINT user_check_type_regexp
	CHECK ( REGEXP_LIKE (type_name, '^[A-Za-z0-9.@#]+($|\s)', 'c'));
	
ALTER TABLE User_type
	ADD CONSTRAINT user_check_type_len
	CHECK (length(type_name) <= 30);
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_name_regexp
	CHECK ( REGEXP_LIKE (flower_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_name_len
	CHECK (length(flower_name) <= 30);
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_price_regexp
	CHECK ( REGEXP_LIKE (flower_price, '^[0-9]{1,4}.[0-9]{0,2}($|\s)'));
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_status_regexp
	CHECK ( REGEXP_LIKE (flower_name, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_status_len
	CHECK (length(flower_name) <= 30);
	
ALTER TABLE Flower
	ADD CONSTRAINT check_user_quont_regexp
	CHECK ( REGEXP_LIKE (flower_quontity, '^[0-9]{1,10}($|\s)'));
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_comment_regexp
	CHECK ( REGEXP_LIKE (flower_comment, '^[A-ZА-ЯІЇЄ][a-zа-яіїє?.,! -]+($|\s)', 'c'));
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_comment_len
	CHECK (length(flower_comment) <= 1000);	
	
ALTER TABLE Flower
	ADD CONSTRAINT flower_check_image_regexp
	CHECK ( REGEXP_LIKE (flower_image, '^[.0-9A-Za-z]{3,15}+\/+[0-9]{1,10}\/[.0-9a-zA-Z]{3,15}($|\s)'));

ALTER TABLE Flower
	ADD CONSTRAINT flower_check_image_len
	CHECK (length(flower_image) <= 256);
	
ALTER TABLE "Order"
	ADD CONSTRAINT order_order_id_regexp
	CHECK ( REGEXP_LIKE (order_id, '^[0-9]{1,10}($|\s)'));
	
ALTER TABLE "Order"
	ADD CONSTRAINT order_check_status_regexp
	CHECK ( REGEXP_LIKE (order_status, '^[A-Z][a-z]+($|\s)', 'c'));
	
ALTER TABLE "Order"
	ADD CONSTRAINT order_check_status_len
	CHECK (length(order_status) <= 30);	
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_city_regexp
	CHECK ( REGEXP_LIKE (city, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_city_len
	CHECK (length(city) <= 30);	
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_street_regexp
	CHECK ( REGEXP_LIKE (street, '^[A-ZА-ЯІЇЄ0-9][0-9a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_street_len
	CHECK (length(street) <= 30);	
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_house_regexp
	CHECK ( REGEXP_LIKE (house, '^[0-9a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_house_len
	CHECK (length(house) <= 30);	
	
ALTER TABLE Delivery
	ADD CONSTRAINT del_check_price_regexp
	CHECK ( REGEXP_LIKE (del_price, '^[0-9]{1,4}.[0-9]{0,2}($|\s)'));

alter table Delivery
   add constraint FK_DELIVE_ORDER foreign key (order_id)
      references "Order" (order_id);

alter table "Order"
   add constraint FK_ORDER_USER foreign key (type_name, user_login)
      references "User" (type_name, user_login);

alter table Order_item
   add constraint FK_FLOWER_IS_ORDER foreign key (order_id)
      references "Order" (order_id);

alter table Order_item
   add constraint FK_ORDER_IT_FLOWER foreign key (flower_name)
      references Flower (flower_name);

alter table "User"
   add constraint FK_USER_TYPE foreign key (type_name)
      references User_type (type_name);

