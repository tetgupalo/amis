/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     26.12.2017 4:34:29                           */
/*==============================================================*/


alter table Checked
   drop constraint FK_CHECKED_WORK;

alter table Student
   drop constraint FK_STUDENT_IS_USER;

alter table Teacher
   drop constraint FK_TEACHER_IS_USER;

alter table Work
   drop constraint FK_WORK_STUDENT;

drop index Checked_work_FK;

drop table Checked cascade constraints;

drop table Student cascade constraints;

drop table Teacher cascade constraints;

drop table "User" cascade constraints;

drop index work_student_FK;

drop table Work cascade constraints;

/*==============================================================*/
/* Table: Checked                                               */
/*==============================================================*/
create table Checked 
(
   student_id_fk        NUMBER(50)           not null,
   work_id_fk           NUMBER(50)           not null,
   date_checked         DATE                 not null,
   rating               INTEGER              not null,
   constraint PK_CHECKED primary key (student_id_fk, work_id_fk)
);

/*==============================================================*/
/* Index: Checked_work_FK                                       */
/*==============================================================*/
create index Checked_work_FK on Checked (
   work_id_fk ASC,
   student_id_fk ASC
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student 
(
   Student_id           NUMBER(50)           not null,
   Group_name           VARCHAR2(10)         not null,
   constraint PK_STUDENT primary key (Student_id)
);

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher 
(
   Tacher_id            NUMBER(50)           not null,
   Cathedra_name        CLOB                 not null,
   constraint PK_TEACHER primary key (Tacher_id)
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   ID                   NUMBER(50)           not null,
   user_email           VARCHAR2(25)         not null,
   f_name               CLOB                 not null,
   l_name               CLOB                 not null,
   constraint PK_USER primary key (ID)
);

/*==============================================================*/
/* Table: Work                                                  */
/*==============================================================*/
create table Work 
(
   work_id              NUMBER(50)           not null,
   student_id_fk        NUMBER(50)           not null,
   Date_upload          DATE                 not null,
   "file"               RAW(5000)            not null,
   average_rating       INTEGER              not null,
   constraint PK_WORK primary key (work_id, student_id_fk)
);

/*==============================================================*/
/* Index: work_student_FK                                       */
/*==============================================================*/
create index work_student_FK on Work (
   student_id_fk ASC
);

alter table Checked
   add constraint FK_CHECKED_WORK foreign key (work_id_fk, student_id_fk)
      references Work (work_id, student_id_fk);

alter table Student
   add constraint FK_STUDENT_IS_USER foreign key (Student_id)
      references "User" (ID);

alter table Teacher
   add constraint FK_TEACHER_IS_USER foreign key (Tacher_id)
      references "User" (ID);

alter table Work
   add constraint FK_WORK_STUDENT foreign key (student_id_fk)
      references Student (Student_id);

