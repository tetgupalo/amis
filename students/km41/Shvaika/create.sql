

alter table ALARM
   drop constraint FK_ALARM_HAS_SIGNAL;

alter table ALARM
   drop constraint FK_USER_HAS_ALARM;

alter table SIGNAL
   drop constraint FK_ADMIN_ADD_SIGNAL;

drop index ALARM_HAS_A_SIGNAL_FK;

drop index USER_HAS_ALARM_FK;

drop table ALARM cascade constraints;

drop index ADMIN_ADD_NEW_SIGNAL_FK;

drop table SIGNAL cascade constraints;

drop table USERS cascade constraints;

/*==============================================================*/
/* Table: ALARM                                                 */
/*==============================================================*/
create table ALARM 
(
   ALARM_ID             INTEGER              not null,
   ID                   INTEGER              not null,
   SIGNAL_ID            INTEGER              not null,
   TIME_OF_SIGNAL       DATE                 not null,
   DURATION             INTEGER              not null,
   SNOOZE               INTEGER              not null,
   VOLUME               INTEGER              not null,
   SUNDAY               INTEGER              not null,
   MONDAY               INTEGER              not null,
   TUESDAY              INTEGER              not null,
   WEDNESDAY            INTEGER              not null,
   THURSDAY             INTEGER              not null,
   FRIDAY               INTEGER              not null,
   SATURDAY             INTEGER              not null,
   constraint PK_ALARM primary key (SIGNAL_ID, ID, ALARM_ID)
);

/*==============================================================*/
/* Index: USER_HAS_ALARM_FK                                     */
/*==============================================================*/
create index USER_HAS_ALARM_FK on ALARM (
   ID ASC
);

/*==============================================================*/
/* Index: ALARM_HAS_A_SIGNAL_FK                                 */
/*==============================================================*/
create index ALARM_HAS_A_SIGNAL_FK on ALARM (
   SIGNAL_ID ASC
);

/*==============================================================*/
/* Table: SIGNAL                                                */
/*==============================================================*/
create table SIGNAL 
(
   SIGNAL_ID            INTEGER              not null,
   ID                   INTEGER              not null,
   SIGNAL_NAME          VARCHAR2(25)         not null,
   SIGNAL_DATA          BFILE                not null,
   constraint PK_SIGNAL primary key (SIGNAL_ID)
);

/*==============================================================*/
/* Index: ADMIN_ADD_NEW_SIGNAL_FK                               */
/*==============================================================*/
create index ADMIN_ADD_NEW_SIGNAL_FK on SIGNAL (
   ID ASC
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS 
(
   ID                   INTEGER              not null,
   ROLE                 VARCHAR2(20)         not null,
   EMAIL                VARCHAR2(40)         not null,
   FIRSTNAME            VARCHAR2(25)         not null,
   SECONDNAME           VARCHAR2(25),
   PASS                 VARCHAR2(20)         not null,
   constraint PK_USERS primary key (ID)
);

alter table ALARM
   add constraint FK_ALARM_HAS_SIGNAL foreign key (SIGNAL_ID)
      references SIGNAL (SIGNAL_ID);

alter table ALARM
   add constraint FK_USER_HAS_ALARM foreign key (ID)
      references USERS (ID);

alter table SIGNAL
   add constraint FK_ADMIN_ADD_SIGNAL foreign key (ID)
      references USERS (ID);

/*==============================================================*/
/*                      CHECK__USERS                         */
/*==============================================================*/	  

ALTER TABLE USERS 
   ADD CONSTRAINT check_role
      CHECK (ROLE IN ('ADMIN' , 'USER'));

ALTER TABLE USERS
   ADD CONSTRAINT check_email
      CHECK ( REGEXP_LIKE (EMAIL, '[a-z0-9._]+@[a-z0-9._]+\.[a-z]{2,4}'));
           
ALTER TABLE USERS
  ADD CONSTRAINT check_firstname
    CHECK (REGEXP_LIKE(FIRSTNAME,'[A-Z a-z]{3,20}'));  
    
 ALTER TABLE USERS
  ADD CONSTRAINT check_secondname   
    CHECK (REGEXP_LIKE(SECONDNAME,'[A-Z a-z]{3,20}')); 
  
ALTER TABLE USERS
 ADD CONSTRAINT check_password
  CHECK (REGEXP_LIKE( PASSWORD,'[A-Za-z0-9_]{6,10}'));   	  

  
  
/*==============================================================*/
/*                      CHECK__SIGNAL                           */
/*==============================================================*/ 
ALTER TABLE SIGNAL
  ADD CONSTRAINT check_signal_name
    CHECK (REGEXP_LIKE(SIGNAL_NAME,'[A-Z a-z 0-9]{3,10}'));  

/*==============================================================*/
/*                      CHECK__ALARM                            */
/*==============================================================*/


ALTER TABLE ALARM 
   ADD CONSTRAINT check_duration
      CHECK (DURATION IN (1,2,3,4,5,6,7,8,9,10));
      
 ALTER TABLE ALARM 
   ADD CONSTRAINT check_snooze
      CHECK (SNOOZE IN (5,10,15,30,60));     
      
 ALTER TABLE ALARM 
   ADD CONSTRAINT check_volume
      CHECK (VOLUME IN (1,2,3,4,5,6,7,8,9,10));     
	
ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks1
      CHECK (SUNDAY  IN ('1' , '0'));

ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks2
      CHECK (MONDAY  IN ('1' , '0'));
 
ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks3
      CHECK (TUESDAY  IN ('1' , '0'));      

ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks4
      CHECK (WEDNESDAY  IN ('1' , '0')); 

ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks5
      CHECK (THURSDAY  IN ('1' , '0')); 

ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks6
      CHECK (FRIDAY  IN ('1' , '0')); 
      
ALTER TABLE ALARM 
   ADD CONSTRAINT check_weeks7
      CHECK (SATURDAY  IN ('1' , '0'));  	  
	  
	  
/*==============================================================*/
/*                      TRIGGERS                                */
/*==============================================================*/	  


	  
CREATE SEQUENCE USERS_SEG START WITH 1;


CREATE OR REPLACE TRIGGER USERS_BIR 
BEFORE INSERT ON USERS 
FOR EACH ROW

BEGIN
  SELECT USERS_SEG.NEXTVAL
  INTO   :NEW.ID
  FROM   DUAL;
END;	  

CCREATE SEQUENCE SIGNAL_SEG START WITH 1;

CREATE OR REPLACE TRIGGER SIGNAL_BIR 
BEFORE INSERT ON SIGNAL 
FOR EACH ROW

BEGIN
  SELECT SIGNAL_SEG.NEXTVAL
  INTO   :NEW.SIGNAL_ID
  FROM   DUAL;
END;	 

CREATE SEQUENCE ALARM_SEG START WITH 1;


CREATE OR REPLACE TRIGGER ALARM_BIR 
BEFORE INSERT ON ALARM 
FOR EACH ROW

BEGIN
  SELECT ALARM_SEG.NEXTVAL
  INTO   :NEW.ALARM_ID
  FROM   DUAL;
END;	 

CREATE OR REPLACE TRIGGER check_user 
BEFORE INSERT ON SIGNAL FOR EACH ROW 
DECLARE
 ID_ADMIN NUMBER;

BEGIN 
 SELECT ID INTO ID_ADMIN  FROM  USERS   WHERE ROLE = 'ADMIN' ;
 IF :NEW.ID != ID_ADMIN  THEN
 RAISE_APPLICATION_ERROR(-20001 , 'ERROR ' );
 END IF;
 END;	  