SET TRANSACTION ISOLATION LEVEL READ COMMITED;
create or replace PROCEDURE EDITFL (  FLNAME IN "Flowers"."Name"%TYPE , DISCR IN "Flowers"."Discription"%TYPE ) IS 
BEGIN
  UPDATE "Flowers"
  SET "Discription" = DISCR
  WHERE "Name" = FLNAME;

END EDITFL;

create or replace PROCEDURE CALENDAR (  EMAIL IN "FlowersOfUser"."Login"%TYPE , FCOUNT IN "Flowers"."WaterCount"%TYPE, my_cursor OUT SYS_REFCURSOR ) IS 
FNAME varchar2(25);
BEGIN
  OPEN my_cursor for SELECT "FlowersOfUser"."Name" into FNAME
  FROM "FlowersOfUser"  FULL OUTER JOIN "Flowers" ON "FlowersOfUser"."Name"="Flowers"."Name" 
  WHERE "FlowersOfUser"."Login"=EMAIL and "Flowers"."WaterCount"=FCOUNT;
END CALENDAR;
create or replace PROCEDURE ADDFLOWERS ( EMAIL IN "FlowersOfUser"."Login"%TYPE , FLNAME IN "FlowersOfUser"."Name"%TYPE ) IS 
BEGIN
 INSERT INTO "FlowersOfUser"
 VALUES(FLNAME, EMAIL, MY_SQN.NEXTVAL);

END ADDFLOWERS;
create or replace PROCEDURE MYFLOWERSLIST ( EMAIL IN "FlowersOfUser"."Login"%TYPE, my_cursor OUT SYS_REFCURSOR) IS 
PHOTO LONG;
DISCR CHAR(1024);
/*
LOGIN "FlowersOfUser"."Login"%TYPE;
C varchar2(25) := 'user1@gmail.com';
cursor my_cursor is SELECT "Photo", "Discription", "Login"
  FROM "Flowers"  FULL OUTER JOIN "FlowersOfUser" ON "Flowers"."Name"="FlowersOfUser"."Name" ; */

BEGIN
OPEN my_cursor for SELECT "Photo", "Discription" into PHOTO, DISCR
  FROM "Flowers"  FULL OUTER JOIN "FlowersOfUser" ON "Flowers"."Name"="FlowersOfUser"."Name" 
  WHERE "FlowersOfUser"."Login"=EMAIL;
  /* OPEN my_cursor; 
  
LOOP
FETCH my_cursor into PHOTO, DISCR, LOGIN;
 IF LOGIN = EMAIL 
  THEN status := 1; EXIT;
  ELSE status := 0;
  END IF;
  EXIT WHEN NOT(my_cursor%FOUND);
END LOOP;
CLOSE my_cursor;*/
END MYFLOWERSLIST;

create or replace PROCEDURE SIGNIN (  EMAIL IN "Users"."Login"%TYPE , PASS IN "Users"."Password"%TYPE , STATUS OUT NUMBER )is
cursor my_cursor is SELECT "Login","Password" FROM "Users" ;  
var1 "Users"."Login"%TYPE;
var2 "Users"."Password"%TYPE;
--IS SELECT "Login","Password" FROM "Users" WHERE "Login" = EMAIL AND "Password" = PASS;
BEGIN
null;
  OPEN my_cursor; 
LOOP
FETCH my_cursor into var1,var2;
 IF var1 = EMAIL AND var2 = PASS 
  THEN status := 1; EXIT;
  ELSE status := 0;
  END IF;
  EXIT WHEN NOT(my_cursor%FOUND);
END LOOP;
CLOSE my_cursor;
END SIGNIN;
create or replace PROCEDURE SIGNUP (  EMAIL IN "Users"."Login"%TYPE , PASS IN "Users"."Password"%TYPE , STATUS OUT NUMBER )IS
BEGIN
  INSERT INTO "Users"
  VALUES(EMAIL, PASS, 'user');
  status := 1;
END SIGNUP;