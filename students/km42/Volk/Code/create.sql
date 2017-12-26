alter table "Invitation"
   drop constraint FK_INVITATI_CONFIRMAT_MEETING;

alter table "Invitation"
   drop constraint FK_INVITATI_NOTIFICAT_USER;

alter table "Meeting"
   drop constraint FK_MEETING_OWNERSHIP_USER;

drop index "Confirmation of participation_";

drop table "Invitation" cascade constraints;


drop table "Meeting" cascade constraints;

drop table "User" cascade constraints;

DROP SEQUENCE meeting_seq;


create table "Invitation"
(
   "id"                 NUMBER,
   "email"              VARCHAR2(320),
   "status"             VARCHAR2(7) NOT NULL,
   constraint PK_INVITATION primary key ("id", "email")
);


create index "Confirmation of participation_" on "Invitation" (
   "id" ASC
);

create table "Meeting"
(
   "title"              VARCHAR2(256)            not null,
   "address"            VARCHAR2(256)            not null,
   "date"               TIMESTAMP                not null,
   "id"                 NUMBER                   NOT NULL ,
   "email"              VARCHAR2(320)            not null,
   "description"        VARCHAR2(256)            NULL,
   constraint PK_MEETING primary key ("id")
);
/
CREATE SEQUENCE meeting_seq START WITH 1;
/
create table "User"
(
   "email"              VARCHAR2(320)            not null,
   "name"               VARCHAR2(32),
   constraint PK_USER primary key ("email")
);

alter table "Invitation"
   add constraint FK_INVITATI_CONFIRMAT_MEETING foreign key ("id")
      references "Meeting" ("id");

alter table "Invitation"
   add constraint FK_INVITATI_NOTIFICAT_USER foreign key ("email")
      references "User" ("email");

alter table "Invitation"
   add constraint status_check
   check ("status" in ('accept', 'pending'));

alter table "Meeting"
   add constraint FK_MEETING_OWNERSHIP_USER foreign key ("email")
      references "User" ("email");

alter table "Meeting"
   add constraint MEETING_UNIQUENESS UNIQUE ("email", "title", "address", "date");


alter table "Meeting"
   add constraint check_title
   check ( LENGTHB("title") > 2);

ALTER TABLE "Meeting"
   ADD CONSTRAINT check_description
   CHECK ( LENGTHB("description") > 2);

alter table "Meeting"
   add constraint check_address
   check ( LENGTHB("address") > 2);

ALTER TABLE "User"
   ADD CONSTRAINT check_email
   CHECK ( REGEXP_LIKE ("email", '[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}'));

ALTER TABLE "User"
   ADD CONSTRAINT check_name
   CHECK (LENGTHB("name") > 2);
/
CREATE OR REPLACE PACKAGE ilya_package AS
   TYPE STRING_LIST IS TABLE OF "User"."email"%TYPE INDEX BY PLS_INTEGER;
   TYPE T_EMAIL IS TABLE OF "User"."email"%TYPE;
   TYPE USER_TABLE_RECORD IS RECORD (
      email "User"."email"%TYPE,
      name "User"."name"%TYPE
   );
   TYPE USER_TABLE IS TABLE OF USER_TABLE_RECORD;
   TYPE EMAIL_RECORD IS RECORD (
      email "User"."email"%TYPE
   );
   TYPE EMAIL_TABLE IS TABLE OF EMAIL_RECORD;
   TYPE MEETING_TABLE_RECORD IS RECORD (
      id "Meeting"."id"%TYPE,
      email "Meeting"."email"%TYPE,
      title "Meeting"."title"%TYPE,
      address "Meeting"."address"%TYPE,
      a_date "Meeting"."date"%TYPE,
      description "Meeting"."description"%TYPE,
      invited_name "User"."name"%TYPE,
      invited_email "User"."email"%TYPE,
      invited_status "Invitation"."status"%TYPE
   );
   TYPE MEETING_TABLE IS TABLE OF MEETING_TABLE_RECORD;
   TYPE INVITATION_TABLE_RECORD IS RECORD  (
      id "Meeting"."id"%TYPE,
      title "Meeting"."title"%TYPE,
      address "Meeting"."address"%TYPE,
      a_date "Meeting"."date"%TYPE,
      email "Invitation"."email"%TYPE,
      name "User"."name"%TYPE
   );
   TYPE INVITATION_TABLE IS TABLE OF INVITATION_TABLE_RECORD;
   PROCEDURE create_meeting(-- rc
      title "Meeting"."title"%TYPE,
      address "Meeting"."address"%TYPE,
      a_date "Meeting"."date"%TYPE,
      email "Meeting"."email"%TYPE,
      invited STRING_LIST,
      description "Meeting"."description"%TYPE
   );
   FUNCTION autocomplete_emails(
      owner_email "User"."email"%TYPE
   ) RETURN EMAIL_TABLE PIPELINED;
   FUNCTION get_meetings_list(
      email "User"."email"%TYPE,
      id "Meeting"."id"%TYPE
   ) RETURN MEETING_TABLE PIPELINED;
   PROCEDURE update_meeting(--ser
      id "Meeting"."id"%TYPE,
      title "Meeting"."title"%TYPE,
      address "Meeting"."address"%TYPE,
      a_date "Meeting"."date"%TYPE,
      invited STRING_LIST,
      description "Meeting"."description"%TYPE
   );
   FUNCTION get_user(
      email "User"."email"%TYPE
   ) RETURN USER_TABLE PIPELINED;
   PROCEDURE create_user(--rc
      email "User"."email"%TYPE,
      username "User"."name"%TYPE
   );
   FUNCTION get_invitations(
      email "User"."email"%TYPE
   ) RETURN INVITATION_TABLE PIPELINED;
   PROCEDURE accept_invitation(--rc
      id "Invitation"."id"%TYPE,
      email "Invitation"."email"%TYPE
   );
   PROCEDURE discard_invitation(--rc
      id "Invitation"."id"%TYPE,
      email "Invitation"."email"%TYPE
   );
END ilya_package;

/
CREATE OR REPLACE PACKAGE BODY ilya_package AS
   PROCEDURE create_user_safe(
      email "User"."email"%TYPE,
      username "User"."name"%TYPE
   ) AS
      BEGIN
         INSERT INTO "User" ("email", "name") VALUES (email, username);
         EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
            NULL;
      END create_user_safe;
   FUNCTION contains_record(
      arr T_EMAIL,
      item "User"."email"%TYPE
   ) RETURN BOOLEAN IS
      BEGIN
         FOR i in 1 .. arr.count LOOP
            IF arr(i) = item THEN
               RETURN TRUE;
            END IF;
         END LOOP;
         RETURN FALSE;
      END contains_record;
   PROCEDURE invite_users(
      id "Meeting"."id"%TYPE,
      invited STRING_LIST
   ) IS
      arr_existed T_EMAIL;
      arr_invited T_EMAIL := T_EMAIL();
      invited_email "User"."email"%TYPE;
      owner_email "User"."email"%TYPE;
      BEGIN
            -- parameter has another type
            FOR i in 1..invited.count LOOP
               arr_invited.extend;
               arr_invited(i) := invited(i);
            END LOOP;
            SELECT "email" BULK COLLECT INTO arr_existed
               FROM "Invitation" WHERE "id" = id;
            SELECT "email" INTO owner_email
               FROM "Meeting" WHERE "id" = id;

            FOR i IN 1..arr_invited.COUNT LOOP
               IF NOT contains_record(arr_existed, arr_invited(i)) THEN
                  invited_email := arr_invited(i);
                  IF invited_email != owner_email THEN
                     create_user_safe(invited_email, 'not confirmed');
                     INSERT INTO "Invitation" ("id", "email", "status")
                        VALUES (id, arr_invited(i), 'pending');

                  END IF;
                  END IF;
            END LOOP;
            FOR i in 1..arr_existed.COUNT LOOP
               IF NOT contains_record(arr_invited, arr_existed(i)) THEN
                  DELETE FROM "Invitation" WHERE
                     "id" = id AND "email" = arr_existed(i);
               END IF;
            END LOOP;
      END invite_users;
   PROCEDURE create_meeting(
      title "Meeting"."title"%TYPE,
      address "Meeting"."address"%TYPE,
      a_date "Meeting"."date"%TYPE,
      email "Meeting"."email"%TYPE,
      invited STRING_LIST,
      description "Meeting"."description"%TYPE
   ) AS
      id NUMBER;
      user_email "User"."email"%TYPE;
      BEGIN
         COMMIT;
         SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
         INSERT INTO "Meeting" ("title", "address", "date", "email", "description")
            VALUES (title, address, a_date, email, description);
         SELECT "id" INTO id FROM "Meeting"
            WHERE "title" = title AND
               "address" = address AND
               "email" = email AND
               "date" = a_date;
         invite_users(id, invited);
         COMMIT;
         EXCEPTION
            WHEN OTHERS THEN
               ROLLBACK;
               RAISE;
      END create_meeting;
   FUNCTION autocomplete_emails(
      owner_email "User"."email"%TYPE
   ) RETURN EMAIL_TABLE PIPELINED IS
      BEGIN
         FOR rec IN (
            SELECT DISTINCT "Invitation"."email" FROM
               "Meeting" JOIN "Invitation"
               ON "Meeting"."id" = "Invitation"."id"
               WHERE "Meeting"."email" = owner_email
         )  LOOP
            PIPE ROW (rec);
         END LOOP;
      END;
   FUNCTION get_meetings( -- private
      cols VARCHAR2,
      filter VARCHAR2,
      accept_only BOOLEAN
   ) RETURN SYS_REFCURSOR IS
      meeting_cursor SYS_REFCURSOR;
      str VARCHAR2(2000);
      BEGIN
         str := 'SELECT ' || cols || ' ' ||
               'FROM "Meeting" LEFT JOIN "Invitation" ' ||
               'ON "Meeting"."id" = "Invitation"."id" ';
         IF accept_only = TRUE THEN
            str := str || 'AND "Invitation"."status" in (''accept'', ''pending'') ';
         END IF;
         str := str ||
               'LEFT JOIN "User" ' ||
               'ON "User"."email" = "Invitation"."email" ' || filter;
         --RAISE_APPLICATION_ERROR(-20001, str);
         OPEN meeting_cursor for str;

         RETURN meeting_cursor;

      END get_meetings;
   FUNCTION get_meetings_list(
      email "User"."email"%TYPE,
      id "Meeting"."id"%TYPE
   ) RETURN MEETING_TABLE PIPELINED IS
      email_exists NUMBER;
      meeting_cursor SYS_REFCURSOR;
      rec MEETING_TABLE_RECORD;
      filter VARCHAR2(1024) := 'WHERE ';
      BEGIN
            IF email IS NULL THEN
               IF id IS NULL THEN
                  RAISE_APPLICATION_ERROR(-20001, 'Parameters are null');
               END IF;
               filter := filter || '"Meeting"."id" = ' || id || ' ';
            ELSE

               SELECT count(*) INTO email_exists
                  FROM "User" WHERE "email" = email;
               if email_exists = 0 THEN
                  RAISE_APPLICATION_ERROR(-20001, 'Email ' || email || ' does not exist');
               END IF;
               filter := filter || '"date" > SYSDATE AND ("Meeting"."email" = ''' || email || ''' OR ' ||
                         '("Meeting"."id" IN (SELECT "id" FROM "Invitation" WHERE "email" = ''' || email || ''' AND "status" = ''accept'')))';
            END IF;
            filter := filter || 'ORDER BY "Meeting"."date"';
            meeting_cursor := get_meetings(
               '"Meeting"."id", ' ||
               '"Meeting"."email", ' ||
               '"title", ' ||
               '"address", ' ||
               '"description", ' ||
               '"date", ' ||
               '"User"."name", ' ||
               '"User"."email", ' ||
               '"Invitation"."status" ',
               filter,
               TRUE
            );
            LOOP
               FETCH meeting_cursor INTO
               rec.id, rec.email, rec.title, rec.address,
               rec.description, rec.a_date, rec.invited_name,
               rec.invited_email, rec.invited_status;
               EXIT WHEN meeting_cursor%NOTFOUND;
               PIPE ROW (rec);
            END LOOP;
            CLOSE meeting_cursor;
         EXCEPTION
            WHEN OTHERS THEN
               IF meeting_cursor%ISOPEN THEN
                  CLOSE meeting_cursor;
               END IF;
               RAISE;
      END get_meetings_list;
   FUNCTION get_meeting_by_id(
      id "Meeting"."id"%TYPE
   ) RETURN MEETING_TABLE PIPELINED IS
      meeting_cursor SYS_REFCURSOR;
      rec MEETING_TABLE_RECORD;
      BEGIN
         meeting_cursor := get_meetings(
            '"Meeting"."id", ' ||
            '"title", ' ||
            '"address", ' ||
            '"description", ' ||
            '"date", ' ||
            '"User"."name", ' ||
            '"User"."email", ' ||
            '"Invitation"."status" ',
            'WHERE "Meeting"."id" = ' || id,
            FALSE
         );
         FETCH meeting_cursor INTO
                     rec.id, rec.title, rec.address,
                     rec.description, rec.a_date, rec.invited_name,
                     rec.invited_email, rec.invited_status;
         CLOSE meeting_cursor;
         PIPE ROW (rec);
         EXCEPTION
            WHEN OTHERS THEN
               IF meeting_cursor%ISOPEN THEN
                  CLOSE meeting_cursor;
               END IF;
               RAISE;
      END get_meeting_by_id;
   PROCEDURE update_meeting(
      id "Meeting"."id"%TYPE,
      title "Meeting"."title"%TYPE,
      address "Meeting"."address"%TYPE,
      a_date "Meeting"."date"%TYPE,
      invited STRING_LIST,
      description "Meeting"."description"%TYPE
   ) IS
      BEGIN
         COMMIT;
         SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
         UPDATE "Meeting" SET
            "title" = title,
            "address" = address,
            "date" = a_date,
            "description" = description
         WHERE "id" = id;
         invite_users(id, invited);
         COMMIT;
      EXCEPTION
         WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
      END update_meeting;
   FUNCTION get_user(
      email "User"."email"%TYPE
   ) RETURN USER_TABLE PIPELINED IS
      BEGIN
         FOR rec IN (
            SELECT "email", "name" FROM "User" WHERE "email" = email
         ) LOOP
            PIPE ROW (rec);
         END LOOP;
      END get_user;
   PROCEDURE create_user(
      email "User"."email"%TYPE,
      username "User"."name"%TYPE
   ) IS
      rows_found NUMBER;
      BEGIN
         COMMIT;
         SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
         SELECT count(*) INTO rows_found FROM "User" WHERE "email" = email;
         IF rows_found = 0 THEN
            INSERT INTO "User" ("email", "name") VALUES (email, username);
         ELSE
            UPDATE "User" SET "name" = username WHERE "email" = email;
         END IF;
         COMMIT;
      END create_user;
   FUNCTION get_invitations(
      email "User"."email"%TYPE
   ) RETURN INVITATION_TABLE PIPELINED IS
      CURSOR invitation_cursor IS
         SELECT
               "Meeting"."id",
               "Meeting"."title",
               "Meeting"."address",
               "Meeting"."date",
               "User"."email",
               "User"."name"
            FROM "Meeting" JOIN "Invitation"
               ON "Meeting"."id" = "Invitation"."id"
            JOIN "User"
               ON "Meeting"."email" = "User"."email"
            WHERE
               "Invitation"."email" = email AND
               "Invitation"."status" = 'pending';
      rec INVITATION_TABLE_RECORD;
      BEGIN

         OPEN invitation_cursor;
         LOOP
            FETCH invitation_cursor INTO
                     rec.id, rec.title, rec.address,
                     rec.a_date, rec.email,
                     rec.name;
            EXIT WHEN invitation_cursor%NOTFOUND;
            PIPE ROW (rec);
         END LOOP;
      END get_invitations;
   PROCEDURE accept_invitation(
      id "Invitation"."id"%TYPE,
      email "Invitation"."email"%TYPE
   ) IS
      BEGIN
         COMMIT;
         SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
         UPDATE "Invitation" SET "status"='accept'
         WHERE "id" = id AND "email" = email;
         COMMIT;
      END accept_invitation;
   PROCEDURE discard_invitation(
      id "Invitation"."id"%TYPE,
      email "Invitation"."email"%TYPE
   ) IS
      BEGIN
         COMMIT;
         SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
         UPDATE "Invitation" SET "status"='pending'
         WHERE "id" = id AND "email" = email;
         COMMIT;
      END discard_invitation;
END ilya_package;

  
/

CREATE OR REPLACE TRIGGER invitation_insert
  BEFORE INSERT ON "Invitation"
  FOR EACH ROW
  DECLARE
  meeting_email "Meeting"."email"%TYPE;
  BEGIN
    SELECT "email" INTO meeting_email
      FROM "Meeting"
      WHERE "id" = :NEW."id";
    IF meeting_email = :NEW."email" THEN
      RAISE_APPLICATION_ERROR(-20001, 'Can not invite meeting owner');
    END IF;
  END;
/
CREATE OR REPLACE TRIGGER invitation_update
  BEFORE UPDATE ON "Invitation"
  FOR EACH ROW
declare
  ex_custom EXCEPTION;
  PRAGMA EXCEPTION_INIT( ex_custom, -20001 );
BEGIN
  IF :NEW."id" <> :OLD."id" OR
     :NEW."email" <> :OLD."email" THEN
    RAISE_APPLICATION_ERROR(-20001, 'ACCESS DENIED');
  END IF;
END;
/
CREATE OR REPLACE TRIGGER meeting_insert
  BEFORE INSERT ON "Meeting"
  FOR EACH ROW
  BEGIN
    IF :NEW."date" <= SYSDATE THEN
      RAISE_APPLICATION_ERROR(-20001, 'DATE CAN NOT BE IN PAST');
    END IF;
    SELECT meeting_seq.NEXTVAL
      INTO :NEW."id"
      FROM dual;
  END;
/
CREATE OR REPLACE TRIGGER meeting_update
  BEFORE UPDATE ON "Meeting"
  FOR EACH ROW
declare
  ex_custom EXCEPTION;
  PRAGMA EXCEPTION_INIT( ex_custom, -20001 );
BEGIN
  IF :NEW."id" <> :OLD."id" OR
     :NEW."email" <> :OLD."email" THEN
    RAISE_APPLICATION_ERROR(-20001, 'ACCESS DENIED');
  END IF;
END;
/
CREATE OR REPLACE TRIGGER user_update
  BEFORE UPDATE ON "User"
  FOR EACH ROW
declare
  ex_custom EXCEPTION;
  PRAGMA EXCEPTION_INIT( ex_custom, -20001 );
BEGIN
  IF :NEW."email" <> :OLD."email" THEN
    RAISE_APPLICATION_ERROR(-20001, 'ACCESS DENIED');
  END IF;
END;
