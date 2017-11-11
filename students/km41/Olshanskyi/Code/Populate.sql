--INSERT Roles
INSERT INTO "Roles" (role_name, Description) 
VALUES ('user', 'Simple user');
INSERT INTO "Roles" (role_name, Description)
VALUES ('VIP', 'VIP user');
INSERT INTO "Roles" (role_name, Description)
VALUES ('admin', 'Admin role');

--INSERT Phone
INSERT INTO "Phone" (phone_id, Model, Description, phone_photo, price) 
VALUES (1, 'iphone6', 'camera 8m, size 5.5', 'iphone6.jpg', 600);
INSERT INTO "Phone" (phone_id, Model, Description, phone_photo, price) 
VALUES (2, 'iphone7', 'camera 13m, size 6.0', 'iphone7.jpg', 750);
INSERT INTO "Phone" (phone_id, Model, Description, phone_photo, price) 
VALUES (3, 'iphone8', 'camera 21m, size 6.5', 'iphone8.jpg', 950);

--INSERT USER
INSERT INTO "USER" (user_id, role_name, user_login, user_password, user_email, user_firstname, user_lastname)
VALUES (1, 'user', 'login1', 'top_secret1' 'first@gmail.com', 'Oleh', 'Banzurov');
INSERT INTO "USER" (user_id, role_name, user_login, user_password, user_email, user_firstname, user_lastname)
VALUES (2, 'VIP', 'login2', 'top_secret2' 'second@gmail.com', 'Dima', 'Propenko');
INSERT INTO "USER" (user_id, role_name, user_login, user_password, user_email, user_firstname, user_lastname)
VALUES (3, 'admin', 'login_as_admin', 'top_secret_admin' 'admin@gmail.com', 'Dima', 'Divanov');

--INSERT Order
INSERT INTO "Order" (id_order, user_id, phone_id, quantity) 
VALUES (1, 1, 1, 1);
INSERT INTO "Order" (id_order, user_id, phone_id, quantity) 
VALUES (2, 2, 2, 2);
INSERT INTO "Order" (id_order, user_id, phone_id, quantity) 
VALUES (2, 3, 3, 3);
