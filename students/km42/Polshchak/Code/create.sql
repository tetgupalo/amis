/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     07.11.2017 20:49:44                          */
/*==============================================================*/


alter table Schedule
   drop constraint FK_SCHEDULE_HAS_POOL;

alter table Schedule
   drop constraint FK_SCHEDULE_HAS_TEAM;

alter table Tariff_plan
   drop constraint FK_TARIFF_PLAN_HAS_TARIFF;

alter table Tariff_plan
   drop constraint FK_TARIFF_PLAN_HAS_USER;

alter table Team
   drop constraint FK_TEAM_COACH_USER;

alter table Team
   drop constraint FK_TEAM_MEMBER_USER;

alter table "User"
   drop constraint FK_USER_HAS_ROLE;

drop table Pool cascade constraints;

drop table Role cascade constraints;

drop index "has a schedule_FK";

drop index "has a schedule2_FK";

drop table Schedule cascade constraints;

drop table Tariff cascade constraints;

drop index "has a tariff plan_FK";

drop index "has a tariff plan2_FK";

drop table Tariff_plan cascade constraints;

drop index coach_FK;

drop index member_FK;

drop table Team cascade constraints;

drop index "has a role_FK";

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: Pool                                                  */
/*==============================================================*/
create table Pool 
(
   line_id              INTEGER              not null,
   line_number          INTEGER              not null,
   line_length          FLOAT(8)             not null,
   pool_name            VARCHAR2(256)        not null,
   constraint PK_POOL primary key (line_id)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role 
(
   role_name            VARCHAR2(256)        not null,
   role_description     VARCHAR2(1024)       not null,
   constraint PK_ROLE primary key (role_name)
);

/*==============================================================*/
/* Table: Schedule                                              */
/*==============================================================*/
create table Schedule 
(
   line_id_fk           INTEGER              not null,
   member_id_fk         INTEGER              not null,
   coach_id_fk          INTEGER              not null,
   team_name_fk         VARCHAR2(256)        not null,
   day                  DATE                 not null,
   time                 DATE                 not null,
   constraint PK_SCHEDULE primary key (line_id_fk, member_id_fk, coach_id_fk, team_name_fk)
);

/*==============================================================*/
/* Index: "has a schedule2_FK"                                  */
/*==============================================================*/
create index "has a schedule2_FK" on Schedule (
   member_id_fk ASC,
   coach_id_fk ASC,
   team_name_fk ASC
);

/*==============================================================*/
/* Index: "has a schedule_FK"                                   */
/*==============================================================*/
create index "has a schedule_FK" on Schedule (
   line_id_fk ASC
);

/*==============================================================*/
/* Table: Tariff                                                */
/*==============================================================*/
create table Tariff 
(
   tariff_name          VARCHAR2(256)        not null,
   tariff_price         FLOAT(8)             not null,
   tariff_subscription_time VARCHAR2(5)      not null,
   tariff_description   VARCHAR2(1024)       not null,
   constraint PK_TARIFF primary key (tariff_name)
);

/*==============================================================*/
/* Table: Tariff_plan                                           */
/*==============================================================*/
create table Tariff_plan 
(
   tariff_name_fk       VARCHAR2(256)        not null,
   user_id_fk           INTEGER              not null,
   pay_date             DATE                 not null,
   constraint PK_TARIFF_PLAN primary key (tariff_name_fk, user_id_fk)
);

/*==============================================================*/
/* Index: "has a tariff plan2_FK"                               */
/*==============================================================*/
create index "has a tariff plan2_FK" on Tariff_plan (
   user_id_fk ASC
);

/*==============================================================*/
/* Index: "has a tariff plan_FK"                                */
/*==============================================================*/
create index "has a tariff plan_FK" on Tariff_plan (
   tariff_name_fk ASC
);

/*==============================================================*/
/* Table: Team                                                  */
/*==============================================================*/
create table Team 
(
   coach_id_fk          INTEGER              not null,
   member_id_fk         INTEGER              not null,
   team_name            VARCHAR2(256)        not null,
   constraint PK_TEAM primary key (member_id_fk, coach_id_fk, team_name)
);

/*==============================================================*/
/* Index: member_FK                                             */
/*==============================================================*/
create index member_FK on Team (
   coach_id_fk ASC
);

/*==============================================================*/
/* Index: coach_FK                                              */
/*==============================================================*/
create index coach_FK on Team (
   member_id_fk ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_id              INTEGER              not null,
   email                VARCHAR2(254)        not null,
   role_name_fk         VARCHAR2(256)        not null,
   first_name           VARCHAR2(256)        not null,
   second_name          VARCHAR2(256)        not null,
   last_name            VARCHAR2(256)        not null,
   birthday             DATE                 not null,
   reg_day				DATE				 not null,		
   user_address         VARCHAR2(256)        not null,
   phone_number         VARCHAR2(15)         not null,
   med_doc              VARCHAR2(2048)       not null,
   sport_rank           VARCHAR2(256),
   password             VARCHAR2(256)        not null,
   constraint PK_USER primary key (user_id)
);

/*==============================================================*/
/* Index: "has a role_FK"                                       */
/*==============================================================*/
create index "has a role_FK" on "User" (
   role_name_fk ASC
);

/*==============================================================*/
/* MANUAL TYPING                                                */
/*==============================================================*/
/*==============================================================*/
/* USER                                                */
/*==============================================================*/
ALTER TABLE "User"
	ADD CONSTRAINT user_email_phn_med_unique UNIQUE (email, phone_number, med_doc);

ALTER TABLE "User"
	ADD CONSTRAINT check_user_id_regexp
	CHECK ( REGEXP_LIKE (user_id, '^[0-9]{1,10}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_email_regexp
	CHECK( REGEXP_LIKE (email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_email_length
	CHECK(length(email) < 255);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_f_name_regexp
	CHECK ( REGEXP_LIKE (first_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_f_name_len
	CHECK (length(first_name) <= 256);

ALTER TABLE "User"
	ADD CONSTRAINT user_check_s_name_regexp
	CHECK ( REGEXP_LIKE (second_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_s_name_len
	CHECK (length(second_name) <= 256);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_l_name_regexp
	CHECK ( REGEXP_LIKE (last_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_l_name_len
	CHECK (length(last_name) <= 256);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_birthday
	CHECK (reg_day > birthday);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_address_regexp
	CHECK ( REGEXP_LIKE (user_address, '^[A-ZА-ЯІЄЇа-яіїє,a-z .0-9]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_address_len
	CHECK (length(user_address) <= 1024);

ALTER TABLE "User"
	ADD CONSTRAINT user_check_phone_number_regexp
	CHECK ( REGEXP_LIKE (phone_number, '^[0-9]{2,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_phone_number_len
	CHECK (length(phone_number) <= 15 and length(phone_number) > 2);
  
ALTER TABLE "User"
	ADD CONSTRAINT user_check_meddoc_regexp
	CHECK ( REGEXP_LIKE (med_doc, '^[.0-9A-Za-z]{3,15}+\/+[0-9]{1,10}\/[.0-9a-zA-Z]{3,15}($|\s)'));

ALTER TABLE "User"
	ADD CONSTRAINT user_check_meddoc_len
	CHECK (length(med_doc) <= 2048);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_sport_rank_regexp
	CHECK ( REGEXP_LIKE (sport_rank, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_sport_rank_len
	CHECK (length(sport_rank) <= 256);
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_password_regexp
	CHECK ( REGEXP_LIKE (password, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)'));
	
ALTER TABLE "User"
	ADD CONSTRAINT user_check_password_len
	CHECK (length(password) >= 8 and length(password) <= 256);
	
/*==============================================================*/
/* ROLE                                                */
/*==============================================================*/
ALTER TABLE Role
	ADD CONSTRAINT check_role_name_regexp
	CHECK ( REGEXP_LIKE (role_name, '^[A-Za-z]+($|\s)'));
  
ALTER TABLE Role
	ADD CONSTRAINT role_description_unique UNIQUE (role_description);
	
ALTER TABLE Role
	ADD CONSTRAINT check_role_descp_regexp
	CHECK ( REGEXP_LIKE (role_description, '^[A-Za-zА-ЯІЇЄа-яієї,.-0-9 "?!]+($|\s)'));
	
ALTER TABLE Role
	ADD CONSTRAINT check_role_descp_len
	CHECK (length(role_description) > 10 and length(role_description) <= 1024);
	
/*==============================================================*/
/* TARIFF                                                */
/*==============================================================*/

ALTER TABLE Tariff
	ADD CONSTRAINT tariff_prc_sub_unique UNIQUE (tariff_price, tariff_subscription_time, tariff_description);
	
ALTER TABLE Tariff
	ADD CONSTRAINT tariff_check_name_regexp
	CHECK ( REGEXP_LIKE (tariff_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
ALTER TABLE Tariff
	ADD CONSTRAINT tariff_check_name_len
	CHECK (length(tariff_name) <= 256);
	
ALTER TABLE Tariff
	ADD CONSTRAINT tariff_check_price_regexp
	CHECK ( REGEXP_LIKE (tariff_price, '^[0-9]{1,4}.[0-9]{0,2}($|\s)'));
	
ALTER TABLE Tariff
	ADD CONSTRAINT tariff_check_descp_regexp
	CHECK ( REGEXP_LIKE (tariff_description, '^[A-Za-zА-ЯІЇЄа-яієї,.-0-9 "?!]+($|\s)'));
	
ALTER TABLE Tariff
	ADD CONSTRAINT tariff_check_descp_len
	CHECK (length(tariff_description) > 10 and length(tariff_description) <= 1024);
/*==============================================================*/
/* POOL                                                */
/*==============================================================*/
ALTER TABLE Pool
	ADD CONSTRAINT pool_name_num_len_unique UNIQUE (line_number, line_length, pool_name);

ALTER TABLE Pool
	ADD CONSTRAINT pool_check_line_id_regexp
	CHECK ( REGEXP_LIKE (line_id, '^[0-9]{1,10}($|\s)'));

ALTER TABLE Pool
	ADD CONSTRAINT pool_check_line_number_regexp
	CHECK ( REGEXP_LIKE (line_number, '^[0-9]{1,10}($|\s)'));
	
ALTER TABLE Pool
	ADD CONSTRAINT pool_check_line_length_regexp
	CHECK ( REGEXP_LIKE (line_length, '^[0-9]{1,4}.[0-9]{0,2}($|\s)'));
	
ALTER TABLE Pool
	ADD CONSTRAINT pool_check_name_regexp
	CHECK ( REGEXP_LIKE (pool_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
	
/*==============================================================*/
/* TEAM                                               */
/*==============================================================*/

ALTER TABLE Team
	ADD CONSTRAINT team_check_name_regexp
	CHECK ( REGEXP_LIKE (team_name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє -]+($|\s)', 'c'));


alter table Schedule
   add constraint FK_SCHEDULE_HAS_POOL foreign key (line_id_fk)
      references Pool (line_id);

alter table Schedule
   add constraint FK_SCHEDULE_HAS_TEAM foreign key (member_id_fk, coach_id_fk, team_name_fk)
      references Team (member_id_fk, coach_id_fk, team_name);

alter table Tariff_plan
   add constraint FK_TARIFF_PLAN_HAS_TARIFF foreign key (tariff_name_fk)
      references Tariff (tariff_name);

alter table Tariff_plan
   add constraint FK_TARIFF_PLAN_HAS_USER foreign key (user_id_fk)
      references "User" (user_id);

alter table Team
   add constraint FK_TEAM_COACH_USER foreign key (member_id_fk)
      references "User" (user_id);

alter table Team
   add constraint FK_TEAM_MEMBER_USER foreign key (coach_id_fk)
      references "User" (user_id);

alter table "User"
   add constraint FK_USER_HAS_ROLE foreign key (role_name_fk)
      references Role (role_name);
