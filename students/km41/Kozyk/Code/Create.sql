/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/14/2017 11:31:57 PM                       */
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
   landlord_email_fk    VARCHAR2(100)        not null,
   adress               VARCHAR2(50)         not null,
   apartment_price      FLOAT(8)             not null,
   apartment_description VARCHAR2(600)        not null,
   max_amount_dwellers  INTEGER              not null,
   additional_number    VARCHAR2(10),
   constraint PK_APARTMENT primary key (landlord_email_fk, adress)
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
   landlord_email_fk    VARCHAR2(100)        not null,
   adress               VARCHAR2(50)         not null,
   apartment_photo_path VARCHAR2(100)        not null,
   photo_desc           VARCHAR2(140)        not null,
   constraint PK_APARTMENTPHOTO primary key (landlord_email_fk, adress, apartment_photo_path)
);

/*==============================================================*/
/* Index: "Have photos_FK"                                      */
/*==============================================================*/
create index "Have photos_FK" on ApartmentPhoto (
   landlord_email_fk ASC,
   adress ASC
);

/*==============================================================*/
/* Table: BookApartments                                        */
/*==============================================================*/
create table BookApartments 
(
   landlord_email_fk    VARCHAR2(100)        not null,
   adress_fk            VARCHAR2(50)         not null,
   booker_email_fk      VARCHAR2(100)        not null,
   booking_date         DATE                 not null,
   booking_end          DATE                 not null,
   operation_date       DATE,
   constraint PK_BOOKAPARTMENTS primary key (landlord_email_fk, adress_fk, booker_email_fk, booking_date)
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
   landlord_email_fk ASC,
   adress_fk ASC
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
   facility_adress      VARCHAR2(50)         not null,
   date_start           DATE                 not null,
   date_end             DATE                 not null,
   amount_of_tickets    INTEGER              not null,
   facility_price       FLOAT(8)             not null,
   facility_description VARCHAR2(600)        not null,
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
   id_code              INTEGER,
   scan_doc_path        VARCHAR2(100),
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
   add constraint "FK_APARTMENT_HAVE PHOTO" foreign key (landlord_email_fk, adress)
      references Apartment (landlord_email_fk, adress);

alter table BookApartments
   add constraint FK_APARTMENT_BOOKED foreign key (landlord_email_fk, adress_fk)
      references Apartment (landlord_email_fk, adress);

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
  ADD CONSTRAINT check_email
  CHECK ( REGEXP_LIKE (email, '^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9]+@[a-z-.]+\.[a-z]{2,15}($|\s)'));
ALTER TABLE "User"
  ADD CONSTRAINT check_name
  CHECK ( REGEXP_LIKE (name, '^[A-ZА-ЯІЇЄ][a-zа-яіїє-]+($|\s)', 'c'));
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
ALTER TABLE "User"
  ADD CONSTRAINT check_id_code
  CHECK ( REGEXP_LIKE (id_code, '^[0-9]{5,10}($|\s)'));
/*==============================================================*/
/* For: apartment                                             */
/*==============================================================*/
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_name
  CHECK ( REGEXP_LIKE (facility_name, '^[A-ZА-ЯІЇЄ][а-яіїєa-z -0-9]+($|\s)', 'c'));
ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_name_len
  CHECK (length(facility_name) < 30);
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_adress
  CHECK ( REGEXP_LIKE (facility_adress, '^[A-ZА-ЯІЄЇ][а-яіїє,a-z .-0-9]+($|\s)', 'c'));
 ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_adress_len
  CHECK (length(facility_adress) < 50);
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
  CHECK ( REGEXP_LIKE (facility_description, '^[A-ZА-ЯІЇЄ][a-zа-яіїє,:"?! .-0-9]+($|\s)'));
ALTER TABLE FACILITY
  ADD CONSTRAINT check_facility_description_len
  CHECK ((length(facility_description) > 5) and (length(facility_description) < 600));
/*==============================================================*/
/* For: apartment                                           */
/*==============================================================*/
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_adress
  CHECK ( REGEXP_LIKE (adress, '^[A-ZА-ЯІЄЇ][а-яіїє,a-z .-0-9]+($|\s)', 'c'));
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_adress_len
  CHECK (length(adress) <= 50);
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_price
  CHECK ( REGEXP_LIKE (apartment_price, '^[0-9]{1,6}.[0-9]{1,2}($|\s)'));
 ALTER TABLE APARTMENT
  ADD CONSTRAINT check_apartment_description
  CHECK ( REGEXP_LIKE (apartment_description, '^[A-ZА-ЯІЇЄ][а-яіїє,?!=+a-z .-0-9]+($|\s)'));
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


