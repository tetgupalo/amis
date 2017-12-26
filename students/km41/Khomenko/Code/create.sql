/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/6/2017 9:48:15 AM                         */
/*==============================================================*/


alter table "Message"
   drop constraint FK_MESSAGE_CAN_BE_SE_NEWS;

alter table "Message"
   drop constraint FK_MESSAGE_CAN_GET_USER;

alter table "CAN_HUNT"
   drop constraint "FK_CAN_HUNT_CAN HUNT2_USER";

alter table "CAN_HUNT"
   drop constraint FK_CAN_HUNT_PLACEDAT;

alter table "CAN_VIEW_NEWS"
   drop constraint "FK_CAN_VIEW_CAN VIEW2_USER";

alter table "CAN_VIEW_NEWS"
   drop constraint FK_CAN_VIEW_NEWS;

drop index "can_get_FK";

drop index "can_be_sent_as_FK";

drop table "Message" cascade constraints;

drop table "News" cascade constraints;

drop table "PlaceDate" cascade constraints;

drop table "User" cascade constraints;

drop index "can_hunt_FK";

drop index "can hunt2_FK";

drop table "CAN_HUNT" cascade constraints;

drop index "can_view_FK";

drop index "can view2_FK";

drop table "CAN_VIEW_NEWS";

/*==============================================================*/
/* Table: "Message"                                             */
/*==============================================================*/
create table "Message" 
(
   "date_message"       DATE                 not null,
   "date_news"          DATE                 not null,
   "email"              VARCHAR2(100)            not null,
   "title_message"      VARCHAR2(256)            not null,
   "body_message"       VARCHAR2(4000)           not null,
   constraint PK_MESSAGE primary key ("date_message")
);

/*==============================================================*/
/* Index: "can_be_sent_as_FK"                                   */
/*==============================================================*/
create index "can_be_sent_as_FK" on "Message" (
   "date_news" ASC
);

/*==============================================================*/
/* Index: "can_get_FK"                                          */
/*==============================================================*/
create index "can_get_FK" on "Message" (
   "email" ASC
);

/*==============================================================*/
/* Table: "News"                                                */
/*==============================================================*/
create table "News" 
(
   "date_news"          DATE                 not null,
   "news_title"         VARCHAR2(256)             not null,
   "news_body"          VARCHAR2(4000)           not null,
   "news_comment"       VARCHAR2(1024),
   constraint PK_NEWS primary key ("date_news")
);

/*==============================================================*/
/* Table: "PlaceDate"                                           */
/*==============================================================*/
create table "PlaceDate" 
(
   "region_name"        VARCHAR2(50)             not null,
   "place_name"         VARCHAR2(50)             not null,
   "date_start"         DATE                 not null,
   "date_end"           DATE                 not null,
   "availability_place" NUMBER(1,0)             not null,
   constraint PK_PLACEDATE primary key ("place_name")
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   "email"              VARCHAR2(100)            not null,
   "first_name"         VARCHAR2(25)             not null,
   "last_name"          VARCHAR2(25)             not null,
   "password"           VARCHAR2(25)             not null,
   "phone_number"       VARCHAR2(10)             not null,
   "region"             VARCHAR2(25)             not null,
   constraint PK_USER primary key ("email")
);

/*==============================================================*/
/* Table: "can_hunt"                                            */
/*==============================================================*/
create table "CAN_HUNT"
(
   "region_name"        VARCHAR2(50)             not null,
   "email"              VARCHAR2(100)            not null,
   constraint PK_CAN_HUNT_REGION_AND_EMAIL primary key ("region_name", "email")
);

/*==============================================================*/
/* Index: "can hunt2_FK"                                        */
/*==============================================================*/
create index "can hunt2_FK" on "CAN_HUNT" (
   "email" ASC
);

/*==============================================================*/
/* Index: "can_hunt_FK"                                         */
/*==============================================================*/
create index "can_hunt_FK" on "CAN_HUNT" (
   "region_name" ASC
);

/*==============================================================*/
/* Table: "can_view"                                            */
/*==============================================================*/
create table "CAN_VIEW_NEWS" 
(
   "date_news"             DATE                     not null,
   "email"                 VARCHAR2(100)            not null,
   constraint PK_CAN_VIEW_DATE_AND_EMAIL primary key ("email", "date_news")
);

/*==============================================================*/
/* Index: "can view2_FK"                                        */
/*==============================================================*/
create index "can view2_FK" on "CAN_VIEW_NEWS" (
   "email" ASC
);

/*==============================================================*/
/* Index: "can_view_FK"                                         */
/*==============================================================*/
create index "can_view_FK" on "CAN_VIEW_NEWS" (
   "date_news" ASC
);

alter table "Message"
   add constraint FK_MESSAGE_CAN_BE_SE_NEWS foreign key ("date_news")
      references "News" ("date_news");

alter table "Message"
   add constraint FK_MESSAGE_CAN_GET_USER foreign key ("email")
      references "User" ("email");

alter table "CAN_HUNT"
   add constraint "FK_CAN_HUNT_CAN HUNT2_USER" foreign key ("email")
      references "User" ("email");

alter table "CAN_HUNT"
   add constraint FK_CAN_HUNT_PLACEDAT foreign key ("region_name")
      references "PlaceDate" ("region_name");

alter table "CAN_VIEW_NEWS"
   add constraint "FK_CAN_VIEW_CAN VIEW2_USER" foreign key ("email")
      references "User" ("email");

alter table "CAN_VIEW_NEWS"
   add constraint FK_CAN_VIEW_NEWS foreign key ("date_news")
      references "News" ("date_news");



/*======ADDED MANUALLY=======*/

/*==============================================================*/
/* For: User                                            */
/*==============================================================*/
ALTER TABLE "User"
    ADD CONSTRAINT check_email
    CHECK ( REGEXP_LIKE ("email", '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE "User"
    ADD CONSTRAINT check_first_name
    CHECK ( REGEXP_LIKE ("first_name", '^[A-Z?-????][a-z?-????-]+($|\s)', 'c'));
ALTER TABLE "User"
    ADD CONSTRAINT check_last_name
    CHECK ( REGEXP_LIKE ("last_name", '^[A-Z?-????][a-z?-????-]+($|\s)', 'c'));
ALTER TABLE "User"
    ADD CONSTRAINT check_first_name_len
    CHECK (length("first_name") < 25); 
ALTER TABLE "User"
    ADD CONSTRAINT check_last_name_len
    CHECK (length("last_name") < 25); 
ALTER TABLE "User"
    ADD CONSTRAINT check_password
    CHECK ( REGEXP_LIKE ("password", '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)'));
ALTER TABLE "User"
    ADD CONSTRAINT check_password_len
    CHECK ((length("password") < 25) and (length("password") > 6)); 
ALTER TABLE "User"
    ADD CONSTRAINT check_phone_number
    CHECK ( REGEXP_LIKE ("phone_number", '^[0-9]{10}($|\s)'));
ALTER TABLE "User"
    ADD CONSTRAINT check_region
    CHECK ( REGEXP_LIKE ("region", '^[A-Z?-????][a-z?-????-]+($|\s)', 'c'));
ALTER TABLE "User"
    ADD CONSTRAINT check_region_len
    CHECK (length("region") < 25); 
/*==============================================================*/
/* For: Message                                            */
/*==============================================================*/
ALTER TABLE "Message"
    ADD CONSTRAINT check_email_to_sent
    CHECK ( REGEXP_LIKE ("email", '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE "Message"
    ADD CONSTRAINT check_title_message
    CHECK ( REGEXP_LIKE ("title_message", '^[A-Z?-????][?-????,a-z .-0-9]+($|\s)', 'c'));
ALTER TABLE "Message"
    ADD CONSTRAINT check_title_message_len
    CHECK (length("title_message") < 256); 
ALTER TABLE "Message"
    ADD CONSTRAINT check_body_message
    CHECK ( REGEXP_LIKE ("body_message", '^[A-Z?-????][?-????,a-z .-0-9]+($|\s)', 'c'));
    ALTER TABLE "Message"
    ADD CONSTRAINT check_body_message_len
    CHECK (length("body_message") < 4000);

/*==============================================================*/
/* For: News                                                    */
/*==============================================================*/
ALTER TABLE "News"
    ADD CONSTRAINT check_news_title
    CHECK ( REGEXP_LIKE ("news_title", '^[A-Z?-????][?-????,a-z .-0-9]+($|\s)', 'c'));
ALTER TABLE "News"
    ADD CONSTRAINT check_news_title_len
    CHECK (length("news_title") < 256);
ALTER TABLE "News"
    ADD CONSTRAINT check_news_body
    CHECK ( REGEXP_LIKE ("news_body", '^[A-Z?-????][?-????,a-z .-0-9]+($|\s)', 'c'));
ALTER TABLE "News"
    ADD CONSTRAINT check_news_body_len
    CHECK (length("news_body") < 4000);
ALTER TABLE "News"
    ADD CONSTRAINT check_news_comment
    CHECK ( REGEXP_LIKE ("news_comment", '^[A-Z?-????][?-????,a-z .-0-9]+($|\s)', 'c'));
ALTER TABLE "News"
    ADD CONSTRAINT check_news_comment_len
    CHECK (length("news_comment") < 4000);

/*==============================================================*/
/* For: PlaceDate                                               */
/*==============================================================*/
ALTER TABLE "PlaceDate"
    ADD CONSTRAINT "check_region_name"
    CHECK ( REGEXP_LIKE ("region_name", '^[A-Z?-????][a-z?-????-]+($|\s)', 'c'));
ALTER TABLE "PlaceDate"
    ADD CONSTRAINT check_region_name_len
    CHECK (length("region_name") < 50);
ALTER TABLE "PlaceDate"
    ADD CONSTRAINT check_place_name
    CHECK ( REGEXP_LIKE ("place_name", '^[A-Z?-????][a-z?-????-]+($|\s)', 'c'));
ALTER TABLE "PlaceDate"
    ADD CONSTRAINT check_place_name_len
    CHECK (length("place_name") < 50);
ALTER TABLE "PlaceDate"
  ADD CONSTRAINT check_date_end
  CHECK ("date_end" > "date_start");
ALTER TABLE "PlaceDate"
    ADD CONSTRAINT check_availability_place
    CHECK  ("availability_place" in (0,1));

/*==============================================================*/
/* For: CAN_HUNT                                               */
/*==============================================================*/

ALTER TABLE "CAN_HUNT"
    ADD CONSTRAINT check_email_can_hunt
    CHECK ( REGEXP_LIKE ("email", '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE "CAN_HUNT"
    ADD CONSTRAINT check_region_name_can_hunt
    CHECK ( REGEXP_LIKE ("region_name", '^[A-Z?-????][a-z?-????-]+($|\s)', 'c'));
ALTER TABLE "PlaceDate"
    ADD CONSTRAINT check_region_name_can_hunt_len
    CHECK (length("region_name") < 50);

/*==============================================================*/
/* For: CAN_VIEW_NEWS                                           */
/*==============================================================*/

ALTER TABLE "CAN_VIEW_NEWS"
    ADD CONSTRAINT check_email_can_view_news
    CHECK ( REGEXP_LIKE ("email", '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
