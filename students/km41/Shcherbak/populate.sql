/*==========================*/
/*           User           */
/*==========================*/

INSERT INTO "User" (USER_EMAIL, USER_NAME, USER_LASTNAME, USER_PASSWORD) 
VALUES ('masha@gmail.com', 'Masha', 'Scherbak', 'pass1');

INSERT INTO "User" (USER_EMAIL, USER_NAME, USER_LASTNAME, USER_PASSWORD) 
VALUES ('solia@gmail.com', 'Solomia', 'Tokar', 'pass12');

INSERT INTO "User" (USER_EMAIL, USER_NAME, USER_LASTNAME, USER_PASSWORD) 
VALUES ('ivan@ukr.net', 'Ivan', 'Petrov', 'pass123');

INSERT INTO "User" (USER_EMAIL, USER_NAME, USER_LASTNAME, USER_PASSWORD) 
VALUES ('sania@gmail.com', 'Sasha', 'Shevchenko', 'pass1234');

/*==========================*/
/*          Shop            */
/*==========================*/

INSERT INTO Shop (SHOP_ID, SHOP_ADRESS, SHOP_NAME, SHOP_EMAIL, SHOP_PHONE, SHOP_ADMIN_NAME, SHOP_PASSWORD) 
VALUES ('101', 'Khreshchatyk street, 13', 'Fora', 'fora@gmail.com', '(063)123-45-67', 'Katia', 'passsh1');

INSERT INTO Shop (SHOP_ID, SHOP_ADRESS, SHOP_NAME, SHOP_EMAIL, SHOP_PHONE, SHOP_ADMIN_NAME, SHOP_PASSWORD) 
VALUES ('102', 'Borschagivska Street, 173', 'Le Silpo', 'lesilpo@gmail.com', '(063)321-45-67', 'Vasia', 'passsh2');

INSERT INTO Shop (SHOP_ID, SHOP_ADRESS, SHOP_NAME, SHOP_EMAIL, SHOP_PHONE, SHOP_ADMIN_NAME, SHOP_PASSWORD) 
VALUES ('103', 'Kudryashova street, 37', 'Atb', 'atb@gmail.com', '(063)987-65-43', 'Sasha', 'passsh3');

INSERT INTO Shop (SHOP_ID, SHOP_ADRESS, SHOP_NAME, SHOP_EMAIL, SHOP_PHONE, SHOP_ADMIN_NAME, SHOP_PASSWORD) 
VALUES ('104', 'Pushkinskaya street, 82', 'Mega Market', 'megamarket@gmail.com', '(063)543-23-96', 'Misha', 'passsh4');

/*==========================*/
/*         Product          */
/*==========================*/

INSERT INTO Product (PRODUCT_NAME, PRODUCT_TM, PRODUCT_COUNTRY, PRODUCT_PRICE, PRODUCT_CATEGORY) 
VALUES ('Salo', 'Nova linia', 'Ukraine', '50.75', 'Meat');

INSERT INTO Product (PRODUCT_NAME, PRODUCT_TM, PRODUCT_COUNTRY, PRODUCT_PRICE, PRODUCT_CATEGORY) 
VALUES ('Water', 'Morshinska', 'Ukraine', '10.50', 'Drink');

INSERT INTO Product (PRODUCT_NAME, PRODUCT_TM, PRODUCT_COUNTRY, PRODUCT_PRICE, PRODUCT_CATEGORY) 
VALUES ('Napoleon', 'Roshen', 'Ukraine', '35.75', 'Sweet');

INSERT INTO Product (PRODUCT_NAME, PRODUCT_TM, PRODUCT_COUNTRY, PRODUCT_PRICE, PRODUCT_CATEGORY) 
VALUES ('Pen', 'White bear', 'France', '26.75', 'Ñhancery');

/*==========================*/
/*    Product in the shop   */
/*==========================*/

INSERT INTO "Prodact in the shop" (PRODUCT_NAME, SHOP_ID, ADDING DATE) 
VALUES ('Pen', '101', '17.11.2017');

INSERT INTO "Prodact in the shop" (PRODUCT_NAME, SHOP_ID, ADDING DATE) 
VALUES ('Salo', '102', '16.11.2017');

INSERT INTO "Prodact in the shop" (PRODUCT_NAME, SHOP_ID, ADDING DATE) 
VALUES ('Water', '103', '17.11.2017');

INSERT INTO "Prodact in the shop" (PRODUCT_NAME, SHOP_ID, ADDING DATE) 
VALUES ('Napoleon', '104', '15.11.2017');

/*==========================*/
/*           List           */
/*==========================*/

INSERT INTO List (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, PRODUCT_QUANTITY) 
VALUES ('Pen', '101', 'masha@gmail.com', '201', '3');

INSERT INTO List (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, PRODUCT_QUANTITY) 
VALUES ('Salo', '102', 'solia@gmail.com', '202', '1');

INSERT INTO List (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, PRODUCT_QUANTITY) 
VALUES ('Water', '103', 'ivan@ukr.net', '203', '2');

INSERT INTO List (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, PRODUCT_QUANTITY) 
VALUES ('Napoleon', '104', 'sania@gmail.com', '204', '1');

/*==========================*/
/*           Order          */
/*==========================*/

INSERT INTO "Order" (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, ORDER_ID, ORDER_DATE) 
VALUES ('Pen', '101', 'masha@gmail.com', '201', '301', '18.11.2017');

INSERT INTO "Order" (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, ORDER_ID, ORDER_DATE) 
VALUES ('Salo', '102', 'solia@gmail.com', '202', '302', '19.11.2017');

INSERT INTO "Order" (PRODUCT_NAME, SHOP_ID, USER_EMAIL, LIST_ID, ORDER_ID, ORDER_DATE) 
VALUES ('Water', '103', 'ivan@ukr.net', '203', '303', '18.11.2017');
