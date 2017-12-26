/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     08.12.2017 19:58:41                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ITEM_COTEGORY__CATEGORY') then
    alter table Item
       delete foreign key FK_ITEM_COTEGORY__CATEGORY
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ITEM_ITEMS_IN__STOCK') then
    alter table Item
       delete foreign key FK_ITEM_ITEMS_IN__STOCK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORDER_USER_ORDE_USER') then
    alter table "Order"
       delete foreign key FK_ORDER_USER_ORDE_USER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORDER_IT_ITEMS_IN__ITEM') then
    alter table Order_item
       delete foreign key FK_ORDER_IT_ITEMS_IN__ITEM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORDER_IT_ORDER_ITE_ORDER') then
    alter table Order_item
       delete foreign key FK_ORDER_IT_ORDER_ITE_ORDER
end if;

drop index if exists Category.Category_PK;

drop table if exists Category;

drop index if exists Item.cotegory_of_item_FK;

drop index if exists Item.items_in_stock_FK;

drop index if exists Item.Item_PK;

drop table if exists Item;

drop index if exists "Order".user_order_FK;

drop index if exists "Order".Order_PK;

drop table if exists "Order";

drop index if exists Order_item.items_in_order_FK;

drop index if exists Order_item.order_items_in_order_FK;

drop index if exists Order_item.Order_item_PK;

drop table if exists Order_item;

drop index if exists Stock.Stock_PK;

drop table if exists Stock;

drop index if exists "User".User_PK;

drop table if exists "User";

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category 
(
   product_category     varchar(32)                    not null,
   constraint PK_CATEGORY primary key (product_category)
);

/*==============================================================*/
/* Index: Category_PK                                           */
/*==============================================================*/
create unique index Category_PK on Category (
product_category ASC
);

/*==============================================================*/
/* Table: Item                                                  */
/*==============================================================*/
create table Item 
(
   item_name            varchar(20)                    not null,
   item_price           numeric(4)                     null,
   item_info            varchar(320)                   null,
   item_quantity        integer                        null,
   item_id              varchar(10)                    not null,
   stock_num            char(10)                       null,
   product_category     varchar(32)                    null,
   constraint PK_ITEM primary key (item_id)
);

/*==============================================================*/
/* Index: Item_PK                                               */
/*==============================================================*/
create unique index Item_PK on Item (
item_id ASC
);

/*==============================================================*/
/* Index: items_in_stock_FK                                     */
/*==============================================================*/
create index items_in_stock_FK on Item (
stock_num ASC
);

/*==============================================================*/
/* Index: cotegory_of_item_FK                                   */
/*==============================================================*/
create index cotegory_of_item_FK on Item (
product_category ASC
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   order_id             integer                        not null,
   user_login           varchar(12)                    null,
   order_date           date                           null,
   order_status         varchar(20)                    null,
   constraint PK_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: Order_PK                                              */
/*==============================================================*/
create unique index Order_PK on "Order" (
order_id ASC
);

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
   product_quantity     numeric(3)                     not null,
   order_id             integer                        null,
   item_id              varchar(10)                    null,
   constraint PK_ORDER_ITEM primary key (product_quantity)
);

/*==============================================================*/
/* Index: Order_item_PK                                         */
/*==============================================================*/
create unique index Order_item_PK on Order_item (
product_quantity ASC
);

/*==============================================================*/
/* Index: order_items_in_order_FK                               */
/*==============================================================*/
create index order_items_in_order_FK on Order_item (
order_id ASC
);

/*==============================================================*/
/* Index: items_in_order_FK                                     */
/*==============================================================*/
create index items_in_order_FK on Order_item (
item_id ASC
);

/*==============================================================*/
/* Table: Stock                                                 */
/*==============================================================*/
create table Stock 
(
   stock_num            char(10)                       not null,
   stock_adress         char(10)                       null,
   stock_ph             char(10)                       null,
   constraint PK_STOCK primary key (stock_num)
);

/*==============================================================*/
/* Index: Stock_PK                                              */
/*==============================================================*/
create unique index Stock_PK on Stock (
stock_num ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_login           varchar(12)                    not null,
   user_pass            varchar(12)                    null,
   user_email           varchar(20)                    null,
   user_address         varchar(60)                    null,
   user_ph              numeric(10)                    null,
   constraint PK_USER primary key (user_login)
);

/*==============================================================*/
/* Index: User_PK                                               */
/*==============================================================*/
create unique index User_PK on "User" (
user_login ASC
);

alter table Item
   add constraint FK_ITEM_COTEGORY__CATEGORY foreign key (product_category)
      references Category (product_category)
      on update restrict
      on delete restrict;

alter table Item
   add constraint FK_ITEM_ITEMS_IN__STOCK foreign key (stock_num)
      references Stock (stock_num)
      on update restrict
      on delete restrict;

alter table "Order"
   add constraint FK_ORDER_USER_ORDE_USER foreign key (user_login)
      references "User" (user_login)
      on update restrict
      on delete restrict;

alter table Order_item
   add constraint FK_ORDER_IT_ITEMS_IN__ITEM foreign key (item_id)
      references Item (item_id)
      on update restrict
      on delete restrict;

alter table Order_item
   add constraint FK_ORDER_IT_ORDER_ITE_ORDER foreign key (order_id)
      references "Order" (order_id)
      on update restrict
      on delete restrict;

