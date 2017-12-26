INSERT INTO USERS VALUES ( '' ,  'ADMIN' , 'mitiabmx@gmail.com' , 'Dmytro', 'Shvayka' , 'password');
INSERT INTO USERS VALUES ( '' ,  'USER' , 'love@gmail.com' , 'Love', 'Matveeva' , 'password1');
INSERT INTO USERS VALUES ( '' ,  'USER' , 'Vlad@gmail.com' , 'Vlad', 'Samusenko' , 'password3');

 declare
     l_bfile   bfile;
     begin
     l_bfile := bfilename( 'SOUNDS', 'SOUND1.mp3');
     insert into SIGNAL values('',6, 'SOUND1' , l_bfile); 
     commit;
     end;    

	 declare
     l_bfile   bfile;
     begin
     l_bfile := bfilename( 'SOUNDS', 'SOUND2.mp3');
     insert into SIGNAL values('',6, 'SOUND2' , l_bfile); 
     commit;
     end;    
	 
	 declare
     l_bfile   bfile;
     begin
     l_bfile := bfilename( 'SOUNDS', 'SOUND3.mp3');
     insert into SIGNAL values('',6, 'SOUND3' , l_bfile); 
     commit;
     end;    



	 



INSERT INTO ALARM VALUES ( '' , '6' , 21 , TO_DATE('25-12-2017 23:59','DD-mm-YY HH24:MI') ,   10 , 5 , 10,  1,1,1,1,1,1,1);
INSERT INTO ALARM VALUES ( '' , '7',  22 , TO_DATE('25-12-2017 23:58','DD-mm-YY HH24:MI') ,  10 , 5 , 10,  1,1,1,1,1,1,1);
INSERT INTO ALARM VALUES ( '' , '8',  23 , TO_DATE('25-12-2017 23:58','DD-mm-YY HH24:MI') , 10 , 5 , 10,  1,1,1,1,1,1,1);




ALTER SESSION SET NLS_DATE_FORMAT='dd-mm-yy HH24:MI';


