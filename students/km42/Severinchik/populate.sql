
/* Category table*/

INSERT INTO Category(product_category)
VALUES('Dogs');

INSERT INTO Category(product_category)
VALUES('Cats');

INSERT INTO Category(product_category)
VALUES('Birds');

/* Item table*/

INSERT INTO Item(item_name, item_price, item_info, item_quantity, item_id, stock_num, product_category)
VALUES('dog1', 2000, 'dog1', 1, 111, 10, 'Dogs');

INSERT INTO Item(item_name, item_price, item_info, item_quantity, item_id, stock_num, product_category)
VALUES('cat1', 1000, 'cat1', 2, 222, 12, 'Cats');

INSERT INTO Item(item_name, item_price, item_info, item_quantity, item_id, stock_num, product_category)
VALUES('bird1', 1500, 'bird1', 1, 333, 15, 'Birds');

/* Order table*/

INSERT INTO Order(order_id, user_login, order_date, order_status)
VALUES('1', 'login1', TO_DATE('2017-11-20', 'YYYY-MM-DD'), 'processing');

INSERT INTO Order(order_id, user_login, order_date, order_status)
VALUES('2', 'login2', TO_DATE('2017-11-20', 'YYYY-MM-DD'), 'processing');

INSERT INTO Order(order_id, user_login, order_date, order_status)
VALUES('3', 'login3', TO_DATE('2017-11-20', 'YYYY-MM-DD'), 'processing');

/* Order_item table*/

INSERT INTO Order_item(product_quantity, order_id, item_id)
VALUES(1, 1, 111);

INSERT INTO Order_item(product_quantity, order_id, item_id)
VALUES(2, 2, 222);

INSERT INTO Order_item(product_quantity, order_id, item_id)
VALUES(1, 3, 333);

/* Stock table*/

INSERT INTO Stock(stock_num, stock_adress, stock_ph)
VALUES(10, 'adress1', '1234567');

INSERT INTO Stock(stock_num, stock_adress, stock_ph)
VALUES(12, 'adress2', '1234568');

INSERT INTO Stock(stock_num, stock_adress, stock_ph)
VALUES(15, 'adress3', '1234569');

/* User table*/

INSERT INTO User(user_login, user_pass, user_email, user_address, user_ph)
VALUES('login1', 'pass1', 'email1', 'address1', '1111111');

INSERT INTO User(user_login, user_pass, user_email, user_address, user_ph)
VALUES('login2', 'pass2', 'email2', 'address2', '2222222');

INSERT INTO User(user_login, user_pass, user_email, user_address, user_ph)
VALUES('login3', 'pass3', 'email3', 'address3', '3333333');
