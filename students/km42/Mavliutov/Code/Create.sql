/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     29.10.2017 18:50:02                          */
/*==============================================================*/


/*alter table Game
   drop constraint FK_GAME_AWAY_TEAM_TEAM;

alter table Game
   drop constraint FK_GAME_HOME_TEAM_TEAM;

alter table Game
   drop constraint FK_GAME_TOURNAMEN_TOURNAME;

alter table Messages
   drop constraint FK_MESSAGES_ORGANIZER_ORGANIZE;

alter table Messages
   drop constraint FK_MESSAGES_READ_TEAM;

alter table Score
   drop constraint FK_SCORE_GOAL_IN_M_GAME;

alter table Tournament
   drop constraint FK_TOURNAME_ORGANIZE__ORGANIZE;

drop index Away_Team_play_FK;

drop index Home_Team_play_FK;

drop index Tournament_contains_games_FK;

drop table Game cascade constraints;

drop index Read_FK;

drop index Organizer_sends_message_FK;

drop table Messages cascade constraints;

drop table Organizer cascade constraints;

drop index Goal_in_game_FK;

drop table Score cascade constraints;

drop table Team cascade constraints;

drop index Organize_create_ tournament_FK;

drop table Tournament cascade constraints;*/

/*==============================================================*/
/* Table: Organizer                                             */
/*==============================================================*/
create table Organizer 
(
   Organizer_login      VARCHAR2(30)         not null,
   Organizer_email      VARCHAR2(50)         not null,
   Organizer_password   VARCHAR2(30)         not null,
   constraint PK_ORGANIZER primary key (Organizer_login)
);

ALTER TABLE Organizer
ADD CONSTRAINT email_org_unique UNIQUE (Organizer_email);

ALTER TABLE Organizer
ADD CONSTRAINT check_name_organ CHECK(REGEXP_LIKE(Organizer_login, '^[A-z0-9_.]{8,30}$'));

ALTER TABLE Organizer
ADD CONSTRAINT check_pass_organ_len CHECK (length(Organizer_password)>=8 AND length(Organizer_password)<=30);

ALTER TABLE Organizer
ADD CONSTRAINT check_email_organ CHECK(REGEXP_LIKE(Organizer_email, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Organizer
ADD CONSTRAINT check_email_organ_len CHECK((length(Organizer_email)>=8 AND length(Organizer_email)<=50));
/*==============================================================*/
/* Table: Tournament                                            */
/*==============================================================*/
create table Tournament 
(
   Tournament_id        INTEGER              not null,
   Organizer_login_fk   VARCHAR2(30)         not null,
   Tournament_name      VARCHAR2(10)         not null,
   Tournament_data_started DATE              not null,
   Tournament_data_end  DATE                 not null,
   constraint PK_TOURNAMENT primary key (Tournament_id, Organizer_login_fk)
);

ALTER TABLE Tournament
ADD CONSTRAINT tourn_unique UNIQUE (Tournament_name, Tournament_data_started);

ALTER TABLE Tournament
ADD CONSTRAINT check_id_tourn CHECK (REGEXP_LIKE(Tournament_id, '^\d+$'));

ALTER TABLE Tournament
ADD CONSTRAINT check_id_tourn_len CHECK ((Tournament_id > 0) AND (Tournament_id < 2147483647));

ALTER TABLE Tournament
ADD CONSTRAINT check_name_organ_tourn CHECK(REGEXP_LIKE(Organizer_login_fk, '^[A-z0-9_.]{8,30}$'));

ALTER TABLE Tournament
ADD CONSTRAINT check_name_tourn CHECK(REGEXP_LIKE(Tournament_name, '^[A-z0-9]{5,10}$'));

/*ALTER TABLE Tournament*/ 
/*ADD CONSTRAINT check_data_start CHECK (CAST(Tournament_data_started as date) <= CAST(GETDATE() as date));*/
/* IT DOES TRIGGER*/

/*ALTER TABLE Tournament
ADD CONSTRAINT check_date_start1_tourn CHECK(REGEXP_LIKE(Tournament_data_started, '^\'+(\d{4})-(\d{2})-(\d{2})+\'$'));*/
/* IT DOES TO_DATE()*/

ALTER TABLE Tournament
ADD CONSTRAINT check_date_end1_tourn CHECK(Tournament_data_end >= Tournament_data_started);

/*==============================================================*/
/* Table: Game                                                 */
/*==============================================================*/
create table Game
(
   Game_data           DATE                 not null,
   Team1_email_fk       VARCHAR2(50)         not null,
   Team2_email_fk       VARCHAR2(50)         not null,
   Tournament_id_fk     INTEGER              not null,
   Organizer_login_fk   VARCHAR2(30)         not null,
   constraint PK_GAME primary key (Team1_email_fk, Team2_email_fk, Game_data)
);

/*ALTER TABLE Game
ADD CONSTRAINT check_date_game CHECK(REGEXP_LIKE(Game_data, '^\'+(\d{4})-(\d{2})-(\d{2})+\'$'));*/
/* IT DOES TO_DATE()*/
/* start_tournament < match_date < end_tournament --- IT DOES FUNCTION */

ALTER TABLE Game
ADD CONSTRAINT check_id_tourn_game CHECK ( REGEXP_LIKE(Tournament_id_fk, '^\d+$'));

ALTER TABLE Game
ADD CONSTRAINT check_id_tourn_game_len CHECK ((Tournament_id_fk > 0) AND (Tournament_id_fk < 2147483647));

ALTER TABLE Game
ADD CONSTRAINT check_name_organ_game CHECK(REGEXP_LIKE(Organizer_login_fk, '^[A-z0-9_.]{8,30}$'));

ALTER TABLE Game
ADD CONSTRAINT check_email_team1_game CHECK(REGEXP_LIKE(Team1_email_fk, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Game
ADD CONSTRAINT check_email_team1_game_len CHECK((length(Team1_email_fk)>=8 AND length(Team1_email_fk)<=50));

ALTER TABLE Game
ADD CONSTRAINT check_email_team2_game CHECK(REGEXP_LIKE(Team2_email_fk, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Game
ADD CONSTRAINT check_email_team2_game_len CHECK((length(Team2_email_fk)>=8 AND length(Team2_email_fk)<=50));

/*==============================================================*/
/* Index: Tournament_contains_games_FK                        */
/*==============================================================*/
create index Tournament_contains_games_FK on Game (
   Tournament_id_fk ASC,
   Organizer_login_fk ASC
);

/*==============================================================*/
/* Index: Home_Team_play_FK                                     */
/*==============================================================*/
create index Home_Team_play_FK on Game (
   Team2_email_fk ASC
);

/*==============================================================*/
/* Index: Away_Team_play_FK                                     */
/*==============================================================*/
create index Away_Team_play_FK on Game (
   Team1_email_fk ASC
);

/*==============================================================*/
/* Table: Messages                                              */
/*==============================================================*/
create table Messages 
(
   Message_data         DATE                 not null,
   Team_email_fk        VARCHAR2(50)         not null,
   Organizer_login_fk   VARCHAR2(30)         not null,
   Message_context      CLOB                 not null,
   constraint PK_MESSAGES primary key (Team_email_fk, Organizer_login_fk, Message_data)
);

/*ALTER TABLE Messages */ 
/*ADD CONSTRAINT check_data_mess CHECK (CAST(Message_data as date) <= CAST(GETDATE() as date));*/
/* IT DOES TRIGGER*/

/*ALTER TABLE Messages 
ADD CONSTRAINT check_date_mess CHECK(REGEXP_LIKE(Message_data , '^\'+(\d{4})-(\d{2})-(\d{2*/
/* IT DOES TO_DATE()*/

ALTER TABLE Messages 
ADD CONSTRAINT check_mess_len CHECK((length(Message_context)>=2 AND length(Message_context)<=40));

ALTER TABLE Messages 
ADD CONSTRAINT check_email_team_mess CHECK(REGEXP_LIKE(Team_email_fk, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Messages 
ADD CONSTRAINT check_email_team_mess_len CHECK((length(Team_email_fk)>=8 AND length(Team_email_fk)<=50));

ALTER TABLE Messages 
ADD CONSTRAINT check_name_organ_mess CHECK(REGEXP_LIKE(Organizer_login_fk, '^[A-z0-9_.]{8,30}$'));

/*==============================================================*/
/* Index: Organizer_sends_message_FK                            */
/*==============================================================*/
create index Organizer_sends_message_FK on Messages (
   Organizer_login_fk ASC
);

/*==============================================================*/
/* Index: Read_FK                                               */
/*==============================================================*/
create index Read_FK on Messages (
   Team_email_fk ASC
);

/*==============================================================*/
/* Table: Score                                                 */
/*==============================================================*/
create table Score 
(
   Goal_time            TIMESTAMP            not null,
   Team1_email_fk       VARCHAR2(50)         not null,
   Team2_email_fk       VARCHAR2(50)         not null,
   Game_data_fk        DATE                 not null,
   Team_goal            VARCHAR2(50)         not null,
   constraint PK_SCORE primary key (Team1_email_fk, Team2_email_fk, Game_data_fk, Goal_time)
);

/*ALTER TABLE Score */ 
/*ADD CONSTRAINT check_data_game_score CHECK (CAST(Game_data_fk   as date) <= CAST(GETDATE() as date));*/
/* IT DOES TRIGGER*/ 

/*ALTER TABLE Score 
ADD CONSTRAINT check_date_game2_score CHECK(REGEXP_LIKE(Game_data_fk , '^\'+(\d{4})-(\d{2})-(\d{2})+\'$'));*/
/* IT DOES TO_DATE()*/

/*ALTER TABLE Score
ADD CONSTRAINT check_time_goal_score CHECK ((CAST(Game_data_fk AS DATE) = CAST(Goal_time AS DATE)));*/
/* IT DOES TRIGGER*/

ALTER TABLE Score
ADD CONSTRAINT check_name_goal_score CHECK(REGEXP_LIKE(Team_goal, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Score
ADD CONSTRAINT check_name_goal_score_len CHECK((length(Team_goal)>=8 AND length(Team_goal)<=50));

ALTER TABLE Score
ADD CONSTRAINT check_email_team1_score CHECK(REGEXP_LIKE(Team1_email_fk, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Score
ADD CONSTRAINT check_email_team1_score_len CHECK((length(Team1_email_fk)>=8 AND length(Team1_email_fk)<=50));

ALTER TABLE Score
ADD CONSTRAINT check_email_team2_score CHECK(REGEXP_LIKE(Team2_email_fk, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Score
ADD CONSTRAINT check_email_team2_score_len CHECK((length(Team2_email_fk)>=8 AND length(Team2_email_fk)<=50));

/*==============================================================*/
/* Index: Goal_in_game_FK                                      */
/*==============================================================*/
create index Goal_in_game_FK on Score (
   Team1_email_fk ASC,
   Team2_email_fk ASC,
   Game_data_fk ASC
);

/*==============================================================*/
/* Table: Team                                                  */
/*==============================================================*/
create table Team 
(
   Team_email           VARCHAR2(50)         not null,
   Team_name            VARCHAR2(30)         not null,
   constraint PK_TEAM primary key (Team_email)
);

ALTER TABLE Team
ADD CONSTRAINT team_name_unique UNIQUE (Team_name);

ALTER TABLE Team
ADD CONSTRAINT check_name_team CHECK(REGEXP_LIKE(Team_name, '^[A-z0-9]{8,30}$'));

ALTER TABLE Team
ADD CONSTRAINT check_email_team CHECK(REGEXP_LIKE (Team_email, '^[A-z0-9_.]+@([A-z]{2,6}+\.)+[A-z]{2,6}$'));

ALTER TABLE Team
ADD CONSTRAINT check_email_team_len CHECK((length(Team_email)>=8 AND length(Team_email)<=50));

/*==============================================================*/
/* Index: "Organize_create_ tournament_FK"                      */
/*==============================================================*/
create index Organize_create_tournament_FK on Tournament (
   Organizer_login_fk ASC
);

alter table Game
   add constraint FK_GAME_AWAY_TEAM_TEAM foreign key (Team1_email_fk)
      references Team (Team_email);

alter table Game
   add constraint FK_GAME_HOME_TEAM_TEAM foreign key (Team2_email_fk)
      references Team (Team_email);

alter table Game
   add constraint FK_GAME_TOURNAMEN_TOURNAME foreign key (Tournament_id_fk, Organizer_login_fk)
      references Tournament (Tournament_id, Organizer_login_fk);

alter table Messages
   add constraint FK_MESSAGES_ORGANIZER_ORGANIZE foreign key (Organizer_login_fk)
      references Organizer (Organizer_login);

alter table Messages
   add constraint FK_MESSAGES_READ_TEAM foreign key (Team_email_fk)
      references Team (Team_email);

alter table Score
   add constraint FK_SCORE_GOAL_IN_M_GAME foreign key (Team1_email_fk, Team2_email_fk, Game_data_fk)
      references Game (Team1_email_fk, Team2_email_fk, Game_data);

alter table Tournament
   add constraint FK_TOURNAME_ORGANIZE__ORGANIZE foreign key (Organizer_login_fk)
      references Organizer (Organizer_login);

/* Trigger for current time */
/*create or replace TRIGGER trg_check_dates
  BEFORE INSERT OR UPDATE ON Tournament
  FOR EACH ROW
BEGIN
  IF( :new.Tournament_data_started <= SYSDATE )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 
          'Invalid Tournament_data_started: Tournament_data_started must be greater than the current date - value = ' || 
          to_char( :new.Tournament_data_started, 'YYYY-MM-DD HH24:MI:SS' ) );
  END IF;
END;*/
