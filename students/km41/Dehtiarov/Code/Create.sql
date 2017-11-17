/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     25.10.2017 6:49:20                           */
/*==============================================================*/


alter table Credit
   drop constraint FK_CREDIT_WANT_TO_R_USER;

alter table Credit
   drop constraint "FK_CREDIT_WILL_BE_C_CREDIT P";

alter table "USER"
   drop constraint FK_USER_IS_ROLE;

drop index will_be_choosen_FK;

drop index want_to_rent_car_FK;

drop table Credit cascade constraints;

drop table "Credit plan" cascade constraints;

drop table Role cascade constraints;

drop index is_FK;

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: Credit                                                */
/*==============================================================*/
create table Credit 
(
   id_credit            INTEGER              not null,
   user_email           VARCHAR2(20)         not null,
   role_name            VARCHAR2(20)         not null,
   credit_date          DATE                 not null,
   credit_name          VARCHAR2(20)         not null,
   date_of_start        DATE                 not null,
   range                SMALLINT             not null,
   value                SMALLINT             not null,
   status               CHAR(20)             not null,
   constraint PK_CREDIT primary key (id_credit)
);

/*==============================================================*/
/* Index: want_to_rent_car_FK                                   */
/*==============================================================*/
create index want_to_rent_car_FK on Credit (
   user_email ASC,
   role_name ASC
);

/*==============================================================*/
/* Index: will_be_choosen_FK                                    */
/*==============================================================*/
create index will_be_choosen_FK on Credit (
   credit_date ASC,
   credit_name ASC
);

/*==============================================================*/
/* Table: "Credit plan"                                         */
/*==============================================================*/
create table "Credit plan" 
(
   credit_date          DATE                 not null,
   credit_name          VARCHAR2(20)         not null,
   credit_description   VARCHAR2(100),
   credit_range         SMALLINT             not null,
   credit_value         SMALLINT             not null,
   credit_percent       SMALLINT             not null,
   constraint "PK_CREDIT PLAN" primary key (credit_date, credit_name)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role 
(
   role_name            VARCHAR2(20)         not null,
   role_desc            VARCHAR2(260)   ,
   constraint PK_ROLE primary key (role_name)
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   user_password        VARCHAR2(20)         not null,
   user_email           VARCHAR2(20)         not null,
   role_name            VARCHAR2(20)         not null,
   user_name            VARCHAR2(50)         not null,
   user_passport        CHAR(10)              not null,
   user_IDcode          CHAR(12)             not null,
   user_phonenumber     CHAR(18)             not null,
   constraint PK_USER primary key (user_email, role_name)
);

/*==============================================================*/
/* Index: is_FK                                                 */
/*==============================================================*/
create index is_FK on "USER" (
   role_name ASC
);

alter table Credit
   add constraint FK_CREDIT_WANT_TO_R_USER foreign key (user_email, role_name)
      references "USER" (user_email, role_name);

alter table Credit
   add constraint "FK_CREDIT_WILL_BE_C_CREDIT P" foreign key (credit_date, credit_name)
      references "Credit plan" (credit_date, credit_name);

alter table "USER"
   add constraint FK_USER_IS_ROLE foreign key (role_name)
      references Role (role_name);



ALTER TABLE "ROLE"
	ADD CONSTRAINT check_role
	CHECK (ROLE_NAME IN ('ADMIN', 'USER', 'MANAGER'));
 
ALTER TABLE "ROLE"
 	ADD CONSTRAINT check_role_description
 	CHECK (REGEXP_LIKE(ROLE_DESC , '[A-z.,0-9 ]{1,200}'));
 

 ALTER TABLE "USER"
   ADD CONSTRAINT check_email
   CHECK ( REGEXP_LIKE (USER_EMAIL, '[A-Za-z0-9._,!#?]+@+[a-zA-Z._]+\.[a-z]{1,4}'));

 ALTER TABLE "USER"
   ADD CONSTRAINT check_password
   CHECK ( REGEXP_LIKE (user_password, '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));

 ALTER TABLE "USER"
   ADD CONSTRAINT check_password_len
   CHECK(length(user_password)>6 and length(user_password)<20);


 ALTER TABLE "USER"
   ADD CONSTRAINT check_name 
   CHECK (REGEXP_LIKE(user_name,'[A-ZÀ-ß][a-zà-ÿ]{1,20} [A-ZÀ-ß][a-zà-ÿ]{1,20}'));


 ALTER TABLE "USER"
   ADD CONSTRAINT check_number_passport
   CHECK ( REGEXP_LIKE (user_passport, '[À-ß]{2}[0-9]{6}'));

ALTER TABLE "USER"
   ADD CONSTRAINT check_idcode
   CHECK ( REGEXP_LIKE(user_IDcode, '[0-9]{12}'));

ALTER TABLE "USER"
   ADD CONSTRAINT check_phone_number
   CHECK (REGEXP_LIKE(user_phonenumber,'\+ 38+\(0[0-9]{2}\) [0-9]{4} [0-9]{3}','c'));


ALTER TABLE "USER"
   ADD CONSTRAINT check_name_len
   CHECK(length(user_name)>2 and length(user_name)<50);


ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_date
   CHECK(credit_date > DATE '1960-01-01'););

ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_name
   CHECK (REGEXP_LIKE(credit_name,'[A-ZÀ-ßa-zà-ÿ ]{1,20}')); 
   
ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_desc
   CHECK (REGEXP_LIKE(credit_description,'[A-ZÀ-ßa-zà-ÿ,. ]{1,100}')); 

ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_range_inp
   CHECK (REGEXP_LIKE(credit_range,'[0-9]{1,2}')); 

ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_range
   CHECK(credit_range BETWEEN 0 and 36); 

ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_value_inp
   CHECK (REGEXP_LIKE(credit_value,'[0-9]{1,5}')); 

ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_value
   CHECK (credit_value BETWEEN 0 and 36000); 


ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_percent_inp
   CHECK (REGEXP_LIKE(credit_percent,'[0-9]{1,3}'));

ALTER TABLE "Credit plan"                                         
   ADD CONSTRAINT check_credit_percent
   CHECK (credit_percent BETWEEN 0 and 100);

ALTER TABLE "CREDIT"                                         
   ADD CONSTRAINT check_credit_range_input
   CHECK (REGEXP_LIKE(range,'[0-9]{1,2}')); 

ALTER TABLE "CREDIT"                                         
   ADD CONSTRAINT check_credit_value_input
   CHECK (REGEXP_LIKE(value,'[0-9]{1,5}')); 

ALTER TABLE "CREDIT"                                         
   ADD CONSTRAINT check_status
   CHECK (status IN ('ACTIVE', 'DENIED', 'FINISH'));

ALTER TABLE "CREDIT"                                         
   ADD CONSTRAINT check_creditrole
   CHECK (ROLE_NAME='USER');


