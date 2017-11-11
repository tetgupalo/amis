--INSERT Roles
INSERT INTO "Roles" (role_name, Description) 
VALUES ('User', 'Can buy tickets');
INSERT INTO "Roles" (role_name, Description)
VALUES ('VipUser', 'Can buy tickets with discount');
INSERT INTO "Roles" (role_name, Description)
VALUES ('Admin', 'Manage DB');

--INSERT USER
INSERT INTO "User" (user_email, role_name, user_password, user_firstname, user_lastname, user_cardnumber, user_adress)
VALUES ("oleg.harambura@gmail.com", 'User', '111111', 'Oleg', 'Kharambura', "000000001","Kovalskiy 5, Kyiv");
INSERT INTO "User" (user_email, role_name, user_password, user_firstname, user_lastname, user_cardnumber, user_adress)
VALUES ("galyna.harambura@gmail.com", 'User', '222222', 'Galyna', 'Kharambura', "000000002","Kovalskiy 5, Kyiv");
INSERT INTO "User" (user_email, role_name, user_password, user_firstname, user_lastname, user_cardnumber, user_adress)
VALUES ("pasha.harambura@gmail.com", 'User', '333333', 'Pavlo', 'Kharambura', "000000003","Kovalskiy 5, Kyiv");

--INSERT Ticket
INSERT INTO "Ticket" (ticket_type, ticket_price, transport_company) 
VALUES ('Bus', 6, 'KyivPasTrans');
INSERT INTO "Ticket" (ticket_type, ticket_price, transport_company) 
VALUES ('Tramvay', 4, 'KyivPasTrans');
INSERT INTO "Ticket" (ticket_type, ticket_price, transport_company) 
VALUES ('Metro', 5, 'KyivPasTrans');
INSERT INTO "Ticket" (ticket_type, ticket_price, transport_company) 
VALUES ('TroleybasBus', 6, 'KyivPasTrans');

--INSERT Order
INSERT INTO "Order" (user_email, order_date, order_id) 
VALUES ("pasha.harambura@gmail.com", (TO_DATE('2017/11/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss')), "000000001");
INSERT INTO "Order" (user_email, order_date, order_id) 
VALUES ("pasha.harambura@gmail.com", (TO_DATE('2017/11/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss')), "000000001");
INSERT INTO "Order" (user_email, order_date, order_id) 
VALUES ("oleg.harambura@gmail.com", (TO_DATE('2017/12/11 12:02:44', 'yyyy/mm/dd hh24:mi:ss')), "000000002");

--INSERT OrderItem
INSERT INTO "OrderItem" (ticket_type, user_email, order_id, tickets_quantity) 
VALUES ('Bus', "pasha.harambura@gmail.com", '000000001', 5);
INSERT INTO "OrderItem" (ticket_type, user_email, order_id, tickets_quantity) 
VALUES ('Metro', "pasha.harambura@gmail.com", '000000001', 10);
INSERT INTO "OrderItem" (ticket_type, user_email, order_id, tickets_quantity) 
VALUES ('Tramvay', "oleg.harambura@gmail.com", '000000002', 20);

alter table "USER"
  add constraint check_email
  check ( REGEXP_LIKE (user_email, '[a-z0-9._]+@[a-z0-9._]+\.[a-z]{2,4}'));
