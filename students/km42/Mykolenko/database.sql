/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12.11.2017 16:27:47                          */
/*==============================================================*/


alter table "Booking"
   drop constraint FK_BOOKING_REFERENCE_FLAT;

alter table "Booking"
   drop constraint FK_BOOKING_TO_BOOK_F_USER;

alter table "Booking"
   drop constraint FK_BOOKING_TO_LEASE__USER;

drop table "Booking" cascade constraints;

drop table "Flat" cascade constraints;

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: "Booking"                                             */
/*==============================================================*/
create table "Booking" 
(
   "booking_status"     boolean              not null,
   "booking_startdate"  DATE                 not null,
   "booking_finishdate" DATE                 not null,
   "flat_adress"        CHAR(25),
   "user_email"         CHAR(25),
   "user_type"          SMALLINT,
   "Use_user_email"     CHAR(25),
   "Use_user_type"      SMALLINT,
   constraint PK_BOOKING primary key ("booking_startdate", "booking_finishdate")
);

/*==============================================================*/
/* Table: "Flat"                                                */
/*==============================================================*/
create table "Flat" 
(
   "flat_id"            INTEGER,
   "flat_adress"        CHAR(25)             not null,
   "flat_price"         NUMBER(8)            not null,
   "flat_type"          CHAR(25)             not null,
   constraint PK_FLAT primary key ("flat_adress")
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   "user_firstname"     CHAR(25)             not null,
   "user_secondname"    CHAR(25)             not null,
   "user_email"         CHAR(25)             not null,
   "user_pass"          CHAR(25)             not null,
   "user_type"          SMALLINT             not null,
   constraint PK_USER primary key ("user_email", "user_type")
);

alter table "Booking"
   add constraint FK_BOOKING_REFERENCE_FLAT foreign key ("flat_adress")
      references "Flat" ("flat_adress");

alter table "Booking"
   add constraint FK_BOOKING_TO_BOOK_F_USER foreign key ("Use_user_email", "Use_user_type")
      references "User" ("user_email", "user_type");

alter table "Booking"
   add constraint FK_BOOKING_TO_LEASE__USER foreign key ("user_email", "user_type")
      references "User" ("user_email", "user_type");

