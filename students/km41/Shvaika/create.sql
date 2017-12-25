

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
   SIGNAL_DATA          BLOB                 not null,
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

