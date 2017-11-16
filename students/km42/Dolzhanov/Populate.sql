
/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category 
(
   product_category     VARCHAR2(32)         not null,
   constraint PK_CATEGORY primary key (product_category)
);

INSERT INTO "Category" (product_category) VALUES ('Shoes');
INSERT INTO "Category" (product_category) VALUES ('Pants');
INSERT INTO "Category" (product_category) VALUES ('Shirt');

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   order_id             INTEGER              not null,
   user_login           VARCHAR2(32)         not null,
   order_date           DATE                 not null,
   order_status         CLOB                 not null,
   constraint PK_ORDER primary key (order_id)
);

INSERT INTO "Order" (order_id, user_login, order_date, order_status) VALUES (1, 'Masha', TO_DATE('2017-11-03 07:55:20', 'YYYY-MM-DD HH24:MI:SS'), 'Open');
INSERT INTO "Order" (order_id, user_login, order_date, order_status) VALUES (2, 'Vladimir', TO_DATE('2017-11-04 07:55:20', 'YYYY-MM-DD HH24:MI:SS'), 'Open');
INSERT INTO "Order" (order_id, user_login, order_date, order_status) VALUES (3, 'Borys', TO_DATE('2017-11-05 07:55:20', 'YYYY-MM-DD HH24:MI:SS'), 'Open');

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on "Order" (
   user_login ASC
);

/*==============================================================*/
/* Table: Order_item                                            */
/*==============================================================*/
create table Order_item 
(
   order_id             INTEGER              not null,
   product_id           INTEGER              not null,
   Item_quatity         NUMBER(6)            not null,
   constraint PK_ORDER_ITEM primary key (order_id, product_id, Item_quatity)
);

INSERT INTO "Order_item" (order_id, product_id, Item_quatity) VALUES (1, 11, 4);
INSERT INTO "Order_item" (order_id, product_id, Item_quatity) VALUES (2, 22, 5);
INSERT INTO "Order_item" (order_id, product_id, Item_quatity) VALUES (3, 33, 6);

/*==============================================================*/
/* Index: product_order_item_FK                                 */
/*==============================================================*/
create index product_order_item_FK on Order_item (
   product_id ASC
);

/*==============================================================*/
/* Index: order_item_in_order_FK                                */
/*==============================================================*/
create index order_item_in_order_FK on Order_item (
   order_id ASC
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product 
(
   product_id           INTEGER              not null,
   product_category     VARCHAR2(32)         not null,
   storehouse_number    NUMBER(6)            not null,
   storehouse_adress    VARCHAR2(56)         not null,
   product_name         VARCHAR2(32)         not null,
   product_price        NUMBER(6)            not null,
   product_info         VARCHAR2(250),
   constraint PK_PRODUCT primary key (product_id)
);

INSERT INTO "Product" (product_id, product_category, storehouse_number, storehouse_adress, product_name, product_price, product_info) VALUES (11, 'Shoes', 1, 'street A', 'Shoes_A', 111, 'Black');
INSERT INTO "Product" (product_id, product_category, storehouse_number, storehouse_adress, product_name, product_price, product_info) VALUES (22, 'Pants', 2, 'street B', 'Pants_A', 222, 'Blue');
INSERT INTO "Product" (product_id, product_category, storehouse_number, storehouse_adress, product_name, product_price, product_info) VALUES (33, 'Shirt', 3, 'street C', 'Shirt_A', 333, 'White');

/*==============================================================*/
/* Index: storehouse_supply_product_FK                          */
/*==============================================================*/
create index storehouse_supply_product_FK on Product (
   storehouse_number ASC,
   storehouse_adress ASC
);

/*==============================================================*/
/* Index: product_category_FK                                   */
/*==============================================================*/
create index product_category_FK on Product (
   product_category ASC
);

/*==============================================================*/
/* Table: Storehouse                                            */
/*==============================================================*/
create table Storehouse 
(
   storehouse_number    NUMBER(6)            not null,
   storehouse_adress    VARCHAR2(56)         not null,
   storehouse_phonenum  NUMBER(10),
   constraint PK_STOREHOUSE primary key (storehouse_number, storehouse_adress)
);

INSERT INTO "Storehouse" (storehouse_number, storehouse_adress, storehouse_phonenum) VALUES (1, 'street A', 1111111);
INSERT INTO "Storehouse" (storehouse_number, storehouse_adress, storehouse_phonenum) VALUES (1, 'street B', 2222222);
INSERT INTO "Storehouse" (storehouse_number, storehouse_adress, storehouse_phonenum) VALUES (1, 'street C', 3333333);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_login           VARCHAR2(32)         not null,
   user_name            VARCHAR2(32)         not null,
   user_email           VARCHAR2(32)         not null,
   user_password        VARCHAR2(32)         not null,
   user_phonenum        NUMBER(10),
   constraint PK_USER primary key (user_login)
);

INSERT INTO "User" (user_login, user_name, user_email, user_password, user_phonenum) VALUES ('Masha', 'Masha Mashovna', 'masha@gmail.com', '111', '1111111');
INSERT INTO "User" (user_login, user_name, user_email, user_password, user_phonenum) VALUES ('Vladimir', 'Vladimir Vladimirovich', 'vladimir@gmail.com', '222', '2222222');
INSERT INTO "User" (user_login, user_name, user_email, user_password, user_phonenum) VALUES ('Borys', 'Borys Borysovich', 'borys@gmail.com', '333', '3333333');

alter table "Order"
   add constraint FK_ORDER_USER_ORDE_USER foreign key (user_login)
      references "User" (user_login);

alter table Order_item
   add constraint FK_ORDER_IT_ORDER_ITE_ORDER foreign key (order_id)
      references "Order" (order_id);

alter table Order_item
   add constraint FK_ORDER_IT_PRODUCT_O_PRODUCT foreign key (product_id)
      references Product (product_id);

alter table Product
   add constraint FK_PRODUCT_PRODUCT_C_CATEGORY foreign key (product_category)
      references Category (product_category);

alter table Product
   add constraint FK_PRODUCT_STOREHOUS_STOREHOU foreign key (storehouse_number, storehouse_adress)
      references Storehouse (storehouse_number, storehouse_adress);

