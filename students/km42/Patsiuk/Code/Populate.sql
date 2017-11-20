/*======DATA=======*/

/*======ROLE=======*/
INSERT INTO "ROLE" ("ROLE_type") VALUES ('Наречений');
INSERT INTO "ROLE" ("ROLE_type") VALUES ('Наречена');
INSERT INTO "ROLE" ("ROLE_type") VALUES ('Орендодавець');

/*======USERS=======*/
INSERT INTO "USERS" ("USERS_name", "USERS_surname", "USERS_phone", "USERS_email", "ROLE_type", "USERS_pass") VALUES ('Катерина', 'Калач', '+38-(073)-333-22-33', 'kate_kat@gmail.com', 'Наречена', 'йцуфі56в');
INSERT INTO "USERS" ("USERS_name", "USERS_surname", "USERS_phone", "USERS_email", "ROLE_type", "USERS_pass") VALUES ('Антон', 'Антонов', '+38-(097)-353-22-43', 'antonio@i.ua', 'Наречений', 'йцу$%фів');
INSERT INTO "USERS" ("USERS_name", "USERS_surname", "USERS_phone", "USERS_email", "ROLE_type", "USERS_pass") VALUES ('Тарас', 'Тарасов', '+38-(097)-566-34-34', 'tatata@bigmir.net', 'Орендодавець', 'sdcfc');
INSERT INTO "USERS" ("USERS_name", "USERS_surname", "USERS_phone", "USERS_email", "ROLE_type", "USERS_pass") VALUES ('Іван', 'Іванович', '+38-(050)-856-67-67', 'ivan_iv@bigmir.net', 'Орендодавець', 'sdcfцву');

/*======TYPE HALL=======*/
INSERT INTO "TypeHall" ("HALL_type") VALUES ('Зал');
INSERT INTO "TypeHall" ("HALL_type") VALUES ('Веранда');
INSERT INTO "TypeHall" ("HALL_type") VALUES ('Терраса');

/*======HALL=======*/
INSERT INTO "HALL" ("HALL_name", "HALL_address", "USERS_email", "HALL_type", "HALL_area", "HALL_volume", "HALL_prise_for_hour") VALUES ('Козацький стан', 'Київ вул.Краковч, 2/23А', 'tatata@bigmir.net', 'Зал', '20,5', '40', '30,5');
INSERT INTO "HALL" ("HALL_name", "HALL_address", "USERS_email", "HALL_type", "HALL_area", "HALL_volume", "HALL_prise_for_hour") VALUES ('LavkaLavka', 'Київ вул.Мельника, 45/34', 'tatata@bigmir.net', 'Веранда', '30,5', '60', '67,5');
INSERT INTO "HALL" ("HALL_name", "HALL_address", "USERS_email", "HALL_type", "HALL_area", "HALL_volume", "HALL_prise_for_hour") VALUES ('Лебедине озеро', 'Київ провул.Шевченка, 56/1', 'ivan_iv@bigmir.net', 'Терраса', '36,5', '70', '100');

/*======HALL PHOTO=======*/
INSERT INTO "PhotoHall" ("PhotoHall_photo", "HALL_address", "PhotoHall_desc") VALUES ('base/photo1.jpg', 'Київ вул.Краковч, 2/23А', 'Фото залу');
INSERT INTO "PhotoHall" ("PhotoHall_photo", "HALL_address", "PhotoHall_desc") VALUES ('base/photo3.jpg', 'Київ вул.Мельника, 45/34', 'Фото залу');
INSERT INTO "PhotoHall" ("PhotoHall_photo", "HALL_address", "PhotoHall_desc") VALUES ('base/photo2.jpg', 'Київ вул.Мельника, 45/34', 'Фото залу');

/*======HALL DYSH TYPE=======*/
INSERT INTO "TypeDishe" ("DISHES_type") VALUES ('Гарнір');
INSERT INTO "TypeDishe" ("DISHES_type") VALUES ('Салат');
INSERT INTO "TypeDishe" ("DISHES_type") VALUES ('Напій');

/*======HALL DYSHES=======*/
INSERT INTO "DISHES" ("DISHES_name", "DISHES_type", "DISHES_weight", "DISHES_price", "DISHES_amount_people") VALUES ('Цезар', 'Салат', '200', '70', '2');
INSERT INTO "DISHES" ("DISHES_name", "DISHES_type", "DISHES_weight", "DISHES_price", "DISHES_amount_people") VALUES ('Картопля', 'Гарнір', '500', '40', '3');
INSERT INTO "DISHES" ("DISHES_name", "DISHES_type", "DISHES_weight", "DISHES_price", "DISHES_amount_people") VALUES ('Лимонад', 'Напій', '500', '20', '4');

/*======WeddingDay=======*/
INSERT INTO "WeddingDay" ("order_num", "HALL_address", "USERS_email", "USE_USERS_email","data") VALUES ('1', 'Київ вул.Мельника, 45/34', 'kate_kat@gmail.com', 'antonio@i.ua',TO_DATE('2018-11-16 17:27:53', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "WeddingDay" ("order_num", "HALL_address", "USERS_email", "USE_USERS_email","data") VALUES ('2', 'Київ вул.Мельника, 45/34', 'kate_kat@gmail.com', 'antonio@i.ua',TO_DATE('2018-11-17 17:27:53', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "WeddingDay" ("order_num", "HALL_address", "USERS_email", "USE_USERS_email","data") VALUES ('3', 'Київ вул.Мельника, 45/34', 'kate_kat@gmail.com', 'antonio@i.ua',TO_DATE('2018-11-18 17:27:53', 'YYYY-MM-DD HH24:MI:SS'));

/*======Dish in menu=======*/
INSERT INTO "Dish in menu" ("DISHES_name", "order_num", "DISHES_count") VALUES ('Цезар', '1', '2');
INSERT INTO "Dish in menu" ("DISHES_name", "order_num", "DISHES_count") VALUES ('Лимонад', '1', '3');
INSERT INTO "Dish in menu" ("DISHES_name", "order_num", "DISHES_count") VALUES ('Цезар', '3', '4');
  
