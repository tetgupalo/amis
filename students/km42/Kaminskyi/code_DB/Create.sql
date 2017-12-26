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
   "DELETED"            CHAR(1) CHECK ("DELETED" IN ('N', 'Y')) NOT NULL,
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
   "DELETED"            CHAR(1) CHECK ("DELETED" IN ('N', 'Y')) NOT NULL,
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
   "DELETED"            CHAR(1) CHECK ("DELETED" IN ('N', 'Y')) NOT NULL,
   CONSTRAINT PK_PHOTOS PRIMARY KEY ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "PHOTO_NAME", "DELETED")
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
   "NUMBER_DRIVER_LICENCE" VARCHAR2(13)      NOT NULL,
   "FIRSTNAME"          VARCHAR2(20)         NOT NULL,
   "LASTNAME"           VARCHAR2(20)         NOT NULL,
   "PHONE_NUMBER"       CHAR(18),
   "BIRTHDAY"           DATE				 NOT NULL,
   "RATING"             SMALLINT			 NOT NULL,
   "DELETED"            CHAR(1) CHECK ("DELETED" IN ('N', 'Y')) NOT NULL,
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
   "DELETED"            CHAR(1) CHECK ("DELETED" IN ('N', 'Y')) NOT NULL,
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
  ADD CONSTRAINT number_driver_licence_unique UNIQUE ("NUMBER_DRIVER_LICENCE");

ALTER TABLE "USER"
  ADD CONSTRAINT check_login
  CHECK ( REGEXP_LIKE ("LOGIN", '[A-Za-z0-9._,&%$!#?]{3,20}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_login_len
  CHECK(length("LOGIN")>=3 and length("LOGIN")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_password
  CHECK ( REGEXP_LIKE ("PASSWORD", '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_password_len
  CHECK(length("PASSWORD")>6 and length("PASSWORD")<30);


ALTER TABLE "USER"
  ADD CONSTRAINT check_number_driver_licence
  CHECK ( REGEXP_LIKE ("NUMBER_DRIVER_LICENCE", '[A-Z]{3} [0-9]{6}'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_firstname 
  CHECK (REGEXP_LIKE("FIRSTNAME",'[A-Z][a-z]{1,19}','c'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_firstname_len
  CHECK(length("FIRSTNAME")>2 and length("FIRSTNAME")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_lastname
  CHECK (REGEXP_LIKE("LASTNAME",'[A-Z][a-z]{1,19}','c'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_lastname_len
  CHECK(length("LASTNAME")>2 and length("LASTNAME")<20);


ALTER TABLE "USER"
  ADD CONSTRAINT check_phone_number
  CHECK (REGEXP_LIKE("PHONE_NUMBER",'\+ 38+\(0[0-9]{2}\) [0-9]{4} [0-9]{3}','c'));

ALTER TABLE "USER"
  ADD CONSTRAINT check_rating
  CHECK ("RATING" >=0 and "RATING"<=100);

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
  ADD CONSTRAINT app_id_unique UNIQUE ("APPLICATION_ID");

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
    CHECK(REGEXP_LIKE("MEETING POINT", '[A-Za-z0-9 ,.-]'));
	



ALTER TABLE COMMENTS
    ADD CONSTRAINT check_comment_text_len
    CHECK(length("COMMENTS_TEXT")>1 and length("COMMENTS_TEXT")<200);

    
ALTER TABLE "BOOK_CAR"
    ADD CONSTRAINT check_meeting_point_len
    CHECK(length("MEETING POINT")>1 and length("MEETING POINT")<50);

   
  
   
CREATE OR REPLACE VIEW USER_TABLE_V
AS
SELECT "ROLE", "EMAIL", "LOGIN", "PASSWORD", "DRIVER_LICENCE", "NUMBER_DRIVER_LICENCE","FIRSTNAME", "LASTNAME", "PHONE_NUMBER", "BIRTHDAY", "RATING"
FROM "USER"
WHERE "DELETED" = 'N';


CREATE OR REPLACE VIEW APPLICATION_TABLE_V
AS
SELECT "STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "ENGINE_NUMBER", "BODY_NUMBER", "APPLICATION_STATUS", "CAR_BRAND", "CAR_MODEL", "CAR_YEAR", "LAST_TECHNICAL_INSPECTION", "PRICE_PER_DAY"
FROM APPLICATION
WHERE "DELETED" = 'N';

CREATE OR REPLACE VIEW BOOK_CAR_V
AS
SELECT "STATE_NAME", "APP_ROLE", "APP_EMAIL","APPLICATION_ID","ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING POINT" 
FROM BOOK_CAR
WHERE "DELETED" = 'N';



 CREATE OR REPLACE VIEW ADD_PHOTO
 AS
 SELECT PHOTOS."STATE_NAME", PHOTOS."ROLE", PHOTOS."EMAIL", PHOTOS."APPLICATION_ID", PHOTOS."PHOTO_NAME", PHOTOS."PHOTO", APPLICATION."BODY_NUMBER", APPLICATION."ENGINE_NUMBER"
 FROM APPLICATION JOIN PHOTOS
 ON APPLICATION."APPLICATION_ID" = PHOTOS."APPLICATION_ID" 
 WHERE PHOTOS."DELETED" = 'N'; 
 

 CREATE OR REPLACE VIEW PHOTO_V
 AS
 SELECT PHOTOS."APPLICATION_ID", PHOTOS."PHOTO_NAME", PHOTOS."PHOTO"
 FROM PHOTOS
 WHERE "DELETED" = 'N';
 
 
 

CREATE SEQUENCE ADD_ID_SEQ
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE;

CREATE SEQUENCE CONTRACT_NUMB_SEQ
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE;




create or replace TRIGGER DELETE_SOME_USER
INSTEAD OF DELETE ON USER_TABLE_V
DECLARE
BEGIN
   UPDATE "USER" 
   SET "DELETED" = 'Y'
   WHERE "ROLE" = :OLD."ROLE" and "EMAIL" = :OLD."EMAIL"; 
END DELETE_SOME_USER;
/


create or replace TRIGGER ADD_APPLICATION_T
INSTEAD OF INSERT ON APPLICATION_TABLE_V
DECLARE
BEGIN
    INSERT INTO APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "ENGINE_NUMBER", "BODY_NUMBER", "APPLICATION_STATUS", "CAR_BRAND", "CAR_MODEL", "CAR_YEAR", "LAST_TECHNICAL_INSPECTION", "PRICE_PER_DAY", "DELETED")
    VALUES (:NEW."STATE_NAME", :NEW."ROLE" , :NEW."EMAIL" ,ADD_ID_SEQ.nextval ,:NEW."ENGINE_NUMBER",:NEW."BODY_NUMBER", 1 ,  :NEW."CAR_BRAND",  :NEW."CAR_MODEL" , :NEW."CAR_YEAR" ,:NEW."LAST_TECHNICAL_INSPECTION", :NEW."PRICE_PER_DAY" , 'N');

END ADD_APPLICATION_T;
/

create or replace TRIGGER UPDATE_APPLICATION_STATUS_T
INSTEAD OF UPDATE ON APPLICATION_TABLE_V
DECLARE
BEGIN
    UPDATE APPLICATION
        SET "APPLICATION_STATUS" = :new."APPLICATION_STATUS"
        WHERE "APPLICATION_ID" = :new."APPLICATION_ID";

END UPDATE_APPLICATION_STATUS_T;
/

create or replace TRIGGER DELETE_APPLICATION_T
INSTEAD OF DELETE ON APPLICATION_TABLE_V
DECLARE
BEGIN
    UPDATE APPLICATION
        SET "DELETED" = 'Y'
        WHERE "APPLICATION_ID" = :old."APPLICATION_ID";

END DELETE_APPLICATION_T;
/


CREATE OR REPLACE TRIGGER ADD_BOOKING
INSTEAD OF INSERT ON BOOK_CAR_V
FOR EACH ROW
DECLARE
BEGIN
  insert into BOOK_CAR ("STATE_NAME", "APP_ROLE", "APP_EMAIL","APPLICATION_ID","ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING POINT", "DELETED")
       VALUES (:new."STATE_NAME", :new."APP_ROLE", :new."APP_EMAIL",:new."APPLICATION_ID", :new."ROLE", :new."EMAIL", :new."USE_ROLE", :new."USE_EMAIL", CONTRACT_NUMB_SEQ.nextval, :new."START_DATE", :new."FINISH_DATE", :new."MEETING POINT", 'N');

		UPDATE APPLICATION
        SET "APPLICATION_STATUS" = 3
        WHERE "APPLICATION_ID" = :new."APPLICATION_ID";
		
	   END ADD_BOOKING;
/

 

 
CREATE OR REPLACE TRIGGER ADD_PHOTO_TR
INSTEAD OF INSERT ON ADD_PHOTO
FOR EACH ROW
DECLARE
APP_id APPLICATION."APPLICATION_ID"%TYPE;
BEGIN
	
	SELECT APPLICATION_ID INTO APP_id
	FROM APPLICATION
	WHERE BODY_NUMBER = :new."BODY_NUMBER" and ENGINE_NUMBER = :new."ENGINE_NUMBER";

	insert into PHOTOS ("STATE_NAME", "ROLE", "EMAIL","APPLICATION_ID","PHOTO_NAME", "PHOTO", "DELETED")
			VALUES (:new."STATE_NAME", :new."ROLE", :new."EMAIL", APP_id, :new."PHOTO_NAME", :new."PHOTO", 'N');

		
	   END ADD_PHOTO_TR;

/



CREATE OR REPLACE PACKAGE rent_car_pkg IS
PROCEDURE ADD_APP_DATA(STATE_NAME_p IN VARCHAR2, ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2, 
                            APPLICATION_ID_p IN NUMBER, ENGINE_NUMBER_p IN VARCHAR2, BODY_NUMBER_p IN VARCHAR2,
                            APPLICATION_STATUS_p IN NUMBER, CAR_BRAND_p IN VARCHAR2, CAR_MODEL_p IN VARCHAR2,
                            CAR_YEAR_p IN DATE, LAST_TECHNICAL_INSPECTION_p IN  DATE, 
                            PRICE_PER_DAY_p IN NUMBER, RS OUT INTEGER );
                            
PROCEDURE ADD_CONTRACT (STATE_NAME_p IN VARCHAR2, APP_ROLE_p IN  VARCHAR2, APP_EMAIL_p IN  VARCHAR2, APPLICATION_ID_p IN NUMBER,
                                        ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2,
                                        USE_ROLE_p IN  VARCHAR2, USE_EMAIL_p IN  VARCHAR2,
                                        START_DATE_p IN DATE, FINISH_DATE_p IN DATE, 
                                        MEETING_POINT_p IN VARCHAR2,  RS OUT INTEGER );
                                        
PROCEDURE ADD_PHOTO_PROC(STATE_NAME_p IN VARCHAR2, ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2, APPLICATION_ID_p IN NUMBER,
                                        PHOTO_NAME_p IN VARCHAR2, PHOTO_p IN VARCHAR2,BODY_NUMBER_p IN VARCHAR2, ENGINE_NUMBER_p IN VARCHAR2,  RS OUT INTEGER );
                                        
PROCEDURE ADD_USER_DATA(ROLE_p IN  VARCHAR2, EMAIL_p IN VARCHAR2, 
                            LOGIN_p IN VARCHAR2, PASSWORD_p IN VARCHAR2, DRIVER_LICENCE_p IN DATE,
                            NUMBER_DRIVER_LICENCE_p IN VARCHAR2, FIRSTNAME_p IN VARCHAR2, LASTNAME_p IN VARCHAR2,
                            PHONE_NUMBER_p IN CHAR, BIRTHDAY_p IN  DATE, 
                            RATING_p IN NUMBER, RS OUT INTEGER );
                            
PROCEDURE DELETE_PHOTO( APPLICATION_ID_p IN NUMBER, PHOTO_p IN VARCHAR2, RS OUT INTEGER );

PROCEDURE UPDATE_APP_INFO (STATE_NAME_p IN VARCHAR2, ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2, APPLICATION_ID_p IN NUMBER, ENGINE_NUMBER_p IN VARCHAR2, BODY_NUMBER_p IN VARCHAR2, APPLICATION_STATUS_p IN VARCHAR2, CAR_BRAND_p IN VARCHAR2, CAR_MODEL_p IN VARCHAR2, CAR_YEAR_p IN DATE, LAST_TECHNICAL_INSPECTION_p IN  DATE, PRICE_PER_DAY_p IN NUMBER, RS OUT INTEGER );

FUNCTION CAN_RENT_AGE( BD_p IN DATE )  RETURN INTEGER;
FUNCTION HAVE_DRIVER_EXP (DRIVER_L_p IN DATE) RETURN INTEGER;
END rent_car_pkg;
/

create or replace PACKAGE BODY rent_car_pkg IS

PROCEDURE ADD_APP_DATA(STATE_NAME_p IN VARCHAR2, ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2, 
                            APPLICATION_ID_p IN NUMBER, ENGINE_NUMBER_p IN VARCHAR2, BODY_NUMBER_p IN VARCHAR2,
                            APPLICATION_STATUS_p IN NUMBER, CAR_BRAND_p IN VARCHAR2, CAR_MODEL_p IN VARCHAR2,
                            CAR_YEAR_p IN DATE, LAST_TECHNICAL_INSPECTION_p IN  DATE, 
                            PRICE_PER_DAY_p IN NUMBER, RS OUT INTEGER )
IS
BEGIN
    COMMIT;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    insert into APPLICATION_TABLE_V values (STATE_NAME_p, ROLE_p, EMAIL_p, APPLICATION_ID_p, ENGINE_NUMBER_p, BODY_NUMBER_p, APPLICATION_STATUS_p, CAR_BRAND_p, CAR_MODEL_p, CAR_YEAR_p, LAST_TECHNICAL_INSPECTION_p, PRICE_PER_DAY_p);
    RS := 1;
    
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
      RS := 0;
    
END ADD_APP_DATA;

PROCEDURE ADD_CONTRACT (STATE_NAME_p IN VARCHAR2, APP_ROLE_p IN  VARCHAR2, APP_EMAIL_p IN  VARCHAR2, APPLICATION_ID_p IN NUMBER,
                                        ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2,
                                        USE_ROLE_p IN  VARCHAR2, USE_EMAIL_p IN  VARCHAR2,
                                        START_DATE_p IN DATE, FINISH_DATE_p IN DATE, 
                                        MEETING_POINT_p IN VARCHAR2,  RS OUT INTEGER )
                                  
IS
BEGIN
    COMMIT;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    insert into BOOK_CAR_V ("STATE_NAME", "APP_ROLE", "APP_EMAIL","APPLICATION_ID","ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING POINT")
    VALUES (STATE_NAME_p , APP_ROLE_p , APP_EMAIL_p , APPLICATION_ID_p, ROLE_p, EMAIL_p, USE_ROLE_p, USE_EMAIL_p, CONTRACT_NUMB_SEQ.nextval, START_DATE_p, FINISH_DATE_p, MEETING_POINT_p); 
    RS := 1;
    
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
      RS := 0;
    
END ADD_CONTRACT;

PROCEDURE ADD_PHOTO_PROC(STATE_NAME_p IN VARCHAR2, ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2, APPLICATION_ID_p IN NUMBER,
                                        PHOTO_NAME_p IN VARCHAR2, PHOTO_p IN VARCHAR2,BODY_NUMBER_p IN VARCHAR2, ENGINE_NUMBER_p IN VARCHAR2,  RS OUT INTEGER )
IS          
BEGIN
    COMMIT;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    INSERT INTO ADD_PHOTO ("STATE_NAME", "ROLE", "EMAIL","APPLICATION_ID","PHOTO_NAME", "PHOTO", "BODY_NUMBER", "ENGINE_NUMBER")
              	VALUES(STATE_NAME_p, ROLE_p, EMAIL_p, APPLICATION_ID_p, PHOTO_NAME_p,  PHOTO_p,  BODY_NUMBER_p, ENGINE_NUMBER_p);
    RS := 1;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
      RS := 0;
    
END ADD_PHOTO_PROC;

PROCEDURE ADD_USER_DATA(ROLE_p IN  VARCHAR2, EMAIL_p IN VARCHAR2, 
                            LOGIN_p IN VARCHAR2, PASSWORD_p IN VARCHAR2, DRIVER_LICENCE_p IN DATE,
                            NUMBER_DRIVER_LICENCE_p IN VARCHAR2, FIRSTNAME_p IN VARCHAR2, LASTNAME_p IN VARCHAR2,
                            PHONE_NUMBER_p IN CHAR, BIRTHDAY_p IN  DATE, 
                            RATING_p IN NUMBER, RS OUT INTEGER )
IS
BEGIN
       COMMIT;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    INSERT INTO USER_TABLE_V values (ROLE_p, EMAIL_p, LOGIN_p, PASSWORD_p, DRIVER_LICENCE_p, NUMBER_DRIVER_LICENCE_p, FIRSTNAME_p, LASTNAME_p, PHONE_NUMBER_p, BIRTHDAY_p, RATING_p);
    RS := 1;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
      RS := 0;
END ADD_USER_DATA;

PROCEDURE DELETE_PHOTO( APPLICATION_ID_p IN NUMBER, PHOTO_p IN VARCHAR2, RS OUT INTEGER )
IS
BEGIN
COMMIT;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    UPDATE PHOTOS
    SET
          
          "DELETED" = 'Y'
    WHERE "APPLICATION_ID" = APPLICATION_ID_p and "PHOTO" = PHOTO_p;
    RS := 1;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
      RS := 0;
    
END DELETE_PHOTO;

PROCEDURE UPDATE_APP_INFO (STATE_NAME_p IN VARCHAR2, ROLE_p IN  VARCHAR2, EMAIL_p IN  VARCHAR2, APPLICATION_ID_p IN NUMBER, ENGINE_NUMBER_p IN VARCHAR2, BODY_NUMBER_p IN VARCHAR2, APPLICATION_STATUS_p IN VARCHAR2, CAR_BRAND_p IN VARCHAR2, CAR_MODEL_p IN VARCHAR2, CAR_YEAR_p IN DATE, LAST_TECHNICAL_INSPECTION_p IN  DATE, PRICE_PER_DAY_p IN NUMBER, RS OUT INTEGER )
IS
BEGIN
COMMIT;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    UPDATE APPLICATION
    SET
          "STATE_NAME" = STATE_NAME_p,
          "ROLE" = ROLE_p,
          "EMAIL" = EMAIL_p,
          "ENGINE_NUMBER" = ENGINE_NUMBER_p,
          "BODY_NUMBER" = BODY_NUMBER_p,
          "APPLICATION_STATUS" = APPLICATION_STATUS_p,
          "CAR_BRAND" = CAR_BRAND_p,
          "CAR_MODEL" = CAR_MODEL_p,
        	"CAR_YEAR" = CAR_YEAR_p,
          "LAST_TECHNICAL_INSPECTION" = LAST_TECHNICAL_INSPECTION_p,
          "PRICE_PER_DAY" = PRICE_PER_DAY_p
    WHERE "APPLICATION_ID" = APPLICATION_ID_p;
    RS := 1;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
      RS := 0;
    
END UPDATE_APP_INFO;

Function CAN_RENT_AGE( BD_p IN DATE )
   RETURN INTEGER
IS
   AGE number;
   TF_p INTEGER;
BEGIN
   SELECT CAST ((TRUNC(SYSDATE, 'YEAR') - TRUNC(BD_p, 'YEAR'))/365 AS INTEGER) INTO AGE FROM DUAL;
   IF AGE >= 21 THEN
      TF_p := 1;
      RETURN TF_p;
   ELSE
      TF_p := 0;
      RETURN TF_p;
   END IF;
 
EXCEPTION	 	 
WHEN OTHERS THEN	 	 
 TF_p := -1;
END;

Function HAVE_DRIVER_EXP( DRIVER_L_p IN DATE )
   RETURN INTEGER
IS
   EXP_d INTEGER;
   TF_p INTEGER;
BEGIN
   SELECT CAST ((TRUNC(SYSDATE, 'YEAR') - TRUNC(DRIVER_L_p, 'YEAR'))/365 AS INTEGER) INTO EXP_d FROM DUAL;
   IF EXP_d >= 2 THEN
      TF_p := 1;
      RETURN TF_p;
   ELSE
      TF_p := 0;
      RETURN TF_p;
   END IF;
 
EXCEPTION	 	 
WHEN OTHERS THEN	 	 
 TF_p := -1;
END;


END rent_car_pkg;
/




create or replace TRIGGER ADD_USER_T
INSTEAD OF INSERT ON USER_TABLE_V
DECLARE
  can_rent INTEGER;
  have_exp INTEGER;
BEGIN
    can_rent := RENT_CAR_PKG.CAN_RENT_AGE(:NEW."BIRTHDAY");
    have_exp := RENT_CAR_PKG.HAVE_DRIVER_EXP(:NEW."DRIVER_LICENCE");
    IF can_rent = 1 and  have_exp = 1 THEN
        INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
        VALUES (:NEW."ROLE", :NEW."EMAIL" , :NEW."LOGIN" ,:NEW."PASSWORD",:NEW."DRIVER_LICENCE",:NEW."NUMBER_DRIVER_LICENCE", :NEW."FIRSTNAME",  :NEW."LASTNAME",  :NEW."PHONE_NUMBER" , :NEW."BIRTHDAY" ,1 , 'N');
    ELSE
        raise_application_error (-20000,'YOU HAVE NO ENOUGH EXPIRIENCE!');
    END IF;
EXCEPTION	 	 
WHEN OTHERS THEN
  raise_application_error (-20001,'CAN`T ADD NEW USER. ADDING ERROR');

END ADD_USER_T;
/




create or replace TYPE filter_row AS OBJECT (
  car_brand_c      VARCHAR2(20 BYTE),
  car_model_c      VARCHAR2(20 BYTE),
  pr_per_daty_c    NUMBER(8,2),
  st_name_c        VARCHAR(15  BYTE),
  car_year_c       DATE,
  last_t_i_c       DATE,
  app_id_c         NUMBER(38,0),
  scale_c          NUMBER(10,0),
  last_finish      DATE

);
/

CREATE TYPE FILTERED_INFO IS TABLE OF filter_row;
/

create or replace FUNCTION FILTER_INFO_f(start_date IN DATE, finish_date IN DATE, price_per_d_start IN NUMBER, price_per_d_end IN NUMBER, scale_start IN NUMBER, scale_end IN NUMBER, car_year_start IN DATE, car_year_end IN DATE )
RETURN FILTERED_INFO PIPELINED AS

TYPE cur_type IS REF CURSOR;
       my_cursor        cur_type;
       car_brand_c      VARCHAR2(20 BYTE);
       car_model_c      VARCHAR2(20 BYTE);
       pr_per_daty_c    NUMBER(8,2);
       st_name_c        VARCHAR2(15 BYTE);
       car_year_c       DATE;
       last_t_i_c       DATE;
       app_id_c         NUMBER(38,0);
       scale_c          NUMBER(10,0);
       index_n          DATE;
       app_stat         INTEGER;
BEGIN
    IF (finish_date < start_date) THEN RETURN;
    END IF;
    OPEN my_cursor FOR
        SELECT  APPLICATION_TABLE_V."CAR_MODEL", APPLICATION_TABLE_V."CAR_BRAND",  APPLICATION_TABLE_V."PRICE_PER_DAY", APPLICATION_TABLE_V."STATE_NAME", APPLICATION_TABLE_V."CAR_YEAR", APPLICATION_TABLE_V."LAST_TECHNICAL_INSPECTION", APPLICATION_TABLE_V."APPLICATION_ID", "STATE"."SCALE", APPLICATION_TABLE_V."APPLICATION_STATUS", MAX(BOOK_CAR_V."FINISH_DATE")
								FROM APPLICATION_TABLE_V LEFT JOIN BOOK_CAR_V 
								ON APPLICATION_TABLE_V."APPLICATION_ID" = BOOK_CAR_V."APPLICATION_ID"
								LEFT JOIN "STATE"
								ON APPLICATION_TABLE_V."STATE_NAME" = "STATE"."STATE_NAME"
								WHERE (APPLICATION_TABLE_V."APPLICATION_STATUS" = 2 or ( APPLICATION_TABLE_V."APPLICATION_STATUS" = 3 and   (BOOK_CAR_V."APPLICATION_ID" NOT IN 	(SELECT BOOK_CAR_V."APPLICATION_ID" FROM BOOK_CAR_V
                                                                                                                              WHERE
                                                                                                                              (TO_DATE('2018/02/10','yyyy/mm/dd')>= BOOK_CAR_V."START_DATE" and TO_DATE('2018/02/10','yyyy/mm/dd') <= BOOK_CAR_V."FINISH_DATE" )
                                                                                                                              or  (TO_DATE('2018/02/12','yyyy/mm/dd') >= BOOK_CAR_V."START_DATE" and TO_DATE('2018/02/12','yyyy/mm/dd') <= BOOK_CAR_V."FINISH_DATE")))))                                 
                                  
              GROUP BY APPLICATION_TABLE_V."CAR_BRAND", APPLICATION_TABLE_V."CAR_MODEL",  APPLICATION_TABLE_V."PRICE_PER_DAY", APPLICATION_TABLE_V."STATE_NAME", APPLICATION_TABLE_V."CAR_YEAR", APPLICATION_TABLE_V."LAST_TECHNICAL_INSPECTION", APPLICATION_TABLE_V."APPLICATION_ID", "STATE"."SCALE", APPLICATION_TABLE_V."APPLICATION_STATUS";
        
        LOOP
            FETCH my_cursor INTO car_model_c, car_brand_c, pr_per_daty_c, st_name_c, car_year_c, last_t_i_c, app_id_c, scale_c,  app_stat,index_n;
            EXIT WHEN my_cursor%notfound;
            IF( ( app_stat != 1) 
                                 
                                  and ( pr_per_daty_c >= price_per_d_start )
                                  and ( pr_per_daty_c <= price_per_d_end )
                                  and (scale_c <= scale_end )
                                  and (scale_c >= scale_start)
                                  and (car_year_c  >= car_year_start)
                                  and (car_year_c <= car_year_end)
                )
            THEN 
            PIPE ROW(filter_row( car_brand_c, car_model_c,pr_per_daty_c, st_name_c, car_year_c, last_t_i_c, app_id_c, scale_c, index_n));
            END IF;
        END LOOP;
    CLOSE my_cursor;
  RETURN;
END;
/
