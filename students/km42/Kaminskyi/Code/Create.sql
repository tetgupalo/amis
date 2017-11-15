/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11.11.2017 17:00:12                          */
/*==============================================================*/

/*==============================================================*/
/* Table: APPLICATION                                           */
/*==============================================================*/
CREATE TABLE APPLICATION 
(
   "STATE_NAME"         VARCHAR2(15)         NOT NULL,
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "APPLICATION_ID"     INTEGER              NOT NULL,
   "ENGINE_NUMBER"      VARCHAR2(20)         NOT NULL,
   "BODY_NUMBER"        VARCHAR2(20)         NOT NULL,
   "APPLICATION_STATUS" SMALLINT             NOT NULL,
   "CAR_BRAND"          VARCHAR2(20)         NOT NULL,
   "CAR_MODEL"          VARCHAR2(20)         NOT NULL,
   "CAR_YEAR"           DATE                 NOT NULL,
   "LAST_TECHNICAL_INSPECTION" DATE          NOT NULL,
   "PRICE_PER_DAY"      NUMBER(8,2)          NOT NULL,
   CONSTRAINT PK_APPLICATION PRIMARY KEY ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID")
);

/*==============================================================*/
/* Index: "LESSOR_FK"                                           */
/*==============================================================*/
CREATE INDEX "LESSOR_FK" ON APPLICATION (
   "ROLE" ASC,
   "EMAIL" ASC
);

/*==============================================================*/
/* Index: "CAR_HAS_A_STATE_FK"                                  */
/*==============================================================*/
CREATE INDEX "CAR_HAS_A_STATE_FK" ON APPLICATION (
   "STATE_NAME" ASC
);

/*==============================================================*/
/* Table: COMMENTS                                              */
/*==============================================================*/
CREATE TABLE COMMENTS 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "COMMENTS_DATE"      DATE                 NOT NULL,
   "COMMENTS_TEXT"      VARCHAR(200)         NOT NULL,
   CONSTRAINT PK_COMMENTS PRIMARY KEY ("ROLE", "EMAIL", "COMMENTS_DATE")
);

/*==============================================================*/
/* Index: "COMMENTED_FK"                                        */
/*==============================================================*/
CREATE INDEX "COMMENTED_FK" ON COMMENTS (
   "ROLE" ASC,
   "EMAIL" ASC
);

/*==============================================================*/
/* Table: PHOTOS                                                */
/*==============================================================*/
CREATE TABLE PHOTOS 
(
   "STATE_NAME"         VARCHAR2(15)         NOT NULL,
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "APPLICATION_ID"     INTEGER      	     NOT NULL,
   "PHOTO_NAME"         VARCHAR2(20)         NOT NULL,
   "PHOTO"              VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_PHOTOS PRIMARY KEY ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "PHOTO_NAME")
);

/*==============================================================*/
/* Index: "CAR_PHOTOS_FK"                                       */
/*==============================================================*/
CREATE INDEX "CAR_PHOTOS_FK" ON PHOTOS (
   "STATE_NAME" ASC,
   "ROLE" ASC,
   "EMAIL" ASC,
   "APPLICATION_ID" ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
CREATE TABLE ROLE 
(
   "ROLE"               VARCHAR2(10)         NOT NULL,
   "DESCRIPTION"        VARCHAR2(200)        NOT NULL,
   CONSTRAINT PK_ROLE PRIMARY KEY ("ROLE")
);

/*==============================================================*/
/* Table: STATE                                                 */
/*==============================================================*/
CREATE TABLE STATE 
(
   "STATE_NAME"         VARCHAR2(15)         NOT NULL,
   "STATE_DESCRIPTION"  VARCHAR2(50)         NOT NULL,
   "SCALE"              NUMBER(10)           NOT NULL,
   CONSTRAINT PK_STATE PRIMARY KEY ("STATE_NAME")
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
CREATE TABLE "USER" 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "LOGIN"              VARCHAR2(20)         NOT NULL,
   "PASSWORD"           VARCHAR2(20)         NOT NULL,
   "DRIVER_LICENCE"     DATE                 NOT NULL,
   "NUMBER_DRIVER_LICENCE" VARCHAR2(13)              NOT NULL,
   "FIRSTNAME"          VARCHAR2(20)         NOT NULL,
   "LASTNAME"           VARCHAR2(20)         NOT NULL,
   "PHONE_NUMBER"       CHAR(18)             NOT NULL,
   "BIRTHDAY"           DATE,
   "RATING"             SMALLINT,
   CONSTRAINT PK_USER PRIMARY KEY ("ROLE", "EMAIL")
);

/*==============================================================*/
/* Index: "HAS A ROLE_FK"                                       */
/*==============================================================*/
CREATE INDEX "HAS A ROLE_FK" ON "USER" (
   "ROLE" ASC
);

/*==============================================================*/
/* Table: "BOOK_CAR"                                            */
/*==============================================================*/
CREATE TABLE "BOOK_CAR" 
(
   "STATE_NAME"         VARCHAR2(15)         NOT NULL,
   "APP_ROLE"           VARCHAR2(15)         NOT NULL,
   "APP_EMAIL"          VARCHAR2(20)         NOT NULL,
   "APPLICATION_ID"     INTEGER              NOT NULL,
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "USE_ROLE"           VARCHAR2(15),
   "USE_EMAIL"          VARCHAR2(20),
   "CONTRACT_NUMBER"    INTEGER              NOT NULL,
   "START_DATE"         DATE                 NOT NULL,
   "FINISH_DATE"        DATE                 NOT NULL,
   "MEETING POINT"      VARCHAR2(50)         NOT NULL,
   CONSTRAINT PK_BOOK_CAR PRIMARY KEY ("STATE_NAME", "APP_ROLE", "APP_EMAIL", "APPLICATION_ID", "ROLE", "EMAIL", "CONTRACT_NUMBER")
);

/*==============================================================*/
/* Index: "BOOK_CAR2_FK"                                        */
/*==============================================================*/
CREATE INDEX "BOOK_CAR2_FK" ON "BOOK_CAR" (
   "ROLE" ASC,
   "EMAIL" ASC
);

/*==============================================================*/
/* Index: "BOOK_CAR_FK"                                         */
/*==============================================================*/
CREATE INDEX "BOOK_CAR_FK" ON "BOOK_CAR" (
   "STATE_NAME" ASC,
   "APP_ROLE" ASC,
   "APP_EMAIL" ASC,
   "APPLICATION_ID" ASC
);

/*==============================================================*/
/* Index: "DRIVER_FK"                                           */
/*==============================================================*/
CREATE INDEX "DRIVER_FK" ON "BOOK_CAR" (
   "USE_ROLE" ASC,
   "USE_EMAIL" ASC
);

ALTER TABLE APPLICATION
   ADD CONSTRAINT FK_APPLICAT_CAR_HAS_A_STATE FOREIGN KEY ("STATE_NAME")
      REFERENCES STATE ("STATE_NAME");

ALTER TABLE APPLICATION
   ADD CONSTRAINT FK_APPLICAT_LESSOR_USER FOREIGN KEY ("ROLE", "EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE COMMENTS
   ADD CONSTRAINT FK_COMMENTS_COMMENTED_USER FOREIGN KEY ("ROLE", "EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE PHOTOS
   ADD CONSTRAINT FK_PHOTOS_CAR_PHOTO_APPLICAT FOREIGN KEY ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID")
      REFERENCES APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID");

ALTER TABLE "USER"
   ADD CONSTRAINT "FK_USER_HAS A ROL_ROLE" FOREIGN KEY ("ROLE")
      REFERENCES ROLE ("ROLE");

ALTER TABLE "BOOK_CAR"
   ADD CONSTRAINT FK_BOOK_CAR_BOOK_CAR_APPLICAT FOREIGN KEY ("STATE_NAME", "APP_ROLE", "APP_EMAIL", "APPLICATION_ID")
      REFERENCES APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID");

ALTER TABLE "BOOK_CAR"
   ADD CONSTRAINT FK_BOOK_CAR_BOOK_CAR2_USER FOREIGN KEY ("ROLE", "EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE "BOOK_CAR"
   ADD CONSTRAINT FK_BOOK_CAR_DRIVER_USER FOREIGN KEY ("USE_ROLE", "USE_EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");





ALTER TABLE ROLE
	ADD CONSTRAINT check_role
	CHECK (REGEXP_LIKE("ROLE" , '[a-z]{4,7}'));

ALTER TABLE ROLE
	ADD CONSTRAINT check_role_description
	CHECK (REGEXP_LIKE("DESCRIPTION" , '[A-z.,0-9 ]{1,200}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_email
  CHECK ( REGEXP_LIKE ("EMAIL", '[A-Za-z0-9._,!#?]+@+[a-zA-Z._]+\.[a-z]{1,4}'));

ALTER TABLE "USER"
  ADD CONSTRAINT valid_unique UNIQUE ("LOGIN");

ALTER TABLE "USER"
  ADD CONSTRAINT phone_unique UNIQUE ("PHONE_NUMBER");

ALTER TABLE "USER"
  ADD CONSTRAINT number_driver_licence_unique UNIQUE ("NUMBER_DRIVER_LICENCE");

ALTER TABLE "USER"
  ADD CONSTRAINT check_login
  CHECK ( REGEXP_LIKE ("LOGIN", '[A-Za-z0-9._,&%$!#? ]{5,20}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_login_len
  CHECK(length("LOGIN")>5 and length("LOGIN")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_password
  CHECK ( REGEXP_LIKE ("PASSWORD", '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_password_len
  CHECK(length("PASSWORD")>6 and length("PASSWORD")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_number_driver_licence
  CHECK ( REGEXP_LIKE ("NUMBER_DRIVER_LICENCE", '[À-ß]{3} [0-9]{6}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_firstname 
  CHECK (REGEXP_LIKE("FIRSTNAME",'[A-ZÀ-ß²¯ª][a-zà-ÿ³¿º]{1,19}','c'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_firstname_len
  CHECK(length("FIRSTNAME")>2 and length("FIRSTNAME")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_lastname
  CHECK (REGEXP_LIKE("LASTNAME",'[A-ZÀ-ß²¯ª][a-zà-ÿ³¿º]{1,19}','c'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_lastname_len
  CHECK(length("LASTNAME")>2 and length("LASTNAME")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_phone_number
  CHECK (REGEXP_LIKE("PHONE_NUMBER",'\+ 38+\(0[0-9]{2}\) [0-9]{4} [0-9]{3}','c'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_rating
  CHECK ("RATING" >0 and "RATING"<=100);

ALTER TABLE "USER"
  ADD CONSTRAINT check_date
  CHECK ("BIRTHDAY" < "DRIVER_LICENCE");

ALTER TABLE STATE
	ADD CONSTRAINT check_state
	CHECK (REGEXP_LIKE("STATE_NAME" , '[a-z ]{3,15}'));


ALTER TABLE STATE
	ADD CONSTRAINT check_state_len
	CHECK(length("STATE_NAME")>3 and length("STATE_NAME")<15);

ALTER TABLE STATE
	ADD CONSTRAINT check_state_description
	CHECK (REGEXP_LIKE("STATE_DESCRIPTION" , '[A-z.,0-9 ]{1,50}'));

ALTER TABLE STATE
	ADD CONSTRAINT check_state_description_len
	CHECK(length("STATE_DESCRIPTION")>5 and length("STATE_DESCRIPTION")<50);


ALTER TABLE STATE
	ADD CONSTRAINT checkscale	
	CHECK("SCALE"<=10 and "SCALE">=0);

ALTER TABLE STATE
  ADD CONSTRAINT scale_unique UNIQUE ("SCALE");

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_body_number
    CHECK(REGEXP_LIKE("BODY_NUMBER",'[0-9A-Z]{17}'));

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_engine_number
    CHECK(REGEXP_LIKE("ENGINE_NUMBER",'[0-9A-Z]{17}'));

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_app_status
    CHECK("APPLICATION_STATUS" >= 0 and "APPLICATION_STATUS" <=5);

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_lessor
    CHECK("ROLE" ='lessor');

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_car_brand
    CHECK(REGEXP_LIKE("CAR_BRAND",'[A-Z]{1,20}'));

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_car_model
    CHECK(REGEXP_LIKE("CAR_MODEL",'[A-Za-z 0-9-]{1,20}'));

ALTER TABLE APPLICATION
  ADD CONSTRAINT car_unique UNIQUE ("BODY_NUMBER", "ENGINE_NUMBER" ,"CAR_BRAND","CAR_MODEL");

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_dates
    CHECK("LAST_TECHNICAL_INSPECTION">"CAR_YEAR");

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_car_year
    CHECK("CAR_YEAR" > DATE '1960-01-01');

ALTER TABLE APPLICATION
    ADD CONSTRAINT check_price
    CHECK("PRICE_PER_DAY" > 0 and "PRICE_PER_DAY" <30000);

ALTER TABLE "BOOK_CAR"
    ADD CONSTRAINT check_period
    CHECK("START_DATE" < "FINISH_DATE");

ALTER TABLE "BOOK_CAR"
    ADD CONSTRAINT check_meeting_point
    CHECK(REGEXP_LIKE("MEETING POINT", '[A-ZÀ-ß²¯ªa-zà-ÿ³¿º0-9 ,.-]'));


ALTER TABLE COMMENTS
    ADD CONSTRAINT check_comment_text_len
    CHECK(length("COMMENTS_TEXT")>10 and length("COMMENTS_TEXT")<200);

    
ALTER TABLE "BOOK_CAR"
    ADD CONSTRAINT check_meeting_point_len
    CHECK(length("MEETING POINT")>10 and length("MEETING POINT")<50);

   
