/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     18.11.2017 0:01:25                           */
/*==============================================================*/


alter table Vote
   drop constraint "FK_USER MAKE A VOTE";

alter table Vote
   drop constraint "FK_VOTING HAS VOTES";

drop table "Users" cascade constraints;

drop index "voting has votes_FK";

drop index "user view and vote2_FK";

drop table Vote cascade constraints;

drop table Votings cascade constraints;

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table "Users" 
(
   User_id              INTEGER              not null,
   User_name            VARCHAR2(40)         not null,
   User_surname         VARCHAR2(40)         not null,
   User_registration_date DATE                 not null,
   User_email           VARCHAR2(40)         not null,
   User_password        VARCHAR2(40)         not null,
   Admin_email          VARCHAR2(40)         not null,
   constraint PK_USERS primary key (User_id)
);

/*======ADDED MANUALLY=======*/

ALTER TABLE "Users"
  ADD CONSTRAINT user_unique UNIQUE (User_name, User_surname,User_registration_date);

ALTER TABLE "Users"
  ADD CONSTRAINT email_unique UNIQUE (User_email);
  
ALTER TABLE "Users"
  ADD CONSTRAINT check_email
  CHECK ( REGEXP_LIKE (user_email, '[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}'));

ALTER TABLE "Users"
  ADD CONSTRAINT check_name 
  CHECK (REGEXP_LIKE(User_name,'[A-Z][a-z]{1,19}','c'));  

ALTER TABLE "Users"
  ADD CONSTRAINT check_surname 
  CHECK (REGEXP_LIKE(User_surname,'[A-Z][a-z]{1,19}','c'));
  
ALTER TABLE "Users"
  ADD CONSTRAINT admin_email_unique UNIQUE (Admin_email);
  
ALTER TABLE "Users"
  ADD CONSTRAINT check_admin_email
  CHECK ( REGEXP_LIKE (Admin_email, '[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}'));
  
ALTER TABLE "Users"
  ADD CONSTRAINT check_User_registration_date
  CHECK ( User_registration_date > date '2017-01-01');

/*==============================================================*/
/* Table: Vote                                                  */
/*==============================================================*/
create table Vote 
(
   Votings_id           INTEGER              not null,
   User_id              INTEGER              not null,
   constraint PK_VOTE primary key (Votings_id, User_id)
);

/*==============================================================*/
/* Index: "user view and vote2_FK"                              */
/*==============================================================*/
create index "user view and vote2_FK" on Vote (
   User_id ASC
);

/*==============================================================*/
/* Index: "voting has votes_FK"                                 */
/*==============================================================*/
create index "voting has votes_FK" on Vote (
   Votings_id ASC
);

/*==============================================================*/
/* Table: Votings                                               */
/*==============================================================*/
create table Votings 
(
   Votings_id           INTEGER              not null,
   Voting_name          CHAR(200)            not null,
   "Voting_start date"  DATE                 not null,
   "Voting_finish date" DATE                 not null,
   Voting_question      VARCHAR2(255)        not null,
   constraint PK_VOTINGS primary key (Votings_id)
);

ALTER TABLE Votings
  ADD CONSTRAINT votings_unique UNIQUE (Voting_name, "Voting_start date");

ALTER TABLE Votings
  ADD CONSTRAINT check_voting_start_date
  CHECK ( "Voting_start date" > date '2017-01-01');

ALTER TABLE Votings
  ADD CONSTRAINT check_voting_finish_date
  CHECK ( "Voting_finish date" > date '2017-01-01');

ALTER TABLE Votings
  ADD CONSTRAINT check_user_year
  CHECK ( "Voting_finish date" > "Voting_start date");

alter table Vote
   add constraint "FK_USER MAKE A VOTE" foreign key (User_id)
      references "Users" (User_id)
      on delete cascade;

alter table Vote
   add constraint "FK_VOTING HAS VOTES" foreign key (Votings_id)
      references Votings (Votings_id)
      on delete cascade;

