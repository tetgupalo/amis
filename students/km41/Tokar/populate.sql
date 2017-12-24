INSERT INTO "SOLOMIYA"."USER" (USER_EMAIL, USER_NAME, USER_PASSWORD, "phone number", ADRESS, POSTCODE, STATUS, BIRTHDAY, "role") VALUES ('solomiyatokar@gmail.com', 'SleepingFlower', 'pass1234', '0666042319', 'Kiev, provulok Kovalskoho, 5', '79035', 'online', TO_DATE('1997-03-25 02:01:50', 'YYYY-MM-DD HH24:MI:SS'), 'admin');

INSERT INTO "SOLOMIYA"."USER" (USER_EMAIL, USER_NAME, USER_PASSWORD, "phone number", ADRESS, POSTCODE, STATUS, BIRTHDAY, "role") VALUES ('mariashcherbak@ukr.net', 'Masha Shcherbak', 'TRXYE0910', '0983562871', 'Kiev, Malevych street, 13', '78309', 'offline', TO_DATE('1997-02-07 02:04:43', 'YYYY-MM-DD HH24:MI:SS'), 'user');

INSERT INTO "SOLOMIYA"."USER" (USER_EMAIL, USER_NAME, USER_PASSWORD, "phone number", ADRESS, POSTCODE, STATUS, BIRTHDAY, "role") VALUES ('yaroslav.mavliutov@gmail.com', 'MavlyaYarik', 'mops2503', '0637658391', 'Netishyn, Independence street, 78', '45390', 'online', TO_DATE('1997-06-19 02:06:57', 'YYYY-MM-DD HH24:MI:SS'), 'admin');

INSERT INTO "SOLOMIYA"."STORED ITEMS" (ADMIN_EMAIL_FK, ITEM_CODE, ITEM_NAME, QUANTITY, DESCRIPTION, PRICE, CATEGORY, "date") VALUES ('solomiyatokar@gmail.com', '42098648229145', 'Іван Байдак, "Рольові Ігри"', '120', 'Друга книга молодого львівського письменника.', '67,28', 'book', TO_DATE('2016-09-17 03:27:56', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "SOLOMIYA"."STORED ITEMS" (ADMIN_EMAIL_FK, ITEM_CODE, ITEM_NAME, QUANTITY, DESCRIPTION, PRICE, CATEGORY, "date") VALUES ('solomiyatokar@gmail.com', '42076357288374', 'Rubics Cube', '27', 'Легендарна головоломка.', '156,89', 'games', TO_DATE('2017-05-09 03:31:13', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "SOLOMIYA"."STORED ITEMS" (ADMIN_EMAIL_FK, ITEM_CODE, ITEM_NAME, QUANTITY, DESCRIPTION, PRICE, CATEGORY, "date") VALUES ('yaroslav.mavliutov@gmail.com', '42037892856394', 'Кружка "Мопс"', '259', 'Кружка з прінтом.', '279,55', 'cookware', TO_DATE('2017-10-29 03:35:22', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "SOLOMIYA"."GIFT BASKET" (USER_EMAIL_FK, "creation_date", BASKET_NAME, STATUS, GIFT_ID) VALUES ('mariashcherbak@ukr.net', TO_DATE('2017-11-23 03:40:47', 'YYYY-MM-DD HH24:MI:SS'), 'Solomiya Birthday', 'created', '1');

INSERT INTO "SOLOMIYA"."GIFT BASKET" (USER_EMAIL_FK, "creation_date", BASKET_NAME, STATUS, GIFT_ID) VALUES ('mariashcherbak@ukr.net', TO_DATE('2016-12-21 03:41:55', 'YYYY-MM-DD HH24:MI:SS'), 'New Year Presents', 'managed', '2');

INSERT INTO "SOLOMIYA"."GIFT BASKET" (USER_EMAIL_FK, "creation_date", BASKET_NAME, STATUS, GIFT_ID) VALUES ('mariashcherbak@ukr.net', TO_DATE('2017-02-04 03:42:56', 'YYYY-MM-DD HH24:MI:SS'), 'Valentines Day', 'deleted', '3');

INSERT INTO "SOLOMIYA"."SELECTED ITEMS" (GIFT_ID_FK, ADMIN_EMAIL_FK, ITEM_CODE, "adding_date", "quantity in order") VALUES ('1', 'yaroslav.mavliutov@gmail.com', '42037892856394', TO_DATE('2017-11-25 03:46:53', 'YYYY-MM-DD HH24:MI:SS'), '1');

INSERT INTO "SOLOMIYA"."SELECTED ITEMS" (GIFT_ID_FK, ADMIN_EMAIL_FK, ITEM_CODE, "adding_date", "quantity in order") VALUES ('3', 'solomiyatokar@gmail.com', '42098648229145', TO_DATE('2017-02-04 03:50:27', 'YYYY-MM-DD HH24:MI:SS'), '1');

INSERT INTO "SOLOMIYA"."SELECTED ITEMS" (GIFT_ID_FK, ADMIN_EMAIL_FK, ITEM_CODE, "adding_date", "quantity in order") VALUES ('2', 'solomiyatokar@gmail.com', '42076357288374', TO_DATE('2017-12-23 03:53:38', 'YYYY-MM-DD HH24:MI:SS'), '1');

INSERT INTO "SOLOMIYA"."FEEDBACK" (USER_EMAIL_FK, "sending date", "text of feedback", ADMIN_EMAIL_FK, ITEM_CODE, FEEDBACK_ID) VALUES ('mariashcherbak@ukr.net', TO_DATE('2017-12-25 03:55:30', 'YYYY-MM-DD HH24:MI:SS'), 'Great present!', 'solomiyatokar@gmail.com', '42076357288374', '1');

INSERT INTO "SOLOMIYA"."FEEDBACK" (USER_EMAIL_FK, "sending date", "text of feedback", ADMIN_EMAIL_FK, ITEM_CODE, FEEDBACK_ID) VALUES ('mariashcherbak@ukr.net', TO_DATE('2017-02-15 03:57:29', 'YYYY-MM-DD HH24:MI:SS'), 'Very lovely book.', 'solomiyatokar@gmail.com', '42098648229145', '2');

INSERT INTO "SOLOMIYA"."FEEDBACK" (USER_EMAIL_FK, "sending date", "text of feedback", ADMIN_EMAIL_FK, ITEM_CODE, FEEDBACK_ID) VALUES ('mariashcherbak@ukr.net', TO_DATE('2017-11-29 03:59:44', 'YYYY-MM-DD HH24:MI:SS'), 'My friend was really glad about this present!', 'yaroslav.mavliutov@gmail.com', '42037892856394', '3');











