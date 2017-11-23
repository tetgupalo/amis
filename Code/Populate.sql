insert into userInfo(id,firstname,lastname,gender,dateOfBirth,country)
values(1, 'name1','lname1',1,to_date('1996/02/24','yyyy/mm/dd'),'Ukraine');
insert into userInfo(id,firstname,lastname,gender,dateOfBirth,country)
values(2, 'name2','lname2',2,to_date('1976/08/24','yyyy/mm/dd'),'Ukraine');
insert into userInfo(id,firstname,lastname,gender,dateOfBirth,country)
values(3, 'name3','lname3',1,to_date('1986/12/24','yyyy/mm/dd'),'Ukraine');

insert into userRole(id,name)
values(1,'user');
insert into userRole(id,name)
values(2,'admin');
insert into userRole(id,name)
values(3,'databaseAdmin');

insert into appUser(id,email,password,userInfoId,roleId)
values (1,'user@user.com','pass',1,1);
insert into appUser(id,email,password,userInfoId,roleId)
values (2,'admin@user.com','pass1',2,2);
insert into appUser(id,email,password,userInfoId,roleId)
values (3,'db@user.com','pass2',3,3);

insert into hotelinfo(id,title,description,countOfStars)
values(1,'title1','description1',4);
insert into hotelinfo(id,title,description,countOfStars)
values(2,'title2','description2',3);
insert into hotelinfo(id,title,description,countOfStars)
values(3,'title3','description3',5);

insert into hoteladdress(id,street,city,country,housenumber)
values(1,'street1','city1','Ukraine',1);
insert into hoteladdress(id,street,city,country,housenumber)
values(2,'street2','city2','Ukraine',5);
insert into hoteladdress(id,street,city,country,housenumber)
values(3,'street3','city3','Ukraine',10);

insert into hotel(id,hotelInfoId,hoteladdressid)
values(1,1,1);
insert into hotel(id,hotelInfoId,hoteladdressid)
values(2,2,2);
insert into hotel(id,hotelInfoId,hoteladdressid)
values(3,3,3);

insert into roomtype(id,name)
values(1,'type1');
insert into roomtype(id,name)
values(2,'type2');
insert into roomtype(id,name)
values(3,'type3');

insert into room(id,floor,numberOfRoom,hotelid,roomtypeid)
values(1,1,24,1,1);
insert into room(id,floor,numberOfRoom,hotelid,roomtypeid)
values(2,2,34,1,2);
insert into room(id,floor,numberOfRoom,hotelid,roomtypeid)
values(3,5,44,1,3);