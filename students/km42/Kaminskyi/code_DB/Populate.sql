
--INSERT ROLES
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('admin', 'Manage data');
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('lessor', 'Add new cars.');
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('user', 'Can rent a car.');
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('driver', 'Drive a car. Can be personal driver.');




-- INSERT USER
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
VALUES ('user', 'user_1@gmail.com', 'user_1', 'passss_1', TO_DATE('2014/05/02','yyyy/mm/dd'),'AAA 111000', 'Firstname1', 'Lastname1', '+ 38(050) 6232 567', TO_DATE('1991/05/11','yyyy/mm/dd'), 85, 'N');


-- INSERT USER
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
VALUES ('user', 'us2er_1@gmail.com', 'user_2', 'passss_2', TO_DATE('2016/06/01','yyyy/mm/dd'),'AAA 111666', 'Firstname2', 'Lastname2', '+ 38(050) 1234 567', TO_DATE('1990/05/01','yyyy/mm/dd'), 75, 'N');

-- INSERT LESSOR
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
VALUES ('lessor', 'lessor_1@gmail.com', 'lessor_1', 'lessor_pass_1', TO_DATE('2011/04/02','yyyy/mm/dd'), 'AAJ 123456', 'Lessor_firstname_1', 'Lessor_lastname_1', '+ 38(050) 1434 567', TO_DATE('1980/11/22','yyyy/mm/dd'), 70, 'N');  

-- INSERT Admin
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
VALUES ('admin', 'admin_1@gmail.com', 'admin_1', 'admin_pass_1', TO_DATE('2011/04/02','yyyy/mm/dd'), 'CCC 123456', 'Admin_firstname_1', 'Admin_lastname_1', '+ 38(050) 1434 563', TO_DATE('1987/12/22','yyyy/mm/dd'), 100, 'N');  


-- INSERT Driver
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
VALUES ('driver', 'driver_1@gmail.com', 'driver_1', 'driver_pass_1', TO_DATE('2014/04/02','yyyy/mm/dd'), 'KKA 123456', 'Driver_firstname_1', 'Driver_lastname_1', '+ 38(050) 2434 563', TO_DATE('1988/12/02','yyyy/mm/dd'), 50, 'N');  

INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING", "DELETED")
VALUES ('driver', 'driver_2@gmail.com', 'driver_2', 'driver_pass_2', TO_DATE('2013/04/02','yyyy/mm/dd'), 'BBA 123456', 'Driver_firstname_2', 'Driver_lastname_2', '+ 38(050) 2434 222', TO_DATE('1989/12/02','yyyy/mm/dd'), 90, 'N');  





-- INSERT STATE
INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('excellent', 'The best condition', '9');

INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('very bad', 'Problems with engine', '1');

INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('normal', 'Car with no visual defects', '5');

INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('good', 'Car work good', '7');



 --INSERT APPLICATION
INSERT INTO APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "ENGINE_NUMBER", "BODY_NUMBER" ,"APPLICATION_STATUS" , "CAR_BRAND", "CAR_MODEL", "CAR_YEAR", "LAST_TECHNICAL_INSPECTION" ,"PRICE_PER_DAY", "DELETED")
VALUES ('good', 'lessor', 'lessor_1@gmail.com',ADD_ID_SEQ.nextval,'EEE12345687567890', 'BBB12345676787657', '3', 'AUDI', 'A6', TO_DATE('2014', 'yyyy'), TO_DATE('2017/06/06','yyyy/mm/dd'), '100', 'N');  

INSERT INTO APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "ENGINE_NUMBER", "BODY_NUMBER" ,"APPLICATION_STATUS" , "CAR_BRAND", "CAR_MODEL", "CAR_YEAR", "LAST_TECHNICAL_INSPECTION" ,"PRICE_PER_DAY", "DELETED")
VALUES ('good', 'lessor', 'lessor_1@gmail.com' , ADD_ID_SEQ.nextval ,'EEE12345687467890', 'BBB12345676784657', '3', 'BMW', 'X6', TO_DATE('2013', 'yyyy'), TO_DATE('2017/04/22','yyyy/mm/dd'), '90', 'N');  

INSERT INTO APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "APPLICATION_ID", "ENGINE_NUMBER", "BODY_NUMBER" ,"APPLICATION_STATUS" , "CAR_BRAND", "CAR_MODEL", "CAR_YEAR", "LAST_TECHNICAL_INSPECTION" ,"PRICE_PER_DAY", "DELETED")
VALUES ('very bad', 'lessor', 'lessor_1@gmail.com' , ADD_ID_SEQ.nextval ,'EEE12341187467890', 'BBB12345226784657', '3', 'LADA', 'CALINA', TO_DATE('2000', 'yyyy'), TO_DATE('2017/04/16','yyyy/mm/dd'), '90', 'N');  


-- INSERT rent
INSERT INTO BOOK_CAR ("STATE_NAME", "APP_ROLE", "APP_EMAIL", "APPLICATION_ID","ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING POINT", "DELETED")
                VALUES ('good', 'lessor', 'lessor_1@gmail.com',1,'user', 'user_1@gmail.com', NULL, NULL, CONTRACT_NUMB_SEQ.nextval, TO_DATE('2017/10/6','yyyy/mm/dd'), TO_DATE('2017/10/16','yyyy/mm/dd'), 'Kovalskyi 5', 'N');
INSERT INTO BOOK_CAR ("STATE_NAME", "APP_ROLE", "APP_EMAIL","APPLICATION_ID","ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING POINT", "DELETED")
                VALUES ('good', 'lessor', 'lessor_1@gmail.com',2,'user', 'user_1@gmail.com', 'driver', 'driver_1@gmail.com', CONTRACT_NUMB_SEQ.nextval, TO_DATE('2017/11/6','yyyy/mm/dd'), TO_DATE('2017/11/16','yyyy/mm/dd'), 'Kovalskyi 7', 'N');

INSERT INTO BOOK_CAR ("STATE_NAME", "APP_ROLE", "APP_EMAIL","APPLICATION_ID","ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING POINT", "DELETED")
                VALUES ('very bad', 'lessor', 'lessor_1@gmail.com',3,'user', 'user_1@gmail.com', NULL, NULL, CONTRACT_NUMB_SEQ.nextval, TO_DATE('2017/12/6','yyyy/mm/dd'), TO_DATE('2017/12/16','yyyy/mm/dd'), 'Kovalskyi 7', 'N');

INSERT INTO COMMENTS("ROLE", "EMAIL", "COMMENTS_DATE", "COMMENTS_TEXT", "DELETED")
		VALUES('user', 'user_1@gmail.com',TO_DATE('2017/11/15','yyyy/mm/dd'), 'The Driver was a professional!', 'N');

INSERT INTO COMMENTS("ROLE", "EMAIL", "COMMENTS_DATE", "COMMENTS_TEXT", "DELETED")
		VALUES('user', 'user_1@gmail.com', SYSDATE, 'The Driver was a professional!' , 'N');
INSERT INTO COMMENTS("ROLE", "EMAIL", "COMMENTS_DATE", "COMMENTS_TEXT", "DELETED")
		VALUES('lessor', 'lessor_1@gmail.com', SYSDATE, 'The client was careful!', 'N' );

INSERT INTO PHOTOS ("STATE_NAME","ROLE","EMAIL","APPLICATION_ID", "PHOTO_NAME", "PHOTO", "DELETED")
  VALUES('good', 'lessor', 'lessor_1@gmail.com', 1, 'Front_photo', 'C:/apache/rentcar1.ua/www/img/uploads/EEE12345687567890/1.jpg', 'N');

INSERT INTO PHOTOS ("STATE_NAME","ROLE","EMAIL","APPLICATION_ID", "PHOTO_NAME", "PHOTO", "DELETED")
  VALUES('good', 'lessor', 'lessor_1@gmail.com', 1, 'Front_photo_2', 'C:/apache/rentcar1.ua/www/img/uploads/EEE12345687567890/2.jpg', 'N');


  
  
  
  
  
  