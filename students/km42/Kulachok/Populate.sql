--Create users
INSERT INTO "Users" (user_id, user_login, user_password, user_fl_name, user_email, user_coworker) 
  VALUES ('1234567891', 'misha21', 'qwerty123', 'Михайленко Михайло Михайлович', 'mail@gmail.com', '0');

INSERT INTO "Users" (user_id, user_login, user_password, user_fl_name, user_email, user_coworker) 
  VALUES ('1247567421', 'styopa18', 'qwerty555', 'Степаненко Степан Степанович', 'mail2@gmail.com', '0');
  
INSERT INTO "Users" (user_id, user_login, user_password, user_fl_name, user_email, user_coworker) 
  VALUES ('1234514591', 'iva421', 'asdcvg143', 'Іваненко Іван Іванович', 'ivan@gmail.com', '0');
  
INSERT INTO "Users" (user_id, user_login, user_password, user_fl_name, user_email, user_coworker) 
  VALUES ('1234312891', 'petro521', 'asdzzfg193', 'Петренко Петро Петрович', 'petro@gmail.com', '0');
  
INSERT INTO "Users" (user_id, user_login, user_password, user_fl_name, user_email, user_coworker) 
  VALUES ('1234596391', 'eduard661', 'hghjhgdghjfg127', 'Маслов Володимир Едуардович', 'eduard@gmail.com', '0');

--Create Servises
INSERT INTO "Servises" (servises_id, servises_name, servises_price) 
  VALUES ('123456145123456', 'Вода Гаряча', '365,25');
  
INSERT INTO "Servises" (servises_id, servises_name, servises_price) 
  VALUES ('123499923123456', 'Світло', '750,12');
  
INSERT INTO "Servises" (servises_id, servises_name, servises_price) 
  VALUES ('123456123111456', 'Газ', '555,12');
  
INSERT INTO "Servises" (servises_id, servises_name, servises_price) 
  VALUES ('123456123444456', 'Опалення', '148,25');
  
INSERT INTO "Servises" (servises_id, servises_name, servises_price) 
  VALUES ('123456777123456', 'Вода Холодна', '145,47');


--Create Company
INSERT INTO "Company" (company_name, company_email, company_addres, company_phone) 
  VALUES ('Київ Водоканал', 'voda@mail.ua', 'пров. Ковальський 3.', '068-04-54-854');
  
INSERT INTO "Company" (company_name, company_email, company_addres, company_phone) 
  VALUES ('Газ UA', 'gaz@mail.ua', 'вул. Тараса Шевченка 5.', '098-03-74-124');

INSERT INTO "Company" (company_name, company_email, company_addres, company_phone) 
  VALUES ('Отоплення всім', 'opal@mail.ua', 'вул. Івана Франка', '093-07-81-915');

INSERT INTO "Company" (company_name, company_email, company_addres, company_phone) 
  VALUES ('Гаряча вода для вас', 'garvod@mail.ua', 'вул. Лесі Українки 4', '067-08-54-454');

INSERT INTO "Company" (company_name, company_email, company_addres, company_phone) 
  VALUES ('Всі в одному', 'vse@mail.ua', 'вул. Ліни Костенко 9', '060-01-11-753'); 

  
--Create Provide Servises
INSERT INTO "Provide Servises" (company_name, servises_name, servises_id) 
  VALUES ('Київ Водоканал', 'Вода Холодна', '123444887123456');
  
INSERT INTO "Provide Servises" (company_name, servises_name, servises_id) 
  VALUES ('Газ UA', 'Газ', '123444799123456');

INSERT INTO "Provide Servises" (company_name, servises_name, servises_id) 
  VALUES ('Всі в одному', 'Вода Гаряча', '123444777121456');  
  
  
--Create Order Item
INSERT INTO "Order Item" (servises_name, servises_id, user_id) 
  VALUES ('Газ', '123444777121456', '9934447713'); 
  
INSERT INTO "Order Item" (servises_name, servises_id, user_id) 
  VALUES ('Опалення', '123444557121456', '1263447713');

INSERT INTO "Order Item" (servises_name, servises_id, user_id) 
  VALUES ('Світло', '123444667121456', '1234447747');    
  
  
 --Create Coworker
 INSERT INTO "Coworker" (company_name, user_id) 
  VALUES ('Газ UA', '1245364747');  
  
INSERT INTO "Coworker" (company_name, user_id) 
  VALUES ('Гаряча вода для вас', '1245987747');

INSERT INTO "Coworker" (company_name, user_id) 
  VALUES ('Всі в одному', '1245451747');    
  
