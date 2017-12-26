/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/6/2017 9:48:15 AM                         */
/*==============================================================*/

set define off;
alter table MESSAGE
   drop constraint FK_MESSAGE_CAN_BE_SE_NEWS;

alter table MESSAGE
   drop constraint FK_MESSAGE_CAN_GET_USER;

alter table USERS_HUNT
   drop constraint FK_CAN_HUNT_CAN_HUNT2_USER;
   
alter table USERS_HUNT
   drop constraint PK_USERS_HUNT_REGION_AND_EMAIL;
   
alter table USERS_HUNT
   drop constraint FK_USERS_HU_RELATIONS_DATEHUNT;
   
alter table USERS_HUNT
   drop constraint FK_USERS_HU_CAN_HUNT_PLACEHUN;
   
drop index CAN_GET_FK;

drop table MESSAGE cascade constraints;

drop table NEWS cascade constraints;

drop table PlaceHunt cascade constraints;

drop table DateHunt cascade constraints;

drop table USERS cascade constraints;

drop index CAN_HUNT_FK;

drop index CAN_HUNT2_FK;

drop table USERS_HUNT cascade constraints;

drop type hunter_type;

drop type hunter_type_obj;
/*==============================================================*/
/* Table: "Message"                                             */
/*==============================================================*/
create table MESSAGE 
(
   date_message        	DATE                 	 not null,
   date_news        	DATE                 	 not null,
   email              	VARCHAR2(100)            not null,
   title_message      	VARCHAR2(256)            not null,
   body_message       	VARCHAR2(4000)           not null,
   send_message         NUMBER(1,0)              not null,
   constraint PK_MESSAGE primary key (date_message)
);


/*==============================================================*/
/* Index: "can_get_FK"                                          */
/*==============================================================*/
create index CAN_GET_FK on MESSAGE (
   email ASC
);
/*==============================================================*/
/* Table: NEWS                                                */
/*==============================================================*/
create table NEWS
(
   date_news          DATE                 		not null,
   news_title         VARCHAR2(256)             not null,
   news_body          VARCHAR2(4000)            not null,
   constraint PK_NEWS primary key (date_news)
);

/*==============================================================*/
/* Table: PlaceHunt                                           */
/*==============================================================*/
create table PlaceHunt 
(
   region_name        VARCHAR2(50)             not null,
   place_name         VARCHAR2(50)             not null,
   limit_hunters       NUMBER(4)                not null,
   availability_place NUMBER(1,0)              not null,
   constraint PK_PLACEHUNT primary key (place_name)
);
/*==============================================================*/
/* Table: PlaceDate                                           */
/*==============================================================*/
Create table DateHunt 
(
	date_hunt        DATE                    not null,
	permission       NUMBER(1, 0)            not null,
	constraint PK_DATEHUNT primary key (date_hunt)
);

/*==============================================================*/
/* Table: USERS                                                */
/*==============================================================*/
create table USERS 
(
   email              VARCHAR2(100)            not null,
   first_name         VARCHAR2(25)             not null,
   last_name          VARCHAR2(25)                     ,
   password           VARCHAR2(25)             not null,
   phone_number       VARCHAR2(10)                     ,
   region             VARCHAR2(50)                     ,
   delete_user		  NUMBER(1,0)              not null,
   admin_root 		  NUMBER(1,0)			   not null,
   constraint PK_USER primary key (email)
);

/*==============================================================*/
/* Table: "can_hunt"                                            */
/*==============================================================*/
create table USERS_HUNT
(
   place_name        VARCHAR2(50)             not null,
   email             VARCHAR2(100)            not null,
   date_hunt		 DATE					   not null,
   constraint PK_USERS_HUNT_REGION_AND_EMAIL primary key (place_name, email)
);

/*==============================================================*/
/* Index: CAN_HUNT2_FK                                        */
/*==============================================================*/
create index CAN_HUNT2_FK on USERS_HUNT (
   email ASC
);

/*==============================================================*/
/* Index: CAN_HUNT_FK                                         */
/*==============================================================*/
create index CAN_HUNT_FK on USERS_HUNT (
   place_name ASC
);


alter table MESSAGE
   add constraint FK_MESSAGE_CAN_BE_SE_NEWS foreign key (date_news)
      references NEWS (date_news)
      ON DELETE CASCADE;
      
alter table MESSAGE
   add constraint FK_MESSAGE_CAN_GET_USER foreign key (email)
      references USERS (email)
      ON DELETE CASCADE;

alter table USERS_HUNT
   add constraint FK_CAN_HUNT_CAN_HUNT2_USER foreign key (email)
      references USERS (email)
      ON DELETE CASCADE;
	  
alter table USERS_HUNT
   add constraint FK_USERS_HU_RELATIONS_DATEHUNT foreign key (date_hunt)
      references DateHunt (date_hunt)
      ON DELETE CASCADE;
	  
alter table USERS_HUNT
   add constraint FK_USERS_HU_CAN_HUNT_PLACEHUN foreign key (place_name)
      references PlaceHunt (place_name)
      ON DELETE CASCADE;	  


/*======ADDED MANUALLY=======*/

/*==============================================================*/
/* For: USERS                                            */
/*==============================================================*/
ALTER TABLE USERS
    ADD CONSTRAINT check_email
    CHECK ( REGEXP_LIKE (email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE USERS
    ADD CONSTRAINT check_first_name
    CHECK ( REGEXP_LIKE (first_name, N'[A-Za-z][a-zA-Z][^#&<>\"]{1,25}$', 'c'));
ALTER TABLE USERS
    ADD CONSTRAINT check_last_name
    CHECK ( REGEXP_LIKE (last_name, '[A-Za-z][a-zA-Z][^#&<>\"]{1,25}$', 'c'));
ALTER TABLE USERS
    ADD CONSTRAINT check_password
    CHECK ( REGEXP_LIKE (password, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)', 'c'));
ALTER TABLE USERS
    ADD CONSTRAINT check_password_len
    CHECK ((length(password) < 25) and (length(password) > 6)); 
ALTER TABLE USERS
    ADD CONSTRAINT check_phone_number
    CHECK ( REGEXP_LIKE (phone_number, '^[0-9]{10}($|\s)','c'));
ALTER TABLE USERS
    ADD CONSTRAINT check_region
    CHECK ( REGEXP_LIKE (region, '^[A-Za-z][a-zA-Z][^#&<>\"]{1,50}$', 'c'));
ALTER TABLE USERS
    ADD CONSTRAINT check_region_len
    CHECK (length(region) < 25); 
ALTER TABLE USERS
    ADD CONSTRAINT delete_user_check
    CHECK  (delete_user in (0,1));
ALTER TABLE USERS
    ADD CONSTRAINT is_admin_root_check
    CHECK  (admin_root in (0,1));
/*==============================================================*/
/* For: Message                         ^[0-1]{1}($|\s)                   */
/*==============================================================*/
ALTER TABLE MESSAGE
    ADD CONSTRAINT check_email_to_sent
    CHECK ( REGEXP_LIKE (email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE MESSAGE
    ADD CONSTRAINT check_title_message
    CHECK ( REGEXP_LIKE (title_message, '[A-Za-z][a-zA-Z][^#&<>\"]{1,256}', 'c'));
 
ALTER TABLE MESSAGE
    ADD CONSTRAINT check_body_message
    CHECK ( REGEXP_LIKE (body_message, '[A-Za-z][a-zA-Z][^#&<>\"]{1,4000}', 'c'));

/*==============================================================*/
/* For: News                                                    */
/*==============================================================*/
ALTER TABLE NEWS
    ADD CONSTRAINT check_news_title
    CHECK ( REGEXP_LIKE (news_title, '[A-Za-z][a-zA-Z][^#&<>\"]{1,256}', 'c'));

ALTER TABLE NEWS
    ADD CONSTRAINT check_news_body
    CHECK ( REGEXP_LIKE (news_body, '[A-Za-z][a-zA-Z][^#&<>\"]{1,4000}', 'c'));
/*==============================================================*/
/* For: PlaceHunt                                               */
/*==============================================================*/
ALTER TABLE PlaceHunt
    ADD CONSTRAINT check_region_name
    CHECK ( REGEXP_LIKE (region_name, '^[A-Za-z][a-zA-Z][^#&<>\"]{1,50}$', 'c'));
ALTER TABLE PlaceHunt
    ADD CONSTRAINT check_place_name
    CHECK ( REGEXP_LIKE (place_name, '^[A-Za-z][a-zA-Z][^#&<>\"]{1,50}$', 'c'));
ALTER TABLE PlaceHunt
    ADD CONSTRAINT check_availability_place
    CHECK  (availability_place in (0,1));
ALTER TABLE PlaceHunt
    ADD CONSTRAINT check_limit
    CHECK  (availability_place < 1000);
	
ALTER TABLE DateHunt
    ADD CONSTRAINT check_permission
    CHECK  (permission in (0,1));

/*==============================================================*/
/* For: CAN_HUNT                                               */
/*==============================================================*/

ALTER TABLE USERS_HUNT
    ADD CONSTRAINT check_email_can_hunt
    CHECK ( REGEXP_LIKE (email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE USERS_HUNT
    ADD CONSTRAINT check_region_name_can_hunt
    CHECK ( REGEXP_LIKE (place_name, '^[A-Za-z][a-zA-Z][^#&<>\"]{1,50}$', 'c'));
/*================================================================================================================*/
/*                                                  Views                                                          */
/*==============================================================---------------------------------------------------*/
/*==============================================================*/
/*                          View  ADMIN_USER_VIEW               */
/*==============================================================*/
create or replace view admins_view as
Select email, admin_root from USERS 
where admin_root = '1';
/*==============================================================*/
/*                          View  USERLOGIN                     */
/*==============================================================*/
Create or replace View UserLoginView as
Select email, password, first_name from USERS
where USERS.delete_user = 0;

/*==============================================================*/
/*                          View NEWS_FOR_MAIN_PAGE             */
/*==============================================================*/
Create or replace view NEWS_FOR_MAIN_PAGE as
SELECT news_title, news_body FROM 
(SELECT news_title, news_body FROM News
Order by date_news DESC)
where (rownum <= 3);

/*==============================================================*/
/*                          View FILTER_HUNT                   */
/*==============================================================*/

create or replace view FILTER_HUNT as
Select date_hunt, place_name, region_name from 
(Select DateHunt.date_hunt, PlaceHunt.place_name, PlaceHunt.region_name from DateHunt, PlaceHunt where (availability_place=1 and permission = 1));

/*==============================================================*/
/*                          View USERS_HUNT_VIEW               */
/*==============================================================*/

Create or replace View USERS_HUNT_VIEW as
Select place_name, email, date_hunt from USERS_HUNT;

/*==============================================================*/
/*                          View NEWS_VIEW               */
/*==============================================================*/
Create or replace view NEWS_VIEW as 
Select date_news, news_title, news_body, row_number() 
over (order by date_news DESC) as R 
from NEWS;

/*==============================================================*/
/*                          View DateHunt_VIEW                  */
/*==============================================================*/
Create or replace VIEW DateHunt_VIEW as
Select date_hunt from DateHunt
where permission = 1;
/*==============================================================*/
/*                          View PlaceHunt_VIEW                  */
/*==============================================================*/
create or replace view PlaceHunt_VIEW as 
Select REGION_NAME, PLACE_NAME, LIMIT_HUNTERS, AVAILABILITY_PLACE from PlaceHunt;

/*==============================================================*/
/*                          View USERS_VIEW                     */
/*==============================================================*/
create or replace view users_view as
select email, first_name, last_name, phone_number, region from USERS
where DELETE_USER = 0 and ADMIN_ROOT = 0;



/*================================================================================================================*/
/*                                                  TRIGGERS                                                       */
/*==============================================================---------------------------------------------------*/

/*==============================================================*/
/*                    Trigger check_to_limit_hunter             */
/*==============================================================*/


create or replace trigger check_to_limit_hunter
    instead of INSERT or UPDATE ON USERS_HUNT_VIEW
    declare 
begin
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    if HUNTVALUE.NumberOfHunting(:new.place_name) <= HUNTVALUE.LIMITPLACEHUNT(:new.place_name) then
    INSERT INTO USERS_HUNT(place_name, email, date_hunt) 
    VALUES (:new.place_name, :new.email, :new.date_hunt);
    ELSE
    UPDATE PlaceHunt 
    set availability_place = 1
    where place_name = :new.place_name;
    end if;
   EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002, 'LIMIT of hunting place. YOU cant add new!.');
end;
/

/*==============================================================*/
/*             Trigger delete from DATE_HUNT_VIEW               */
/*==============================================================*/

Create or replace trigger delete_from_date_hunt_trigger 
INSTEAD OF DELETE ON DateHunt_VIEW
referencing new as new old as old
begin 
DELETE FROM DateHunt where DATE_HUNT=:old.DATE_HUNT;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,'YOU cant delete!.');
end;
/
/*==============================================================*/
/*                   Trigger insert on  DATE_HUNT_VIEW          */
/*==============================================================*/

create or replace trigger trigger_insert_date_hunt_view  instead of insert on DATEHUNT_VIEW
begin
if :new.date_hunt >= sysdate then
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO DATEHUNT (date_hunt, permission) values (:new.date_hunt, '1');
end if;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU cant add new!.');
end;
/

/*==============================================================*/
/*                   Trigger delete from Place_HUNT_VIEW          */
/*==============================================================*/

create or replace trigger delete_place_hunt_view_trigger instead of delete ON PlaceHunt_View 
referencing new as new old as old
begin 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
DELETE FROM PlaceHunt where place_name=:old.place_name;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU cant delete!.');
end;
/

/*==============================================================*/
/*                   Trigger insert on  Place_HUNT_VIEW          */
/*==============================================================*/

create or replace trigger trigger_insert_place_hunt_view  instead of insert on PlaceHunt_VIEW
begin
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO PLACEHUNT (region_name, place_name, AVAILABILITY_PLACE, LIMIT_HUNTERS) 
values (:new.region_name, :new.place_name, :new.AVAILABILITY_PLACE, :new.LIMIT_HUNTERS);
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU cant add new!.');
end;
/
/*==============================================================*/
/*                   Trigger UPDATE on  Place_HUNT_VIEW          */
/*==============================================================*/
create or replace trigger update_place_hunt_trigger instead of update on PlaceHunt_VIEW
referencing new as new old as old
begin
Update PlaceHunt SET
region_name = :new.region_name,
place_name = :new.place_name,
availability_place = :new.availability_place,
limit_hunters = :new.limit_hunters
where PlaceHunt.place_name = :new.place_name;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU can`t Update!.');
end;
/
/*==============================================================*/
/*                   Trigger UPDATE on  USERS_VIEW          */
/*==============================================================*/

create or replace trigger edit_user_trigger instead of update on USERS_VIEW
begin
Update USERS SET
email = :new.email,
first_name = :new.first_name,
last_name = :new.last_name,
phone_number = :new.phone_number,
region = :new.region
where USERS.email = :new.email;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU can`t Update!.');
end;
/
/*==============================================================*/
/*                   Trigger DELETE on  USERS_VIEW          */
/*==============================================================*/

create or replace trigger delete_user_trigger instead of delete on USERS_VIEW
begin
Update USERS SET
DELETE_USER = '1'
where USERS.email = :old.email;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU can`t Update!.');
end;

/
/*==============================================================*/
/*                   Trigger DELETE on  NEWS_VIEW          */
/*==============================================================*/


Create or replace trigger delete_from_news_trigger 
INSTEAD OF DELETE ON NEWS_VIEW
referencing new as new old as old
begin 
DELETE FROM NEWS where NEWS_TITLE=:old.NEWS_TITLE;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,'YOU cant delete!.');
end;
/

/*==============================================================*/
/*                   Trigger UPDATE on  NEWS_VIEW               */
/*==============================================================*/

create or replace trigger update_news_trigger instead of update on NEWS_VIEW
referencing new as new old as old
begin
Update NEWS SET
news_title = :new.news_title,
news_body = :new.news_body
where NEWS.news_title = :old.news_title;
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU can`t Update!.');
end;
/

/*==============================================================*/
/*                   Trigger INSERT on  NEWS_VIEW               */
/*==============================================================*/


create or replace trigger trigger_insert_news_view  instead of insert on NEWS_VIEW
begin
INSERT INTO NEWS (date_news, news_title, news_body) 
values (SYSDATE, :new.news_title, :new.news_body);
EXCEPTION
  WHEN OTHERS THEN
    raise_application_error (-20002,' YOU cant add new!.');
end;

/


/*================================================================================================================*/
/*                                                  PACKAGES                                                       */
/*==============================================================---------------------------------------------------*/
/*==============================================================*/
/*   PACKAGE HUNT VALUE (LIMIT CHECK AND COUNT HUNTERING)       */
/*==============================================================*/
CREATE OR REPLACE PACKAGE HUNTVALUE AS
  FUNCTION NumberOfHunting(place VARCHAR2) return NUMBER;
  FUNCTION LimitPlaceHunt(place VARCHAR2) return NUMBER;
END HUNTVALUE;
/

create or replace package body HUNTVALUE as

function NumberOfHunting(place VARCHAR2)
return Number is
    number_hunters_in_place Number(4);
    Begin 
    number_hunters_in_place:=0;
        Select count(*) into number_hunters_in_place from USERS_HUNT
            where USERS_HUNT.place_name = place;
    Return number_hunters_in_place;
    END NumberOfHunting; 
	
function LimitPlaceHunt(place VARCHAR2)
    return NUMBER is
    num PLACEHUNT.LIMIT_HUNTERS%TYPE;
begin
    select limit_hunters into num from PLACEHUNT
    where PLACEHUNT.place_name = place;
return num;
end LimitPlaceHunt;

end HUNTVALUE;	
/



/*==============================================================*/
/*                  PACKAGE GENERATE MESSAGE FOR USERS          */
/*==============================================================*/
create or replace package MESSAGE_FOR_USERS_GENERATE as 
procedure message_for_users;
end MESSAGE_FOR_USERS_GENERATE;
/
create or replace package body MESSAGE_FOR_USERS_GENERATE as
procedure message_for_users as
begin
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
MERGE INTO MESSAGE M
USING (Select USERS.email, NEWS.date_news, NEWS.news_title, NEWS.news_body from NEWS, USERS) N
ON (M.date_news = N.date_news)
when NOT MATCHED THEN
INSERT (date_message, date_news, email, title_message, body_message, send_message)
VALUES (SYSDATE, N.date_news, N.email, N.news_title, N.news_body, '0');
commit;
end message_for_users;
end MESSAGE_FOR_USERS_GENERATE;

/
CREATE or replace TYPE hunter_type_obj AS OBJECT 
( 
  date_hunt           date,
   place_name          VARCHAR2(50),
   region_name        VARCHAR2(50)
)
/
CREATE or replace TYPE hunter_type AS TABLE OF hunter_type_obj
/

create or replace function SortHuntPlaceDate(start_row in NUMBER, end_row in NUMBER)
Return hunter_type PIPELINED is
CURSOR table_data is 
Select date_hunt, place_name, region_name 
FROM (Select date_hunt, place_name, region_name, row_number() over (order by date_hunt DESC) as R 
FROM FILTER_HUNT) 
where R = start_row;
row_cursor   table_data%ROWTYPE;
return_table    hunter_type_obj;
begin
OPEN table_data;
loop
    fetch table_data INTO row_cursor;
    return_table := hunter_type_obj(row_cursor.date_hunt, row_cursor.place_name, row_cursor.region_name);
    pipe row (return_table);
    EXIT WHEN table_data%NOTFOUND;
end loop;
close table_data;
return;
end SortHuntPlaceDate;
/














