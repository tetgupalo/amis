/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     16.11.2017 20:29:31                          */
/*==============================================================*/


alter table "Key_word"
   drop constraint FK_KEY_WORD_REFERENCE_PROGRAM_;

alter table "Language_compilator"
   drop constraint FK_LANGUAGE_REFERENCE_PROGRAM_;

alter table "Structure_and_keyword"
   drop constraint FK_STRUCTUR_REFERENCE_KEY_WORD;

alter table "Structure_and_keyword"
   drop constraint FK_STRUCTUR_REFERENCE_LANGUAGE;

drop table "Key_word" cascade constraints;

drop table "Language_compilator" cascade constraints;

drop table "Language_structure" cascade constraints;

drop table "Program_language" cascade constraints;

drop table "Structure_and_keyword" cascade constraints;

/*==============================================================*/
/* Table: "Key_word"                                            */
/*==============================================================*/
create table "Key_word" 
(
   "id_key_word"        INTEGER              not null,
   "key_word"           CHAR(20),
   "id_lang"            INTEGER,
   constraint PK_KEY_WORD primary key ("id_key_word")
);

/*==============================================================*/
/* Table: "Language_compilator"                                 */
/*==============================================================*/
create table "Language_compilator" 
(
   "id_compilator"      INTEGER              not null,
   "id_lang"            INTEGER,
   "compiler_version"   CHAR(15),
   "path_to_compilator" CHAR(256),
   constraint PK_LANGUAGE_COMPILATOR primary key ("id_compilator")
);

/*==============================================================*/
/* Table: "Language_structure"                                  */
/*==============================================================*/
create table "Language_structure" 
(
   "id_structure"       INTEGER              not null,
   "structure"          CLOB,
   constraint PK_LANGUAGE_STRUCTURE primary key ("id_structure")
);

/*==============================================================*/
/* Table: "Program_language"                                    */
/*==============================================================*/
create table "Program_language" 
(
   "name_lang"          CHAR(20),
   "id_lang"            INTEGER              not null,
   constraint PK_PROGRAM_LANGUAGE primary key ("id_lang")
);

/*==============================================================*/
/* Table: "Structure_and_keyword"                               */
/*==============================================================*/
create table "Structure_and_keyword" 
(
   "id_key_word"        INTEGER,
   "id_structure"       INTEGER
);
ALTER TABLE "Program_language"
ADD CONSTRAINT constraint_name UNIQUE ("name_lang");

ALTER TABLE "Language_compilator"
ADD CONSTRAINT constraint_name UNIQUE ("path_to_compilator");
alter table "Key_word"
   add constraint FK_KEY_WORD_REFERENCE_PROGRAM_ foreign key ("id_lang")
      references "Program_language" ("id_lang");

alter table "Key_word"
   add constraint check_key 
      CHECK (REGEXP_LIKE("key_word", '[a-zA-Z]+$','c'));
      
alter table "Language_compilator"
   add constraint FK_LANGUAGE_REFERENCE_PROGRAM_ foreign key ("id_lang")
      references "Program_language" ("id_lang");
	  
alter table "Language_compilator"
   add constraint check_path 
      CHECK (REGEXP_LIKE("path_to_compilator", '^[A-Z]:[\\[a-zA-Z0-9]+]*$','c'));
	  	  
alter table "Language_compilator"
   add constraint check_version 
      CHECK ("compiler_version" > 0);
	  
alter table "Structure_and_keyword"
   add constraint FK_STRUCTUR_REFERENCE_KEY_WORD foreign key ("id_key_word")
      references "Key_word" ("id_key_word");

alter table "Structure_and_keyword"
   add constraint FK_STRUCTUR_REFERENCE_LANGUAGE foreign key ("id_structure")
      references "Language_structure" ("id_structure");

