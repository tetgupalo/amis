/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12/23/2017 10:09:53 PM                       */
/*==============================================================*/


alter table Apartment
   drop constraint FK_USER_HAS_APARTMENT;

alter table ApartmentPhoto
   drop constraint "FK_APARTMENT_HAVE PHOTO";

alter table BookApartments
   drop constraint FK_APARTMENT_BOOKED;

alter table BookApartments
   drop constraint FK_USER_BOOK_APARTMENTS;

alter table BookFacilities
   drop constraint FK_BOOKED_FACILITY;

alter table BookFacilities
   drop constraint FK_USER_BOOK_FACILITY;

alter table Facility
   drop constraint "FK_USER_ORGANIZE _FACILITY";

alter table "User"
   drop constraint FK_USER_HAS_ROLE;

drop index "Own apartments_FK";

drop table Apartment cascade constraints;

drop index "Have photos_FK";

drop table ApartmentPhoto cascade constraints;

drop index "Book apartments_FK";

drop index "Book apartments2_FK";

drop table BookApartments cascade constraints;

drop index "Book facilities_FK";

drop index "Book facilities2_FK";

drop table BookFacilities cascade constraints;

drop index "Organize facilities_FK";

drop table Facility cascade constraints;

drop table Role cascade constraints;

drop index "user has a role_FK";

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: Apartment                                             */
/*==============================================================*/
create table Apartment 
(
   id                   INTEGER              not null,
   landlord_email_fk    VARCHAR2(100)        not null,
   city                 VARCHAR2(20)         not null,
   street               VARCHAR2(40)         not null,
   apartment_price      FLOAT(8)             not null,
   apartment_description VARCHAR2(600)        not null,
   max_amount_dwellers  INTEGER              not null,
   additional_number    VARCHAR2(10),
   is_deleted           SMALLINT,
   constraint PK_APARTMENT primary key (id, landlord_email_fk)
);

/*==============================================================*/
/* Index: "Own apartments_FK"                                   */
/*==============================================================*/
create index "Own apartments_FK" on Apartment (
   landlord_email_fk ASC
);

/*==============================================================*/
/* Table: ApartmentPhoto                                        */
/*==============================================================*/
create table ApartmentPhoto 
(
   id                   INTEGER              not null,
   landlord_email_fk    VARCHAR2(100)        not null,
   apartment_photo_path VARCHAR2(100)        not null,
   photo_desc           VARCHAR2(140)        not null,
   constraint PK_APARTMENTPHOTO primary key (id, landlord_email_fk, apartment_photo_path)
);

/*==============================================================*/
/* Index: "Have photos_FK"                                      */
/*==============================================================*/
create index "Have photos_FK" on ApartmentPhoto (
   id ASC,
   landlord_email_fk ASC
);

/*==============================================================*/
/* Table: BookApartments                                        */
/*==============================================================*/
create table BookApartments 
(
   id                   INTEGER              not null,
   landlord_email_fk    VARCHAR2(100)        not null,
   booker_email_fk      VARCHAR2(100)        not null,
   booking_date         DATE                 not null,
   booking_end          DATE                 not null,
   operation_date       DATE,
   is_deleted           CHAR(10),
   constraint PK_BOOKAPARTMENTS primary key (id, landlord_email_fk, booker_email_fk, booking_date)
);

/*==============================================================*/
/* Index: "Book apartments2_FK"                                 */
/*==============================================================*/
create index "Book apartments2_FK" on BookApartments (
   booker_email_fk ASC
);

/*==============================================================*/
/* Index: "Book apartments_FK"                                  */
/*==============================================================*/
create index "Book apartments_FK" on BookApartments (
   id ASC,
   landlord_email_fk ASC
);

/*==============================================================*/
/* Table: BookFacilities                                        */
/*==============================================================*/
create table BookFacilities 
(
   organizer_email_fk   VARCHAR2(100)        not null,
   facility_id_fk       INTEGER              not null,
   booker_email_fk      VARCHAR2(100)        not null,
   date_of_operation    DATE                 not null,
   is_deleted           SMALLINT,
   constraint PK_BOOKFACILITIES primary key (organizer_email_fk, facility_id_fk, booker_email_fk)
);

/*==============================================================*/
/* Index: "Book facilities2_FK"                                 */
/*==============================================================*/
create index "Book facilities2_FK" on BookFacilities (
   booker_email_fk ASC
);

/*==============================================================*/
/* Index: "Book facilities_FK"                                  */
/*==============================================================*/
create index "Book facilities_FK" on BookFacilities (
   organizer_email_fk ASC,
   facility_id_fk ASC
);

/*==============================================================*/
/* Table: Facility                                              */
/*==============================================================*/
create table Facility 
(
   organizer_email_fk   VARCHAR2(100)        not null,
   facility_id          INTEGER              not null,
   facility_name        VARCHAR2(30)         not null,
   facility_city        VARCHAR2(20)         not null,
   facility_street      VARCHAR2(40)         not null,
   date_start           DATE                 not null,
   date_end             DATE                 not null,
   amount_of_tickets    INTEGER              not null,
   facility_price       FLOAT(8)             not null,
   facility_description VARCHAR2(600)        not null,
   is_deleted           SMALLINT,
   constraint PK_FACILITY primary key (organizer_email_fk, facility_id)
);

/*==============================================================*/
/* Index: "Organize facilities_FK"                              */
/*==============================================================*/
create index "Organize facilities_FK" on Facility (
   organizer_email_fk ASC
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role 
(
   role_name            VARCHAR2(20)         not null,
   role_description     VARCHAR2(200),
   constraint PK_ROLE primary key (role_name)
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   role_name_fk         VARCHAR2(20)         not null,
   email                VARCHAR2(100)        not null,
   name                 VARCHAR2(20)         not null,
   password             VARCHAR2(25)         not null,
   phone_number         VARCHAR2(10)         not null,
   scan_doc_path        VARCHAR2(100)        not null,
   is_active            SMALLINT             not null,
   is_deleted           SMALLINT,
   constraint PK_USER primary key (email)
);

/*==============================================================*/
/* Index: "user has a role_FK"                                  */
/*==============================================================*/
create index "user has a role_FK" on "User" (
   role_name_fk ASC
);

alter table Apartment
   add constraint FK_USER_HAS_APARTMENT foreign key (landlord_email_fk)
      references "User" (email);

alter table ApartmentPhoto
   add constraint "FK_APARTMENT_HAVE PHOTO" foreign key (id, landlord_email_fk)
      references Apartment (id, landlord_email_fk);

alter table BookApartments
   add constraint FK_APARTMENT_BOOKED foreign key (id, landlord_email_fk)
      references Apartment (id, landlord_email_fk);

alter table BookApartments
   add constraint FK_USER_BOOK_APARTMENTS foreign key (booker_email_fk)
      references "User" (email);

alter table BookFacilities
   add constraint FK_BOOKED_FACILITY foreign key (organizer_email_fk, facility_id_fk)
      references Facility (organizer_email_fk, facility_id);

alter table BookFacilities
   add constraint FK_USER_BOOK_FACILITY foreign key (booker_email_fk)
      references "User" (email);

alter table Facility
   add constraint "FK_USER_ORGANIZE _FACILITY" foreign key (organizer_email_fk)
      references "User" (email);

alter table "User"
   add constraint FK_USER_HAS_ROLE foreign key (role_name_fk)
      references Role (role_name);

	  
/*======ADDED MANUALLY=======*/
/*==============================================================*/
/* For: Role                                            */
/*==============================================================*/
ALTER TABLE ROLE
  ADD CONSTRAINT check_role
  CHECK ( REGEXP_LIKE (role_name, '^[A-Za-z]+($|\s)'));
  
ALTER TABLE ROLE
  ADD CONSTRAINT check_role_len
  CHECK (length(role_name) > 2 and length(role_name) <= 20);
  
ALTER TABLE ROLE
  ADD CONSTRAINT check_role_description
  CHECK ( REGEXP_LIKE (role_description, '^[A-Za-zА-ЯІЇЄа-яієї,]+($|\s)'));
  
ALTER TABLE ROLE
  ADD CONSTRAINT check_role__desc_len
  CHECK (length(role_description) > 5 and length(role_description) <= 200);
/*==============================================================*/
/* For: User                                            */
/*==============================================================*/
ALTER TABLE "User"
  ADD CONSTRAINT unique_scan_doc
  UNIQUE (SCAN_DOC_PATH);

ALTER TABLE "User"
  ADD CONSTRAINT unique_phone_number
  UNIQUE (PHONE_NUMBER);  
  
 ALTER TABLE "User"
  ADD CONSTRAINT check_email
  CHECK ( REGEXP_LIKE (email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
  
ALTER TABLE "User"
  ADD CONSTRAINT check_name
  CHECK ( REGEXP_LIKE (name, '^[A-ZА-ЯІЇЄ][A-ZА-ЯІЇЄa-zа-яіїє-]+($|\s)', 'c'));
  
 ALTER TABLE "User"
  ADD CONSTRAINT check_name_len
  CHECK (length(name) < 20); 
  
ALTER TABLE "User"
  ADD CONSTRAINT check_password
  CHECK ( REGEXP_LIKE (password, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)'));
  
ALTER TABLE "User"
  ADD CONSTRAINT check_password_len
  CHECK ((length(password) < 25) and (length(password) > 6)); 
  
ALTER TABLE "User"
  ADD CONSTRAINT check_phone_number
  CHECK ( REGEXP_LIKE (phone_number, '^[0-9]{10}($|\s)'));
  
/*==============================================================*/
/* For: apartment                                             */
/*==============================================================*/
ALTER TABLE FACILITY
  ADD CONSTRAINT unique_name_adress
  UNIQUE (FACILITY_NAME, FACILITY_CITY, FACILITY_STREET);

 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_name
  CHECK ( REGEXP_LIKE (facility_name, '^[A-ZА-ЯІЇЄ][A-ZА-ЯІЇЄа-яіїєa-z -0-9]+($|\s)', 'c'));
  
ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_name_len
  CHECK (length(facility_name) < 30);
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_city
  CHECK ( REGEXP_LIKE (facility_city, '^[A-ZА-ЯІЄЇ][A-ZА-ЯІЇЄа-яіїєa-z-]+($|\s)', 'c'));
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_city_len
  CHECK (length(facility_city) < 20);
  
  ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_street
  CHECK ( REGEXP_LIKE (facility_street, '^[A-ZА-ЯІЄЇ][A-ZА-ЯІЇЄа-яіїє,a-z .-0-9]+($|\s)', 'c'));
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_street_len
  CHECK (length(facility_street) < 40);
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_date_end
  CHECK (date_end >= date_start);
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_amount_tickets
  CHECK ( REGEXP_LIKE (amount_of_tickets, '^[0-9]{1,5}($|\s)'));
  
ALTER TABLE FACILITY
  ADD CONSTRAINT check_amount_tickets_len
  CHECK (amount_of_tickets < 99999);
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_price
  CHECK ( REGEXP_LIKE (facility_price, '^[0-9]{1,6}.[0-9]{1,2}($|\s)'));
  
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_description
  CHECK ( REGEXP_LIKE (facility_description, '^[A-ZА-ЯІЇЄ][A-ZА-ЯІЇЄa-zа-яіїє,:"?! .-0-9]+($|\s)'));
  
ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_description_len
  CHECK ((length(facility_description) > 5) and (length(facility_description) < 600));
/*==============================================================*/
/* For: apartment                                           */
/*==============================================================*/
ALTER TABLE APARTMENT
  ADD CONSTRAINT unique_apartment_address
  UNIQUE (CITY, STREET);

 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_city
  CHECK ( REGEXP_LIKE (city, '^[A-ZА-ЯІЄЇ][A-ZА-ЯІЄЇа-яіїєa-z-]+($|\s)', 'c'));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_city_len
  CHECK (length(city) < 20);
  
  ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_street
  CHECK ( REGEXP_LIKE (street, '^[A-ZА-ЯІЄЇ][A-ZА-ЯІЄЇа-яіїє,a-z .-0-9]+($|\s)', 'c'));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_street_len
  CHECK (length(street) < 40);
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_price
  CHECK ( REGEXP_LIKE (apartment_price, '^[0-9]{1,6}.[0-9]{1,2}($|\s)'));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_description
  CHECK ( REGEXP_LIKE (apartment_description, '^[A-ZА-ЯІЇЄ][A-ZА-ЯІЇЄа-яіїє,?!=+a-z .-0-9]+($|\s)'));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_desc_len
  CHECK ((length(apartment_description) > 5) and (length(apartment_description) < 600));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_dwellers
  CHECK ( REGEXP_LIKE (max_amount_dwellers, '^[0-9]{1,2}($|\s)'));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_add_number
  CHECK ( REGEXP_LIKE (additional_number, '^[0-9]+($|\s)'));
  
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_add_number_len
  CHECK (additional_number <= 10);
/*==============================================================*/
/* For: booking apartment                                           */
/*==============================================================*/
 ALTER TABLE BOOKAPARTMENTS
  ADD CONSTRAINT check_book_end
  CHECK (booking_end >= booking_date);
  
 ALTER TABLE BOOKAPARTMENTS
  ADD CONSTRAINT check_book_end_oper
CHECK (booking_date >= operation_date);

CREATE SEQUENCE  APART_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
/
CREATE SEQUENCE  FAC_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
/
create or replace TRIGGER apartment_iter 
BEFORE INSERT ON APARTMENT 
FOR EACH ROW

BEGIN
  SELECT apart_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
create or replace TRIGGER facility_iter 
BEFORE INSERT ON FACILITY 
FOR EACH ROW

BEGIN
  SELECT fac_seq.NEXTVAL
  INTO   :new.facility_id
  FROM   dual;
END;

/

create or replace TYPE APARTMENTIDS AS VARRAY(200) OF NUMBER;
/
create or replace TYPE PhotoArray AS VARRAY(200) OF VARCHAR2(100);
/
create or replace TYPE        APARTMENTFILTERED AS OBJECT 
(
  id NUMBER(38,0),
  CITY VARCHAR2(20),
  STREET VARCHAR2(40),
  APARTMENT_PRICE FLOAT,
  APARTMENT_DESCRIPTION VARCHAR2(600),
  DWELLERS NUMBER(38,0),
  PHOTO_PATH VARCHAR(50)
);
/
create or replace TYPE        testTable AS TABLE OF APARTMENTFILTERED;
/
CREATE OR REPLACE FORCE VIEW APARTMENTDETAIL ("ID", "LANDLORD_EMAIL_FK", "CITY", "STREET", "APARTMENT_PRICE", "APARTMENT_DESCRIPTION", "MAX_AMOUNT_DWELLERS", "ADDITIONAL_NUMBER") AS 
  SELECT ID, LANDLORD_EMAIL_FK, CITY, STREET, APARTMENT_PRICE, APARTMENT_DESCRIPTION,
MAX_AMOUNT_DWELLERS, ADDITIONAL_NUMBER
FROM APARTMENT;
/
CREATE OR REPLACE FORCE VIEW APARTMENTLIST ("ID", "CITY", "STREET", "APARTMENT_PRICE", "APARTMENT_DESCRIPTION", "MAX_AMOUNT_DWELLERS", "APARTMENT_PHOTO_PATH") AS 
  SELECT APARTMENT.ID, APARTMENT.CITY, APARTMENT.STREET, APARTMENT.APARTMENT_PRICE, APARTMENT.APARTMENT_DESCRIPTION, APARTMENT.MAX_AMOUNT_DWELLERS,
APARTMENTPHOTO.APARTMENT_PHOTO_PATH
FROM APARTMENT
LEFT OUTER JOIN APARTMENTPHOTO
ON APARTMENT.ID = APARTMENTPHOTO.ID AND APARTMENT.LANDLORD_EMAIL_FK = APARTMENTPHOTO.LANDLORD_EMAIL_FK
WHERE (APARTMENTPHOTO.APARTMENT_PHOTO_PATH IN (SELECT MIN(APARTMENT_PHOTO_PATH)
FROM APARTMENTPHOTO
GROUP BY ID) OR APARTMENT_PHOTO_PATH IS NULL);
/
CREATE OR REPLACE FORCE VIEW AVAILABLEFACILITIES ("FACILITY_ID", "FACILITY_NAME", "FACILITY_CITY", "FACILITY_STREET", "DATE_START", "DATE_END", "FACILITY_PRICE", "FACILITY_DESCRIPTION") AS 
  SELECT FACILITY_ID, FACILITY_NAME, FACILITY_CITY, FACILITY_STREET,
DATE_START, DATE_END, FACILITY_PRICE, FACILITY_DESCRIPTION
FROM FACILITY
LEFT OUTER JOIN (SELECT FACILITY_ID_FK, COUNT(FACILITY_ID_FK) AS BOOKEDTICKETS
FROM BOOKFACILITIES
GROUP BY FACILITY_ID_FK)
ON FACILITY.FACILITY_ID = FACILITY_ID_FK
WHERE FACILITY.AMOUNT_OF_TICKETS > BOOKEDTICKETS OR BOOKEDTICKETS IS NULL;
/
CREATE OR REPLACE FORCE VIEW BOOKDATES ("ID", "CITY", "APARTMENT_PRICE", "BOOKING_DATE", "BOOKING_END") AS 
  SELECT APARTMENT.ID, APARTMENT.CITY, APARTMENT.APARTMENT_PRICE, 
BOOKAPARTMENTS.BOOKING_DATE, BOOKAPARTMENTS.BOOKING_END
FROM APARTMENT
LEFT JOIN BOOKAPARTMENTS
ON APARTMENT.ID = BOOKAPARTMENTS.ID;
/
CREATE OR REPLACE FORCE VIEW BOOKINGFACILITIES ("FACILITY_ID", "ORGANIZER_EMAIL_FK", "FACILITY_NAME", "FACILITY_CITY", "FACILITY_STREET", "DATE_START", "DATE_END", "FACILITY_PRICE", "BOOKER_EMAIL_FK", "DATE_OF_OPERATION", "IS_DELETED") AS 
  SELECT FACILITY.FACILITY_ID, FACILITY.ORGANIZER_EMAIL_FK, FACILITY.FACILITY_NAME, FACILITY.FACILITY_CITY, FACILITY.FACILITY_STREET,
FACILITY.DATE_START, FACILITY.DATE_END, FACILITY.FACILITY_PRICE, 
BOOKFACILITIES.BOOKER_EMAIL_FK, BOOKFACILITIES.DATE_OF_OPERATION, BOOKFACILITIES.IS_DELETED
FROM FACILITY
INNER JOIN BOOKFACILITIES
ON FACILITY.FACILITY_ID = BOOKFACILITIES.FACILITY_ID_FK;
/
CREATE OR REPLACE FORCE VIEW BOOKINGLIST ("ID", "CITY", "STREET", "APARTMENT_PRICE", "LANDLORD_EMAIL_FK", "BOOKER_EMAIL_FK", "BOOKING_DATE", "BOOKING_END", "OPERATION_DATE", "IS_DELETED") AS 
  SELECT APARTMENT.ID, APARTMENT.CITY, APARTMENT.STREET, APARTMENT.APARTMENT_PRICE, APARTMENT.LANDLORD_EMAIL_FK, BOOKAPARTMENTS.BOOKER_EMAIL_FK,
BOOKAPARTMENTS.BOOKING_DATE, BOOKAPARTMENTS.BOOKING_END, BOOKAPARTMENTS.OPERATION_DATE,
BOOKAPARTMENTS.IS_DELETED
FROM APARTMENT
INNER JOIN BOOKAPARTMENTS
ON APARTMENT.ID = BOOKAPARTMENTS.ID;
/
CREATE OR REPLACE FORCE VIEW CITYLIST ("CITY") AS 
  SELECT DISTINCT city 
FROM APARTMENT
union
SELECT DISTINCT facility_city
FROM FACILITY;
/
CREATE OR REPLACE FORCE VIEW FACILITYDETAIL ("FACILITY_ID", "FACILITY_NAME", "FACILITY_CITY", "FACILITY_STREET", "DATE_START", "DATE_END", "FACILITY_PRICE", "FACILITY_DESCRIPTION", "TICKETS") AS 
  SELECT FACILITY_ID, FACILITY_NAME, FACILITY_CITY, FACILITY_STREET,
DATE_START, DATE_END, FACILITY_PRICE, FACILITY_DESCRIPTION, (AMOUNT_OF_TICKETS - BOOKEDTICKETS) AS TICKETS
FROM FACILITY
LEFT OUTER JOIN (SELECT FACILITY_ID_FK, COUNT(FACILITY_ID_FK) AS BOOKEDTICKETS
FROM BOOKFACILITIES
GROUP BY FACILITY_ID_FK)
ON FACILITY.FACILITY_ID = FACILITY_ID_FK
WHERE FACILITY.AMOUNT_OF_TICKETS >= BOOKEDTICKETS OR BOOKEDTICKETS IS NULL;
/
CREATE OR REPLACE FORCE VIEW FACILITYLIST ("FACILITY_NAME", "FACILITY_CITY", "FACILITY_STREET", "DATE_START", "DATE_END", "FACILITY_PRICE", "FACILITY_DESCRIPTION") AS 
  SELECT FACILITY_NAME, FACILITY_CITY, FACILITY_STREET, DATE_START, DATE_END, FACILITY_PRICE,
FACILITY_DESCRIPTION
FROM FACILITY;
/
CREATE OR REPLACE FORCE VIEW USERAPPLIES ("ROLE_NAME_FK", "EMAIL", "NAME", "PHONE_NUMBER", "SCAN_DOC_PATH") AS 
  SELECT ROLE_NAME_FK, EMAIL, NAME, PHONE_NUMBER, SCAN_DOC_PATH
FROM "User"
WHERE IS_ACTIVE = 0;
/
create or replace PROCEDURE add_apartment (landlord VARCHAR2, city_proc VARCHAR2, street_proc VARCHAR2,
price FLOAT, description VARCHAR2, dwellers NUMBER, add_number VARCHAR2, photo PHOTOARRAY) AS
   res NUMBER;
   id_apart NUMBER;
   BEGIN
      INSERT INTO APARTMENT (LANDLORD_EMAIL_FK, CITY, STREET, APARTMENT_PRICE, APARTMENT_DESCRIPTION, MAX_AMOUNT_DWELLERS, ADDITIONAL_NUMBER)
      VALUES (landlord, city_proc, street_proc, price, description, dwellers, add_number);
      SELECT id INTO id_apart FROM APARTMENT
      WHERE APARTMENT.CITY = city_proc AND APARTMENT.STREET = street_proc;
      DBMS_OUTPUT.PUT_LINE ('Employee Nnumber: ' || id_apart);
      FOR i IN 1..photo.count LOOP
        INSERT INTO APARTMENTPHOTO (ID, LANDLORD_EMAIL_FK, APARTMENT_PHOTO_PATH, PHOTO_DESC)
        VALUES (id_apart, landlord, photo(i), 'test');
      END LOOP;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE add_facility (organizer VARCHAR2, name VARCHAR2,
city VARCHAR2, street VARCHAR2, date_st DATE, date_end DATE, tickets NUMBER, price FLOAT, description VARCHAR2) AS
   res NUMBER;
   BEGIN
      INSERT INTO FACILITY (ORGANIZER_EMAIL_FK, FACILITY_NAME, FACILITY_CITY, FACILITY_STREET, DATE_START, DATE_END, AMOUNT_OF_TICKETS, FACILITY_PRICE, FACILITY_DESCRIPTION)
      VALUES (organizer, name, city, street, date_st, date_end, tickets, price, description);
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE add_user (role_us VARCHAR2, email VARCHAR2, name_us VARCHAR2, password_us VARCHAR2, 
phone VARCHAR2, scan_us VARCHAR2) AS
   tot_emps NUMBER;
   BEGIN
      INSERT INTO "User" (ROLE_NAME_FK, EMAIL, NAME, PASSWORD, PHONE_NUMBER, SCAN_DOC_PATH, IS_ACTIVE) 
      VALUES (role_us, email, name_us, password_us, phone, scan_us, 0);
   tot_emps := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE book_apartment (ids NUMBER, booker VARCHAR2,
book_date DATE, book_end DATE) AS
   res NUMBER;
   start_date DATE;
   end_date DATE;
   counter NUMBER;
   landlord VARCHAR2(50);
   cursor curtest is
     SELECT BOOKING_DATE, BOOKING_END
     FROM BOOKAPARTMENTS
     WHERE BOOKAPARTMENTS.ID = ids;
   BEGIN
      SELECT LANDLORD_EMAIL_FK INTO landlord
      FROM APARTMENT
      WHERE APARTMENT.ID = ids;
      counter := 0;
      OPEN curtest;
      LOOP
        FETCH curtest INTO start_date, end_date;
        IF (book_date <= end_date) and (start_date >= book_end) THEN
          counter := counter + 1;
        END IF;
        EXIT WHEN curtest%NOTFOUND;
      END LOOP;
      CLOSE curtest;
      IF counter = 0 THEN
        INSERT INTO BOOKAPARTMENTS (ID, LANDLORD_EMAIL_FK, BOOKER_EMAIL_FK, BOOKING_DATE, BOOKING_END, OPERATION_DATE)
        VALUES (ids, landlord, booker, book_date, book_end, SYSDATE);
      END IF;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE book_facility (facil_id NUMBER, booker VARCHAR2) AS
   res NUMBER;
   amount NUMBER;
   booked NUMBER;
   organizer VARCHAR2(40);
   BEGIN
      SELECT ORGANIZER_EMAIL_FK INTO organizer 
      FROM FACILITY
      WHERE FACILITY.FACILITY_ID = facil_id;
      SELECT COUNT(*) INTO booked 
      FROM BOOKFACILITIES
      WHERE BOOKFACILITIES.FACILITY_ID_FK = facil_id;
      SELECT AMOUNT_OF_TICKETS INTO amount
      FROM FACILITY
      WHERE FACILITY.FACILITY_ID = facil_id;
      IF (amount - booked) >= 0 THEN
        INSERT INTO BOOKFACILITIES (ORGANIZER_EMAIL_FK, FACILITY_ID_FK, BOOKER_EMAIL_FK, DATE_OF_OPERATION)
        VALUES (organizer, facil_id, booker, SYSDATE);
      END IF;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE CONFIRM_USER (emailp VARCHAR2) AS
   res NUMBER;
   BEGIN
      UPDATE "User"
      SET "User".is_active = 1
      WHERE "User".email = emailp;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE del_apartment (ids NUMBER) AS
   res NUMBER;
   BEGIN
      DELETE FROM APARTMENTPHOTO
      WHERE ID = ids;
      COMMIT;
      DELETE FROM BOOKAPARTMENTS 
      WHERE ID = ids;
      COMMIT;
      DELETE FROM APARTMENT
      WHERE ID = ids;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE del_facility (id NUMBER) AS
   res NUMBER;
   BEGIN
      DELETE FROM BOOKFACILITIES
      WHERE FACILITY_ID_FK = id;
      COMMIT;
      DELETE FROM FACILITY 
      WHERE FACILITY_ID = id;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE DELETE_USER (emailp VARCHAR2) AS
   res NUMBER;
   BEGIN
      DELETE FROM BOOKFACILITIES
      WHERE BOOKFACILITIES.ORGANIZER_EMAIL_FK = emailp OR BOOKFACILITIES.BOOKER_EMAIL_FK = emailp;
      COMMIT;
      DELETE FROM BOOKAPARTMENTS
      WHERE LANDLORD_EMAIL_FK = emailp OR BOOKER_EMAIL_FK = emailp;
      COMMIT;
      DELETE FROM APARTMENTPHOTO
      WHERE LANDLORD_EMAIL_FK = emailp;
      DELETE FROM APARTMENT
      WHERE LANDLORD_EMAIL_FK = emailp;
      COMMIT;
      DELETE FROM FACILITY
      WHERE ORGANIZER_EMAIL_FK = emailp;
      COMMIT;
      DELETE FROM "User"
      WHERE "User".email = emailp;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE UPDATE_APARTMENT (ids NUMBER, astreet VARCHAR2, price FLOAT,
dwellers NUMBER, description VARCHAR2, add_number VARCHAR2) AS
   res NUMBER;
   BEGIN
      UPDATE APARTMENT
      SET APARTMENT.STREET = astreet, APARTMENT.APARTMENT_PRICE = price, APARTMENT.MAX_AMOUNT_DWELLERS = dwellers,
      APARTMENT.APARTMENT_DESCRIPTION = description, APARTMENT.ADDITIONAL_NUMBER = add_number
      WHERE APARTMENT.ID = ids;
   res := 1;
   COMMIT;
   END;
/
create or replace PROCEDURE UPDATE_FACILITY (id NUMBER, astreet VARCHAR2, 
price FLOAT, description VARCHAR2) AS
   res NUMBER;
   BEGIN
      UPDATE FACILITY
      SET FACILITY.FACILITY_STREET = astreet, FACILITY.FACILITY_PRICE = price,
      FACILITY.FACILITY_DESCRIPTION = description
      WHERE FACILITY.FACILITY_ID = id;
   res := 1;
   COMMIT;
   END;
/
create or replace function  filter_apartment(city_in VARCHAR2, max_price FLOAT, min_price FLOAT)
return TESTTABLE
PIPELINED
as
CURSOR data IS
  SELECT ID, CITY, STREET, APARTMENT_PRICE, APARTMENT_DESCRIPTION,
  MAX_AMOUNT_DWELLERS, APARTMENT_PHOTO_PATH
  FROM APARTMENTLIST;
max_p FLOAT;
min_p FLOAT;
begin
  if max_price is null then
  max_p := BINARY_FLOAT_INFINITY;
  ELSE
  max_p := max_price;
  end if;
  if min_price is null then
  min_p := 0;
  ELSE
  min_p := min_price;
  end if;
  for rovv in data
    loop
       if (city_in is not null and rovv.CITY = city_in) 
       and (rovv.APARTMENT_PRICE > min_p) 
       and (rovv.APARTMENT_PRICE < max_p) 
       THEN
       pipe row (APARTMENTFILTERED(rovv.ID, rovv.CITY, rovv.STREET, rovv.APARTMENT_PRICE,
       rovv.APARTMENT_DESCRIPTION,rovv.MAX_AMOUNT_DWELLERS, rovv.APARTMENT_PHOTO_PATH));
       ELSIF 
       (city_in is null) 
       and (rovv.APARTMENT_PRICE > min_p) 
       and (rovv.APARTMENT_PRICE < max_p) THEN
       pipe row (APARTMENTFILTERED(rovv.ID, rovv.CITY, rovv.STREET, rovv.APARTMENT_PRICE,
       rovv.APARTMENT_DESCRIPTION,rovv.MAX_AMOUNT_DWELLERS, rovv.APARTMENT_PHOTO_PATH));
       end if;
   end loop;
 return;
end;


