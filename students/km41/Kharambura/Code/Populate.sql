INSERT INTO "Roles" ("role_name", "Description") 
VALUES ('User', 'Can buy tickets');
INSERT INTO "Roles" ("role_name", "Description")
VALUES ('VipUser', 'Can buy tickets with discount');

INSERT INTO "USERS" ("user_email", "role_name", "user_password", "user_firstname", "user_lastname", "user_cardnumber", "user_adress")
VALUES ('oleg.harambura@gmail.com', 'User', '111111', 'Oleg', 'Kharambura', '000000001','Kovalskiy 5, Kyiv');
INSERT INTO "USERS" ("user_email", "role_name", "user_password", "user_firstname", "user_lastname", "user_cardnumber", "user_adress")
VALUES ('galyna.harambura@gmail.com', 'User', '222222', 'Galyna', 'Kharambura', '000000002','Kovalskiy 5, Kyiv');
INSERT INTO "USERS" ("user_email", "role_name", "user_password", "user_firstname", "user_lastname", "user_cardnumber", "user_adress")
VALUES ('pasha.harambura@gmail.com', 'User', '333333', 'Pavlo', 'Kharambura', '000000003','Kovalskiy 5, Kyiv');

INSERT INTO "TICKET" ("ticket_type", "ticket_price", "transport_company", "AMOUNT") 
VALUES ('Bus', 6, 'KyivPasTrans');
INSERT INTO "TICKET" ("ticket_type", "ticket_price", "transport_company, "AMOUNT") 
VALUES ('Tramvay', 4, 'KyivPasTrans');
INSERT INTO "TICKET" ("ticket_type", "ticket_price", "transport_company", "AMOUNT") 
VALUES ('Metro', 5, 'KyivPasTrans');
INSERT INTO "TICKET" ("ticket_type", "ticket_price", "transport_company", "AMOUNT") 
VALUES ('TroleybasBus', 6, 'KyivPasTrans');

INSERT INTO "ORDERS" ("user_email", "order_date", "order_id")
VALUES ('pasha.harambura@gmail.com', (TO_DATE('2017/11/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss')), 000000001);
INSERT INTO "ORDERS" ("user_email", "order_date", "order_id")
VALUES ('oleg.harambura@gmail.com', (TO_DATE('2017/12/11 12:02:44', 'yyyy/mm/dd hh24:mi:ss')), 000000002);

INSERT INTO "ORDERITEM" ("ticket_type", "user_email", "order_id", "tickets_quantity") 
VALUES ('Bus', 'pasha.harambura@gmail.com', 000000001, 5);
INSERT INTO "ORDERITEM" ("ticket_type", "user_email", "order_id", "tickets_quantity") 
VALUES ('Metro', 'pasha.harambura@gmail.com', 000000001, 10);
INSERT INTO "ORDERITEM" ("ticket_type", "user_email", "order_id", "tickets_quantity") 
VALUES ('Tramvay', 'oleg.harambura@gmail.com', 000000002, 20);
