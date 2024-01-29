-- database is used for account logins and synchronizing
-- calculating and all data should also be saved locally
create database se_accounting;

-- sys user: id=1, name=system, this user is never used to login
create table se_user(
    id int IDENTITY PRIMARY KEY,
    username NVARCHAR(75) not null,
    photo varchar(128),
    wechat_login varchar(128) UNIQUE, -- not sure what to use about wechat
    password varchar(256) not null,
    password_vaule varchar(10) not null,
    email VARCHAR(50) UNIQUE,
    phone_number varchar(20) UNIQUE,
    create_dt DATETIME not null,
    update_dt DATETIME not NULL, -- profile update date
    update_dt_cb DATETIME not null, -- category&budget update date
)

-- default category's userId will be 1, 
-- each time a new user create account, clone the default category tree for him
-- when a user login successfully, sync category and budget config up/down, depending on update_dt_cat
create table category(
    id int IDENTITY PRIMARY KEY,
    cat_parent int REFERENCES category,
    cat_path varchar(35),
    user_id int not null REFERENCES se_user,
    name NVARCHAR(50) not null,
    icon varchar(128)
)
create table budget(
    id int IDENTITY primary key,
    cat_id int not null REFERENCES category,
    money int not null,
    period int not null,
    start_dt DATETIME not NULL,
    carry_over_flg BIT not null DEFAULT 0,
    fix_flg bit not null DEFAULT 0,
    auto_reuse_flg bit not null DEFAULT 1
)

-- accounting data, 
create table accounting(
    uuid varchar(32) not null,
    user_id int not null REFERENCES se_user,
    money FLOAT not null,
    cat_name NVARCHAR(50) not null, -- should use category name, when a category is deleted, this record should still be able to be located
    update_dt DATETIME not null -- create/update time
)