--CITIES

insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (1, 'Київ');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (2, 'Харків');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (3, 'Одеса');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (4, 'Дніпро');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (5, 'Донецьк');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (6, 'Львів');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (7, 'Кривий Ріг');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (8, 'Миколаїв');
insert into CITIES ("CITY_ID", "CITY_NAME") VALUES (9, 'Маріуполь');


--USERS
insert into USERS ("USER_ID", "CITY_ID_FK", "EMAIL", "NAME", "GENDER", "PASSWORD","ABOUT", "BIRTHDAY", "REG_DATE") 
values (1, 1, 'mazdaAND@gmail.com', 'Andrew', 1, 'password1', 'I am rich and I dont smoke', TO_DATE('2000/05/02','yyyy/mm/dd'), TO_DATE('2014/02/02','yyyy/mm/dd'));

insert into USERS ("USER_ID", "CITY_ID_FK", "EMAIL", "NAME", "GENDER", "PASSWORD","ABOUT", "BIRTHDAY", "REG_DATE") 
values (2, 3, 'NinaYakovleva@i.ua', 'Nina', 2, 'password2', 'I love animals', TO_DATE('1997/05/02','yyyy/mm/dd'), TO_DATE('2017/02/02','yyyy/mm/dd'));

insert into USERS ("USER_ID", "CITY_ID_FK", "EMAIL", "NAME", "GENDER", "PASSWORD","ABOUT", "BIRTHDAY", "REG_DATE") 
values (3, 4, 'limonlimon@ukr.net', 'Oleg', 1, 'password3', 'I just want to have a walk', TO_DATE('1995/05/02','yyyy/mm/dd'), TO_DATE('2016/01/03','yyyy/mm/dd'));

--DIALOGS
insert into DIALOGS ("DIALOG_ID", "DIALOG_DATE", "SENDER_ID", "RECIPIENT_ID") VALUES (1, TO_DATE('2017/01/05','yyyy/mm/dd'), 1, 2);
insert into DIALOGS ("DIALOG_ID", "DIALOG_DATE", "SENDER_ID", "RECIPIENT_ID") VALUES (2, TO_DATE('2017/12/12','yyyy/mm/dd'), 2, 3);
insert into DIALOGS ("DIALOG_ID", "DIALOG_DATE", "SENDER_ID", "RECIPIENT_ID") VALUES (3, TO_DATE('2017/12/12','yyyy/mm/dd'), 3, 1);

--MESSAGES
INSERT INTO MESSAGES ("MESSAGE_ID","DIALOG_ID_FK","USER_ID_FK","TEXT","MESSAGE_DATE") 
VALUES (1,2,1,'Привіт.', TO_DATE('2014/05/01','yyyy/mm/dd'));

INSERT INTO MESSAGES ("MESSAGE_ID","DIALOG_ID_FK","USER_ID_FK","TEXT","MESSAGE_DATE") 
VALUES (2,2,1,'Давай познайомимось', TO_DATE('2014/05/01','yyyy/mm/dd'));

INSERT INTO MESSAGES ("MESSAGE_ID","DIALOG_ID_FK","USER_ID_FK","TEXT","MESSAGE_DATE") 
VALUES (3,2,2,'Давай', TO_DATE('2014/05/01','yyyy/mm/dd'));

--ARTICLES
INSERT INTO ARTICLES ("ARTICLE_ID", "ARTICLE_TITLE", "ARTICLE_TEXT", "ARTICLE_DATE")
VALUES (1, 'Порада №1', 'Йдіть на смішне кіно або на веселий спектакль у театр. Якщо ж ти скажеш, 
що хочеш прочитати тут не поради, куди йти, а саме, про що говорити, то будеш неправий.
Адже більшість незручних пауз у розмовах саме і трапляються через те, що нема про що говорити, 
немає спільних тем. А коли ви підете на смішний фільм, то, по-перше, у вас обох буде чудовий настрій, 
і, по-друге, можете обговорити кілька цікавих сцен. Це буде ваше загальне простір для розмови, 
і завжди в хвилину паузи можете повернутися до цієї теми.', '01.07.13');

INSERT INTO ARTICLES ("ARTICLE_ID", "ARTICLE_TITLE", "ARTICLE_TEXT", "ARTICLE_DATE")
VALUES (2, 'Порада №2', 'Намагайся жартувати, розповідати прикольні історії зі свого життя або про одного. 
   Дівчата дуже люблять веселих хлопців, і твої старання вона точно помітить. Більше сміху = найкраще побачення. 
   Але не переборщи з темами, на першому побаченні зовсім не намагайся жартувати над нею (краще ніколи не жартуй), 
   адже дівчина може це може сприйняти дуже близько до серця і навіть образиться.', '01.07.13');

INSERT INTO ARTICLES ("ARTICLE_ID", "ARTICLE_TITLE", "ARTICLE_TEXT", "ARTICLE_DATE")
VALUES (3, 'Порада №3', 'Розкажіть про себе, але не ідеалізуй. Краще говорити про невеликі успіхи, 
   про новий проект або ж перспективи, але ні в якому разі не бреши. Адже якщо ваші стосунки перейдуть 
   на новий рівень, то вся лож розкриється. І такий поворот подій недобре вплине на ваші стосунки з образами 
   та іншими неприємностями.', '01.07.13');

