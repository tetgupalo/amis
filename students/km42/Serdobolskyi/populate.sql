--Create users

INSERT INTO "User" ("Name", "Password", "Email") 
  VALUES ('Egorka', '12345', 'egor@doma.net.pk');
  
  INSERT INTO "User" ("Name", "Password", "Email") 
  VALUES ('Dima', '34512', 'dima@my.com');
  
  INSERT INTO "User" ("Name", "Password", "Email") 
  VALUES ('Kolya', '11111115', 'kolya@min.net');


INSERT INTO "Patternsm" ("Name_pattern") 
  VALUES ('Formyjob');
  
  INSERT INTO "Patternsm" ("Name_pattern") 
  VALUES ('forfiends');
  
  INSERT INTO "Patternsm" ("Name_pattern") 
  VALUES ('Justfor');

  INSERT INTO "Styleofemail" ("Style", "Name_pattern") 
  VALUES ('Official' , 'Formyjob');
  
    INSERT INTO "Styleofemail" ("Style", "Name_pattern") 
  VALUES ('Nonoffic' , 'forfiends');
  
    INSERT INTO "Styleofemail" ("Style", "Name_pattern") 
  VALUES ('Ending' , 'Justfor');



 INSERT INTO "Startendemail" ("NameStartEndEmail", "Name_pattern", "EndEmail", "StartEmail") 
  VALUES ('Jobs' , 'Formyjob', 'GL, Dear Friend' , 'Hello, i am writing to');
  
   INSERT INTO "Startendemail" ("NameStartEndEmail", "Name_pattern", "EndEmail", "StartEmail") 
  VALUES ('Frindik' , 'forfiends', 'GLHF' , 'Hi my Dear');
  
   INSERT INTO "Startendemail" ("NameStartEndEmail", "Name_pattern", "EndEmail", "StartEmail") 
  VALUES ('laught' , 'Justfor', 'LoL,' , 'Lol');


    INSERT INTO "Userhaspattern" ("Email", "Name_pattern") 
  VALUES ('egor@doma.net.pk' , 'Formyjob');
  
  INSERT INTO "Userhaspattern" ("Email", "Name_pattern") 
  VALUES ('dima@my.com' , 'forfiends');
  
   INSERT INTO "Userhaspattern" ("Email", "Name_pattern") 
  VALUES ('kolya@min.net' , 'Justfor');
  



