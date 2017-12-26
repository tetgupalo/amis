/* Create users */

INSERT INTO "STUDENT"."Users" (USER_ID, USER_NAME, USER_SURNAME, USER_REGISTRATION_DATE, USER_EMAIL, USER_PASSWORD, ADMIN_EMAIL) VALUES ('1', 'Sv', 'Dfns', TO_DATE('2017-11-17 23:18:31', 'YYYY-MM-DD HH24:MI:SS'), 'sad@dsfs.com', '1111', 'sad@dsfs.com')
INSERT INTO "STUDENT"."Users" (USER_ID, USER_NAME, USER_SURNAME, USER_REGISTRATION_DATE, USER_EMAIL, USER_PASSWORD, ADMIN_EMAIL) VALUES ('2', 'Per', 'Xdfsdf', TO_DATE('2017-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'mad@dsfs.com', '2222', 'sad@dsfs.com')
INSERT INTO "STUDENT"."Users" (USER_ID, USER_NAME, USER_SURNAME, USER_REGISTRATION_DATE, USER_EMAIL, USER_PASSWORD, ADMIN_EMAIL) VALUES ('3', 'Igor', 'Ners', TO_DATE('2017-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'kad@dsfs.com', '3333', 'sad@dsfs.com')
INSERT INTO "STUDENT"."Users" (USER_ID, USER_NAME, USER_SURNAME, USER_REGISTRATION_DATE, USER_EMAIL, USER_PASSWORD, ADMIN_EMAIL) VALUES ('4', 'Olha', 'Maer', TO_DATE('2017-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'lad@dsfs.com', '4444', 'sad@dsfs.com')


/* Create votings */

INSERT INTO "STUDENT"."VOTINGS" (VOTINGS_ID, VOTING_NAME, "Voting_start date", "Voting_finish date", VOTING_QUESTION) VALUES ('1', 'Have you ever seen the rain?', TO_DATE('2017-11-16 23:22:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-11-30 23:22:41', 'YYYY-MM-DD HH24:MI:SS'), 'Have you ever seen the rain?')
INSERT INTO "STUDENT"."VOTINGS" (VOTINGS_ID, VOTING_NAME, "Voting_start date", "Voting_finish date", VOTING_QUESTION) VALUES ('2', 'Have you ever been to Paris?', TO_DATE('2017-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-11-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Have you ever been to Paris?')
INSERT INTO "STUDENT"."VOTINGS" (VOTINGS_ID, VOTING_NAME, "Voting_start date", "Voting_finish date", VOTING_QUESTION) VALUES ('3', 'Are you 20 years old?                                                                                                                                                                     ', TO_DATE('2017-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-11-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Are you 20 years old?                                                                                                                                                                     ')
INSERT INTO "STUDENT"."VOTINGS" (VOTINGS_ID, VOTING_NAME, "Voting_start date", "Voting_finish date", VOTING_QUESTION) VALUES ('4', 'Have you studied SQL?', TO_DATE('2017-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-11-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Have you studied SQL?')


/* Create votes */

INSERT INTO "STUDENT"."VOTE" (VOTINGS_ID, USER_ID) VALUES ('1', '1')
INSERT INTO "STUDENT"."VOTE" (VOTINGS_ID, USER_ID) VALUES ('1', '2')
INSERT INTO "STUDENT"."VOTE" (VOTINGS_ID, USER_ID) VALUES ('1', '3')
INSERT INTO "STUDENT"."VOTE" (VOTINGS_ID, USER_ID) VALUES ('2', '1')
