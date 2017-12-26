

/* Organizer table*/

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('AlexanderDruz', 'druz@gmail.com', 'qwertyuiio');

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('Sanka1994', 'sales23@gmail.com', 'svsdvsdro');

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('yaroslav', 'yaroslav.mavliutov@gmail.com', 'qqqqqqqq11');

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('JonSnow1997', 'Snow1988@mail.ru', 'qwertyuii22o');


/* Team table*/

INSERT INTO Team(team_email, team_name)
VALUES('game@mail.ru', 'DynamoKyiv');

INSERT INTO Team(team_email, team_name)
VALUES('shd@gmail.com', 'ShakhtarDonetsk');

INSERT INTO Team(team_email, team_name)
VALUES('lviv@bandera.com', 'KarpatyLviv');

INSERT INTO Team(team_email, team_name)
VALUES('mu@mail.ru', 'ManchesterUnited');

INSERT INTO Team(team_email, team_name)
VALUES('young@gmail.com', 'YoungBoys');

INSERT INTO Team(team_email, team_name)
VALUES('metal@gmail.com', 'Metalurg');

INSERT INTO Team(team_email, team_name)
VALUES('kharkiv@kpi.ua', 'Metalist');


/* Tournament table*/

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 1 , 'yaroslav', 'KPIOPEN', TO_DATE('2017-11-29', 'YYYY-MM-DD'),TO_DATE('2017-12-29', 'YYYY-MM-DD'));

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 2 , 'yaroslav', 'KPIOPEN2', TO_DATE('2018-11-20', 'YYYY-MM-DD'), TO_DATE('2018-11-29', 'YYYY-MM-DD') );

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 1 , 'AlexanderDruz', 'football', TO_DATE('2017-11-30', 'YYYY-MM-DD'), TO_DATE('2017-12-21', 'YYYY-MM-DD') );

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 3 , 'yaroslav', 'KPIOPEN3', TO_DATE('2018-12-01', 'YYYY-MM-DD'), TO_DATE('2018-12-23', 'YYYY-MM-DD') );


/* Game table*/

INSERT INTO Game(game_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-12-21', 'YYYY-MM-DD'), 'game@mail.ru', 'kharkiv@kpi.ua', 1, 'yaroslav');

INSERT INTO Game(game_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-12-22', 'YYYY-MM-DD'), 'game@mail.ru', 'metal@gmail.com', 1, 'yaroslav');

INSERT INTO Game(game_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-12-26', 'YYYY-MM-DD'), 'metal@gmail.com', 'kharkiv@kpi.ua', 1, 'yaroslav');

INSERT INTO Game(game_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-12-11', 'YYYY-MM-DD'), 'shd@gmail.com', 'young@gmail.com', 1, 'AlexanderDruz');


/* Score table*/

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, game_data_fk, team_goal)
VALUES(TO_DATE('2017-12-21 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'game@mail.ru', 'kharkiv@kpi.ua', TO_DATE('2017-12-21', 'YYYY-MM-DD'), 'kharkiv@kpi.ua');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, game_data_fk, team_goal)
VALUES(TO_DATE('2017-12-21 18:40:08', 'YYYY-MM-DD HH24:MI:SS'), 'game@mail.ru', 'kharkiv@kpi.ua', TO_DATE('2017-12-21', 'YYYY-MM-DD'), 'kharkiv@kpi.ua');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, game_data_fk, team_goal)
VALUES(TO_DATE('2017-12-22 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'game@mail.ru', 'metal@gmail.com', TO_DATE('2017-12-22', 'YYYY-MM-DD'), 'game@mail.ru');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, game_data_fk, team_goal)
VALUES(TO_DATE('2017-12-26 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'metal@gmail.com', 'kharkiv@kpi.ua', TO_DATE('2017-12-26', 'YYYY-MM-DD'), 'kharkiv@kpi.ua');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, game_data_fk, team_goal)
VALUES(TO_DATE('2017-12-11 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'shd@gmail.com', 'young@gmail.com', TO_DATE('2017-12-11', 'YYYY-MM-DD'), 'young@gmail.com');


/* Messages table*/

INSERT INTO Messages(message_data, team_email_fk, organizer_login_fk, message_context)
VALUES(TO_DATE('2017-11-12', 'YYYY-MM-DD'), 'shd@gmail.com', 'AlexanderDruz', 'games !');

INSERT INTO Messages(message_data, team_email_fk, organizer_login_fk, message_context)
VALUES(TO_DATE('2017-11-13', 'YYYY-MM-DD'), 'kharkiv@kpi.ua', 'AlexanderDruz', 'rating');

INSERT INTO Messages(message_data, team_email_fk, organizer_login_fk, message_context)
VALUES(TO_DATE('2017-11-10', 'YYYY-MM-DD'), 'kharkiv@kpi.ua', 'yaroslav', 'give me $');
