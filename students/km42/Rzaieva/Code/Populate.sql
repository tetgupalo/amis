INSERT INTO "Users"
VALUES('user1@gmail.com', 'passw1', 'user');
INSERT INTO "Users"
VALUES('user2@gmail.com', 'passwor2', 'user');
INSERT INTO "Users"
VALUES('user3@gmail.com', 'passwor3', 'admin');

INSERT INTO "Flowers"
VALUES('Garden rose', 'link1', 'discription', '0,2', '3', 'spring');
INSERT INTO "Flowers"
VALUES('Aloe', 'link2', 'discription', '0,2', '2', 'spring');
INSERT INTO "Flowers"
VALUES('Piona', 'link3', 'discription', '0,2', '1', 'spring');

INSERT INTO "Fertilizer"
VALUES('0,01', '1', 'Farm', 'Aloe');
INSERT INTO "Fertilizer"
VALUES('0,02', '2', 'Farm2', 'Piona');
INSERT INTO "Fertilizer"
VALUES('0,03', '3', 'Farm3', 'Aloe');

INSERT INTO "FlowersOfUser"
VALUES('Garden rose', 'user1@gmail.com', '1');
INSERT INTO "FlowersOfUser"
VALUES('Piona', 'user2@gmail.com', '2');
INSERT INTO "FlowersOfUser"
VALUES('Garden rose', 'user3@gmail.com', '3');