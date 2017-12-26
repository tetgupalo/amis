/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12/25/2017 10:16:46 PM                       */
/*==============================================================*/


alter table GIFT
   drop constraint FK_GIFT_EXS_IN_GL;

alter table GIFT
   drop constraint FK_USER_SEND_GIFT;

alter table LETTER
   drop constraint FK_USER_SEND_LETTER;

alter table "USER"
   drop constraint FK_USER_VOTE;

alter table VOTE
   drop constraint FK_VOTE_USER;

drop index USER_SENDS_A_GIFT_FK;

drop table GIFT cascade constraints;

drop table GIFT_LIST cascade constraints;

drop index USER_SENDS_A_LETTER_FK;

drop table LETTER cascade constraints;

drop index USER_IS_VOTING_FK;

drop table "USER" cascade constraints;

drop index USER_IS_VOTING2_FK;

drop table VOTE cascade constraints;

/*==============================================================*/
/* Table: GIFT                                                  */
/*==============================================================*/
create table GIFT 
(
   GIFT_ID_FK           INTEGER              not null,
   USE_GIFT_NAME        VARCHAR2(33)         not null,
   USER_ID3_FK          INTEGER              not null,
   constraint PK_GIFT primary key (GIFT_ID_FK)
);

/*==============================================================*/
/* Index: USER_SENDS_A_GIFT_FK                                  */
/*==============================================================*/
create index USER_SENDS_A_GIFT_FK on GIFT (
   USER_ID3_FK ASC
);

/*==============================================================*/
/* Table: GIFT_LIST                                             */
/*==============================================================*/
create table GIFT_LIST 
(
   GIFT_ID              INTEGER              not null,
   GIFT_NAME            VARCHAR2(33)         not null,
   GIFT_LIST_CAPACITY   SMALLINT             not null,
   GIFT_DESCRIPTION     VARCHAR2(33),
   constraint PK_GIFT_LIST primary key (GIFT_ID)
);

/*==============================================================*/
/* Table: LETTER                                                */
/*==============================================================*/
create table LETTER 
(
   LETTER_ID            INTEGER              not null,
   LETTER_NAME          CHAR(33)             not null,
   USER_ID2_FK          INTEGER              not null,
   LETTER_INWARD        VARCHAR2(100)        not null,
   constraint PK_LETTER primary key (LETTER_ID)
);

/*==============================================================*/
/* Index: USER_SENDS_A_LETTER_FK                                */
/*==============================================================*/
create index USER_SENDS_A_LETTER_FK on LETTER (
   USER_ID2_FK ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   USER_ID              INTEGER              not null,
   USER_EMAIL           VARCHAR2(33)         not null,
   USER_YEAR            DATE                 not null,
   VOTE_ID_FK           INTEGER,
   USER_NAME            VARCHAR2(33)         not null,
   USER_COUNTY          VARCHAR2(33)         not null,
   USER_BIRTHDAY        DATE,
   constraint PK_USER primary key (USER_ID)
);

/*==============================================================*/
/* Index: USER_IS_VOTING_FK                                     */
/*==============================================================*/
create index USER_IS_VOTING_FK on "USER" (
   VOTE_ID_FK ASC
);

/*==============================================================*/
/* Table: VOTE                                                  */
/*==============================================================*/
create table VOTE 
(
   VOTE_ID              INTEGER              not null,
   VOTE_NAME            VARCHAR2(33)         not null,
   USER_ID1_FK          INTEGER              not null,
   constraint PK_VOTE primary key (VOTE_ID)
);

/*==============================================================*/
/* Index: USER_IS_VOTING2_FK                                    */
/*==============================================================*/
create index USER_IS_VOTING2_FK on VOTE (
   USER_ID1_FK ASC
);

alter table GIFT
   add constraint FK_GIFT_EXS_IN_GL foreign key (GIFT_ID_FK)
      references GIFT_LIST (GIFT_ID);

alter table GIFT
   add constraint FK_USER_SEND_GIFT foreign key (USER_ID3_FK)
      references "USER" (USER_ID);

alter table LETTER
   add constraint FK_USER_SEND_LETTER foreign key (USER_ID2_FK)
      references "USER" (USER_ID);

alter table "USER"
   add constraint FK_USER_VOTE foreign key (VOTE_ID_FK)
      references VOTE (VOTE_ID);

alter table VOTE
   add constraint FK_VOTE_USER foreign key (USER_ID1_FK)
      references "USER" (USER_ID);

/*======ADDED MANUALLY=======*/

ALTER TABLE "USER"
 ADD CONSTRAINT user_unique UNIQUE (user_id, user_email);
 
 ALTER TABLE "USER"
 ADD CONSTRAINT check_user_name CHECK (length(user_name)>=8 AND length(user_name)<=33);

ALTER TABLE "USER"
 ADD CONSTRAINT check_user_country CHECK (length(user_country)>=3 AND length(user_country)<=33);

ALTER TABLE "USER"
 ADD CONSTRAINT check_user_birthday CHECK (user_birthday > date '1900-01-01');

ALTER TABLE "USER"
 ADD CONSTRAINT check_user_year CHECK (user_year > 0);
  
 ALTER TABLE VOTE
 ADD CONSTRAINT vote_unique UNIQUE (vote_id, vote_name);

ALTER TABLE GIFT_LIST
 ADD CONSTRAINT gift_list_unique UNIQUE (gift_id, gift_name);

ALTER TABLE GIFT_LIST
 ADD CONSTRAINT check_gift_description CHECK (length(gift_description)>=3 AND length(gift_description)<=33);

ALTER TABLE LETTER
 ADD CONSTRAINT letter_unique UNIQUE (letter_id, letter_name);

ALTER TABLE LETTER
 ADD CONSTRAINT check_letter_capacity CHECK (length(letter_capacity)>=0 AND length(letter_capacity)<=100);

