/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
INSERT INTO USERS (email, first_name, last_name, password, phone_number, region, delete_user, admin_root) 
    VALUES ('vasya123@gmail.com', 'Vasya', 'Polischuk', 'vasya321', '0960548777', 'Poltava district', '0', '0');
INSERT INTO USERS (email, first_name, last_name, password, phone_number, region, delete_user, admin_root)  
    VALUES ('olya_prok@gmail.com', 'Olga', 'Prokopchuk', 'olyaprokop', '0635544789', 'Sumy district', '0', '0');
INSERT INTO USERS (email, first_name, last_name, password, phone_number, region, delete_user, admin_root)  
    VALUES ('nagibator1488@gmail.com', 'Artem', 'Ivanov', 'nagib222', '0984596588', 'Kyiv', '0', '0');
INSERT INTO USERS (email, first_name, last_name, password, phone_number, region, delete_user, admin_root)  
    VALUES ('yaroslav@gmail.com', 'Yaroslav', 'Polischuk', 'mavlya1997', '0673011879', 'Khmelnytskyi district', '0', '0');
INSERT INTO USERS (email, first_name, last_name, password, phone_number, region, delete_user, admin_root)  
    VALUES ('mishaukr22@gmail.com', 'Mykhailo', 'Khomenko', '490pdapiV', '0960017907', 'Khmelnytskyi district', '0', '1');
/*==============================================================*/
/* Table: "PlaceHunt"                                           */
/*==============================================================*/
INSERT INTO PlaceHunt (region_name, place_name, availability_place, limit_hunters) 
    VALUES ('Poltava district', 'Levada',  '1', '11');
INSERT INTO PlaceHunt (region_name, place_name, availability_place, limit_hunters)  
    VALUES ('Khmelnytskyi district', 'Polonne', '1', '2');
INSERT INTO PlaceHunt (region_name, place_name, availability_place, limit_hunters)  
    VALUES ('Khmelnytskyi district', 'Poninka', '1', '5');
INSERT INTO PlaceHunt (region_name, place_name, availability_place, limit_hunters) 
    VALUES ('Zhytomyr district', 'Pershotravensk', '0', '3');
INSERT INTO PlaceHunt (region_name, place_name, availability_place, limit_hunters) 
    VALUES ('Zhytomyr district', 'Baranivka', '0', '50');
/*==============================================================*/
/* Table: "DateHunt"                                                */
/*==============================================================*/
INSERT INTO DateHunt (date_hunt, permission) 
    VALUES (TO_DATE('2018/08/05', 'yyyy/mm/dd'), '1');
INSERT INTO DateHunt (date_hunt, permission)  
    VALUES (TO_DATE('2018/08/06', 'yyyy/mm/dd'), '1');
INSERT INTO DateHunt (date_hunt, permission)  
    VALUES (TO_DATE('2018/09/06', 'yyyy/mm/dd'), '1');
INSERT INTO DateHunt (date_hunt, permission) 
    VALUES (TO_DATE('2018/08/01', 'yyyy/mm/dd'), '0');
INSERT INTO DateHunt (date_hunt, permission) 
    VALUES (TO_DATE('2018/05/11', 'yyyy/mm/dd'), '0');
/*==============================================================*/
/* Table: "News"                                                */
/*==============================================================*/

INSERT INTO NEWS (date_news, news_title, news_body) 
    VALUES (
	TO_DATE('2017/10/29 10:57','yyyy/mm/dd HH24:MI:SS'),
    'Moose hunting season has begun in Ukraine',
    'However, according to the BBC Ukraine, the Ukrainian government still allowed moose hunting, which the Minister for Ecology and Natural Resources Ostap Semerak, who initiated this moratorium, announced on Facebook: "We were not approving the limits for several months due to the information about the critical decrease of the moose population in Ukraine. Now, the limit for killing 160 mooses has been approved. This is half of what the hunters requested.'
    );
INSERT INTO NEWS (date_news, news_title, news_body)  
    VALUES (
    TO_DATE('2017/10/29 10:58','yyyy/mm/dd HH24:MI:SS'),  
    'BBC Ukraine',
    'The Minister at the same time noted that as an official he could not ignore the position of the representatives of the hunting industry regarding the threats of its collapse, even though he shares the concerns of animal advocates; however if scientific studies on the population of moose in Ukraine show that their population is too low, the moratorium will be renewed.'
    );

INSERT INTO NEWS (date_news, news_title, news_body)  
    VALUES (
    TO_DATE('2017/10/01 10:57','yyyy/mm/dd HH24:MI:SS'),  
    'As Donbas war rages on, Ukrainian forces hunt for saboteurs',
    'Heavy fighting continues in the eastern Ukrainian region of the Donbas, with clashes reported all along front line, Ukrainian Ministry of Defense spokesperson Andriy Lysenko said on March 17 at a briefing in Kyiv. In the past 24 hours, Ukrainian military positions were shelled at least 77 times, with heavy weapons being used by Russian-backed forces in half of the attacks, Lysenko said.'
    );

INSERT INTO NEWS (date_news, news_title, news_body)  
    VALUES (
    TO_DATE('2017/11/20 10:57','yyyy/mm/dd HH24:MI:SS'),  
    'Ukraine s Embassy Condemns UK National Hunts Participation In Diving Competition In Crimea',
    'The Embassy announced this in a statement, Ukrainian News Agency reports.As we found out from media UK national Gary Hunt participated in the so-called Cliff Diving Competition (August, 2017) which took place in the Autonomous Republic of Crimea that has been illegally annexed by the Russian Federation, reads the statement.The Embassy says it is satisfied that the Ambassadors strong advice for UK subjects to refrain from illegally visiting the occupied Crimea has been generally followed.'
    );
INSERT INTO NEWS (date_news, news_title, news_body)  
    VALUES (
    TO_DATE('2018/11/01 03:57','yyyy/mm/dd HH24:MI:SS'),  
    'Woman`s Instagram account devoted to hunting divides social media',
    'An American woman has divided social media with her Instagram account dedicated to her hunting trips. Nikki Tate is a 27-year-old attorney from Dallas, Texas who goes hunting in her free time.She regularly posts pictures on her Instagram of the animals she`s killed, and her account has recently reached a wider audience, prompting mixed reactions.'
    );
INSERT INTO NEWS (date_news, news_title, news_body)  
    VALUES (
    TO_DATE('2017/01/15 17:23','yyyy/mm/dd HH24:MI:SS'),  
    'South African hunter Theunis Botha crushed to death by elephant after it is fatally shot in Zimbabwe',
    'A well-known South African hunter has died after he was crushed to death by an elephant which was shot by another member of his group.Theunis Botha, 51, from Johannesberg, was leading a hunt in Gwai, Zimbabwe, when they stumbled across a herd of elephants, which included pregnant cows. Three elephants stampeded towards the hunters and Mr Botha opened fire with his rifle, prompting a fourth elephant to storm in from the side and lift him up with her trunk. The Afrikaans news site Netwerk24 reported that another member of the group fired the fatal shot at the elephant and, as the animal collapsed dead, she fell on Mr Botha. Simukai Nyasha, a spokesman for the Zimbabwe Parks and Wildlife Authority, said the incident happened on Friday at the Good Luck Farm near Hwange National Park. Mr Botha, who leaves behind five children and his wife Carike, is said to have frequently led lion and leopard-hunting safaris with his pack of dogs in southern African countries. He reportedly also travelled regularly to the US in order to find wealthy customers to take part in trophy hunting.'
    );

/*==============================================================*/
/* Table: "Message"                                                */
/*==============================================================*/

INSERT INTO MESSAGE (date_message, date_news, email, title_message, body_message, send_message) 
    VALUES (
    TO_DATE('2017/10/29 09:57','yyyy/mm/dd HH24:MI:SS'),
    TO_DATE('2017/10/29 10:57','yyyy/mm/dd HH24:MI:SS'),
    'vasya123@gmail.com',
    'Moose hunting season has begun in Ukraine',
    'However, according to the "BBC Ukraine", the Ukrainian government still allowed moose hunting, which the Minister for Ecology and Natural Resources Ostap Semerak, who initiated this moratorium, announced on Facebook: "We were not approving the limits for several months due to the information about the critical decrease of the moose population in Ukraine. Now, the limit for killing 160 mooses has been approved. This is half of what the hunters requested."',
    '0'
    );
INSERT INTO MESSAGE (date_message, date_news, email, title_message, body_message, send_message) 
    VALUES (
    TO_DATE('2017/11/29 10:58','yyyy/mm/dd HH24:MI:SS'),
    TO_DATE('2017/10/29 10:58','yyyy/mm/dd HH24:MI:SS'),
    'olya_prok@gmail.com',
    'BBC Ukraine',
    'The Minister at the same time noted that as an official he could not ignore the position of the representatives of the hunting industry regarding the threats of its collapse, even though he shares the concerns of animal advocates; however if scientific studies on the population of moose in Ukraine show that their population is too low, the moratorium will be renewed.',
    '0'
    );  
INSERT INTO MESSAGE (date_message, date_news, email, title_message, body_message, send_message) 
    VALUES (
    TO_DATE('2018/10/01 10:57','yyyy/mm/dd HH24:MI:SS'),
    TO_DATE('2017/10/01 10:57','yyyy/mm/dd HH24:MI:SS'), 
    'nagibator1488@gmail.com',
    'Ukraine s Embassy Condemns UK National Hunts Participation In Diving Competition In Crimea',
    'The Embassy announced this in a statement, Ukrainian News Agency reports.As we found out from media UK national Gary Hunt participated in the so-called Cliff Diving Competition (August, 2017) which took place in the Autonomous Republic of Crimea that has been illegally annexed by the Russian Federation, reads the statement.The Embassy says it is satisfied that the Ambassadors strong advice for UK subjects to refrain from illegally visiting the occupied Crimea has been generally followed.',
    '0'
    ); 
INSERT INTO MESSAGE (date_message, date_news, email, title_message, body_message, send_message) 
    VALUES (
    TO_DATE('2017/11/20 12:57','yyyy/mm/dd HH24:MI:SS'),
    TO_DATE('2017/11/20 10:57','yyyy/mm/dd HH24:MI:SS'), 
    'yaroslav@gmail.com',
    'As Donbas war rages on, Ukrainian forces hunt for saboteurs',
    'The Embassy announced this in a statement, Ukrainian News Agency reports.As we found out from media UK national Gary Hunt participated in the so-called Cliff Diving Competition (August, 2017) which took place in the Autonomous Republic of Crimea that has been illegally annexed by the Russian Federation, reads the statement.The Embassy says it is satisfied that the Ambassadors strong advice for UK subjects to refrain from illegally visiting the occupied Crimea has been generally followed.',
    '1'); 
    
/*==============================================================*/
/* Table: "CAN_HUNT"                                                */
/*==============================================================*/

INSERT INTO USERS_HUNT (place_name, email, date_hunt) 
    VALUES ('Poninka', 'vasya123@gmail.com', TO_DATE('2018/08/05', 'yyyy/mm/dd'));
INSERT INTO USERS_HUNT (place_name, email, date_hunt) 
    VALUES ('Polonne', 'olya_prok@gmail.com', TO_DATE('2018/08/06', 'yyyy/mm/dd'));
INSERT INTO USERS_HUNT (place_name, email, date_hunt) 
    VALUES ('Baranivka', 'nagibator1488@gmail.com', TO_DATE('2018/08/06', 'yyyy/mm/dd'));
INSERT INTO USERS_HUNT (place_name, email, date_hunt) 
    VALUES ('Levada', 'yaroslav@gmail.com', TO_DATE('2018/08/01', 'yyyy/mm/dd'));
commit;