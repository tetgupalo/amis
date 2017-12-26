create table userinfo(
    id number(10) not null,
    firstname varchar(40) not null,
    lastname varchar(40) not null,
    gender number(2) not null,
    dateOfBirth date not null,
    country varchar(40) not null,
    Constraint userinfo_pk primary key(id)
);

create table userrole(
    id number(10) not null,
    name varchar(40) not null,
    Constraint role_pk primary key(id)
);

create table appUser(
    id number(10) not null,
    email varchar(40) not null,
    password varchar(40) not null,
    userInfoId number(10) not null,
    roleId number(10) not null,
    Constraint user_pk primary key(id),
    Foreign key (userInfoId) references userinfo(id),
    Foreign key (roleId) references userrole(id)
    );
    
create table hotelInfo(
    id number(10) not null,
    title varchar(30) not null,
    description varchar(30) not null,
    countOfStars number(10) not null,
    Constraint hotelInfo_pk primary key(id)
);
create table hotelAddress(
    id number(10) not null,
    street varchar(30) not null,
    city varchar(30) not null,
    country varchar(30) not null, 
    houseNumber number(5) not null,
 Constraint hotelAddress_pk primary key(id)  
 );
    
  
create table hotel(
    id number(10) not null,
    hotelInfoId number(10) not null,
    hotelAddressId number(10) not null,
    Constraint hotel_pk primary key(id),
    Foreign key (hotelInfoId) references hotelInfo(id),
    Foreign key (hotelAddressId) references hotelAddress(id)
    );

create table roomType(
    id number(10) not null,
    name varchar(40) not null,
    Constraint roomType_pk primary key(id)
    );

create table room(
    id number(10) not null,
    floor number(4) not null,
    numberOfRoom number(10) not null,
    hotelId number(10) not null,
    roomTypeId number(10) not null,
    Constraint room_pk primary key(id),
    Foreign key (hotelId) references hotel(id),
    Foreign key (roomTypeId) references roomType(id)
    );