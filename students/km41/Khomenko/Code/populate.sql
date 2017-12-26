/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
INSERT INTO "User" ("email", "first_name", "last_name", "password", "phone_number", "region") 
    VALUES ('vasya123@gmail.com', 'Vasya', 'Polischuk', 'vasya321', '0960548777', 'Poltava');
INSERT INTO "User" ("email", "first_name", "last_name", "password", "phone_number", "region") 
    VALUES ('olya_prok@gmail.com', 'Olga', 'Prokopchuk', 'olyaprokop', '0635544789', 'Sumy');
INSERT INTO "User" ("email", "first_name", "last_name", "password", "phone_number", "region") 
    VALUES ('nagibator1488@gmail.com', 'Artem', 'Ivanov', 'nagib222', '0984596588', 'Kyiv');
INSERT INTO "User" ("email", "first_name", "last_name", "password", "phone_number", "region") 
    VALUES ('yaroslav@gmail.com', 'Yaroslav', 'Polischuk', 'mavlya1997', '0673011879', 'Khmelnitsky');
/*==============================================================*/
/* Table: "PlaceDate"                                                */
/*==============================================================*/
INSERT INTO "PlaceDate" ("region_name", "place_name", "date_start", "date_end", "availability_place") 
    VALUES ('Poltava', 'Levada', TO_DATE('2018/08/05', 'yyyy/mm/dd'), TO_DATE('2018/11/29', 'yyyy/mm/dd'), '1');
INSERT INTO "PlaceDate" ("region_name", "place_name", "date_start", "date_end", "availability_place") 
    VALUES ('Khmelnitsky', 'Polonne', TO_DATE('2018/08/06', 'yyyy/mm/dd'), TO_DATE('2018/11/29', 'yyyy/mm/dd'), '1');
INSERT INTO "PlaceDate" ("region_name", "place_name", "date_start", "date_end", "availability_place") 
    VALUES ('Khmelnitsky', 'Poninka', TO_DATE('2018/08/06', 'yyyy/mm/dd'), TO_DATE('2018/11/29', 'yyyy/mm/dd'), '1');
INSERT INTO "PlaceDate" ("region_name", "place_name", "date_start", "date_end", "availability_place") 
    VALUES ('Zhytomyr', 'Pershotravensk', TO_DATE('2018/08/01', 'yyyy/mm/dd'), TO_DATE('2018/11/22', 'yyyy/mm/dd'), '0');
/*==============================================================*/
/* Table: "News"                                                */
/*==============================================================*/

INSERT INTO "News" ("date_news", "news_title", "news_body", "news_comment") 
    VALUES (
    TO_DATE('2017/10/29', 'yyyy/mm/dd'), 
    'Moose hunting season has begun in Ukraine',
    'However, according to the "BBC Ukraine", the Ukrainian government still allowed moose hunting, which the Minister for Ecology and Natural Resources Ostap Semerak, who initiated this moratorium, announced on Facebook: "We were not approving the limits for several months due to the information about the critical decrease of the moose population in Ukraine. Now, the limit for killing 160 mooses has been approved. This is half of what the hunters requested."',
    'Its nice news'
    );
INSERT INTO "News" ("date_news", "news_title", "news_body", "news_comment") 
    VALUES (
    TO_DATE('2017/10/28', 'yyyy/mm/dd'), 
    'BBC Ukraine',
    'The Minister at the same time noted that "as an official he could not ignore the position of the representatives of the hunting industry regarding the threats of its collapse", even though he shares the concerns of animal advocates; however if scientific studies on the population of moose in Ukraine show that their population is too low, the moratorium will be renewed.',
    'Cool'
    );

INSERT INTO "News" ("date_news", "news_title", "news_body", "news_comment") 
    VALUES (
    TO_DATE('2017/10/31', 'yyyy/mm/dd'), 
    'As Donbas war rages on, Ukrainian forces hunt for saboteurs',
    'Heavy fighting continues in the eastern Ukrainian region of the Donbas, with clashes reported all along front line, Ukrainian Ministry of Defense spokesperson Andriy Lysenko said on March 17 at a briefing in Kyiv. In the past 24 hours, Ukrainian military positions were shelled at least 77 times, with heavy weapons being used by Russian-backed forces in half of the attacks, Lysenko said.',
    'Nice'
    );

INSERT INTO "News" ("date_news", "news_title", "news_body", "news_comment") 
    VALUES (
    TO_DATE('2017/11/05', 'yyyy/mm/dd'), 
    'Ukraine s Embassy Condemns UK National Hunts Participation In Diving Competition In Crimea',
    'The Embassy announced this in a statement, Ukrainian News Agency reports.As we found out from media UK national Gary Hunt participated in the so-called Cliff Diving Competition (August, 2017) which took place in the Autonomous Republic of Crimea that has been illegally annexed by the Russian Federation, reads the statement.The Embassy says it is satisfied that the Ambassadors strong advice for UK subjects to refrain from illegally visiting the occupied Crimea has been generally followed.',
    'Cool'
    );

/*==============================================================*/
/* Table: "Message"                                                */
/*==============================================================*/

INSERT INTO "Message" ("date_message", "date_news", "email", "title_message", "body_message") 
    VALUES (
    TO_DATE('2017/11/05', 'yyyy/mm/dd'),
    TO_DATE('2017/11/05', 'yyyy/mm/dd'),
    'vasya123@gmail.com',
    'Moose hunting season has begun in Ukraine',
    'However, according to the "BBC Ukraine", the Ukrainian government still allowed moose hunting, which the Minister for Ecology and Natural Resources Ostap Semerak, who initiated this moratorium, announced on Facebook: "We were not approving the limits for several months due to the information about the critical decrease of the moose population in Ukraine. Now, the limit for killing 160 mooses has been approved. This is half of what the hunters requested."'
    );
INSERT INTO "Message" ("date_message", "date_news", "email", "title_message", "body_message") 
    VALUES (
    TO_DATE('2017/10/29', 'yyyy/mm/dd'),
    TO_DATE('2017/10/28', 'yyyy/mm/dd'),
    'olya_prok@gmail.com',
    'BBC Ukraine',
    'The Minister at the same time noted that "as an official he could not ignore the position of the representatives of the hunting industry regarding the threats of its collapse", even though he shares the concerns of animal advocates; however if scientific studies on the population of moose in Ukraine show that their population is too low, the moratorium will be renewed.'
    );  
INSERT INTO "Message" ("date_message", "date_news", "email", "title_message", "body_message") 
    VALUES (
    TO_DATE('2017/10/31', 'yyyy/mm/dd'),
    TO_DATE('2017/10/31', 'yyyy/mm/dd'), 
    'nagibator1488@gmail.com',
    'Ukraine s Embassy Condemns UK National Hunts Participation In Diving Competition In Crimea',
    'The Embassy announced this in a statement, Ukrainian News Agency reports.As we found out from media UK national Gary Hunt participated in the so-called Cliff Diving Competition (August, 2017) which took place in the Autonomous Republic of Crimea that has been illegally annexed by the Russian Federation, reads the statement.The Embassy says it is satisfied that the Ambassadors strong advice for UK subjects to refrain from illegally visiting the occupied Crimea has been generally followed.'
    ); 
INSERT INTO "Message" ("date_message", "date_news", "email", "title_message", "body_message") 
    VALUES (
    TO_DATE('2017/11/04', 'yyyy/mm/dd'),
    TO_DATE('2017/11/05', 'yyyy/mm/dd'), 
    'yaroslav@gmail.com',
    'As Donbas war rages on, Ukrainian forces hunt for saboteurs',
    'The Embassy announced this in a statement, Ukrainian News Agency reports.As we found out from media UK national Gary Hunt participated in the so-called Cliff Diving Competition (August, 2017) which took place in the Autonomous Republic of Crimea that has been illegally annexed by the Russian Federation, reads the statement.The Embassy says it is satisfied that the Ambassadors strong advice for UK subjects to refrain from illegally visiting the occupied Crimea has been generally followed.'
    ); 
    
/*==============================================================*/
/* Table: "CAN_HUNT"                                                */
/*==============================================================*/

INSERT INTO "CAN_HUNT" ("region_name", "email") 
    VALUES ('Poltava', 'vasya123@gmail.com');
INSERT INTO "CAN_HUNT" ("region_name", "email") 
    VALUES ('Sumy', 'olya_prok@gmail.com');
INSERT INTO "CAN_HUNT" ("region_name", "email") 
    VALUES ('Kyiv', 'nagibator1488@gmail.com');
INSERT INTO "CAN_HUNT" ("region_name", "email") 
    VALUES ('Khmelnitsky', 'yaroslav@gmail.com');

/*==============================================================*/
/* Table: "CAN_VIEW_NEWS"                                                */
/*==============================================================*/

INSERT INTO "CAN_VIEW_NEWS" ("date_news", "email") 
    VALUES (TO_DATE('2017/10/29', 'yyyy/mm/dd'), 'vasya123@gmail.com');
INSERT INTO "CAN_VIEW_NEWS" ("date_news", "email") 
    VALUES (TO_DATE('2017/10/28', 'yyyy/mm/dd'), 'olya_prok@gmail.com');
INSERT INTO "CAN_VIEW_NEWS" ("date_news", "email") 
    VALUES (TO_DATE('2017/10/31', 'yyyy/mm/dd'), 'nagibator1488@gmail.com');
INSERT INTO "CAN_VIEW_NEWS" ("date_news", "email") 
    VALUES (TO_DATE('2017/11/05', 'yyyy/mm/dd'), 'yaroslav@gmail.com');


