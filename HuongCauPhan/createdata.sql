--
-- create database genealogy_management;

-- USE genealogy_management;

-- Table Account
CREATE TABLE account(
	id bigint PRIMARY KEY AUTO_INCREMENT,
	account_name varchar(50),
    password varchar(20) NOT NULL,
    role int NOT NULL,
    status int not NULL
);

insert into account(account_name,password,role,status) values ('admin1','12345',1,0),
('admin','12345',1,1),
('member','12345',1,1),
('systemadmin','123456',2,1);

-- Table Parentage
CREATE TABLE parentage(
	parentage_id bigint PRIMARY KEY AUTO_INCREMENT,
    parentage_name varchar(255) ,
    head_of_parentage_name varchar(255) ,
    address varchar(255) ,
    cultural_spring_day date,
    cultural_autumn_day date,
    head_of_parentage_number varchar(11),
    head_of_parentage_email varchar(50),
    ancestor text,
    history_of_parentage text,
    account_id bigint,

    FOREIGN KEY (account_id) REFERENCES account(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

insert into parentage(parentage_name,head_of_parentage_name,address
,cultural_spring_day, cultural_autumn_day, head_of_parentage_number,
head_of_parentage_email, ancestor,
history_of_parentage,
account_id) values
('Jaime','Jame Lannister','London','1300-6-4','1300/10/14', '0965930913','phamvanhieu300198@gmail.com'
,'Twin Lannister','once upon ago',2);

-- Table Individual
CREATE TABLE individual(
	individual_id bigint PRIMARY KEY AUTO_INCREMENT,
    fullname varchar(100) ,
    gender bit,
    date_of_birth date,
    date_of_death date,
    father int,
    branch varchar(255),
    parentage_id bigint,
    avatar text,
    FOREIGN KEY (parentage_id) REFERENCES parentage(parentage_id)
    ON DELETE CASCADE  ON UPDATE CASCADE
);

insert into individual(fullname,gender,date_of_birth,date_of_death
,father,branch,parentage_id,avatar) values
('Tywin Lannister',1,'1985-6-5','1985-6-5',0,'1',1,''),
('Sersei Lannister',0,'1985-6-5','1985-6-5',1,'1.1',1,''),
('Jaime Lannister',1,'1985-6-5','1985-6-5',1,'1.2',1,''),
('Tyrion Lannister',1,'1985-6-5','1985-6-5',3,'1.2.1',1,''),
('Samwell Lannister',1,'1985-6-5','1985-6-5',3,'1.2.2',1,''),
('Stannis Lannister',1,'1985-6-5','1985-6-5',4,'1.2.3',1,'');


-- Table Image
CREATE TABLE image(
	id bigint primary key auto_increment,
    image_name varchar(255),
    url varchar(255),
    parentage_id bigint ,
    FOREIGN KEY (parentage_id) REFERENCES parentage(parentage_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE news(
	id bigint PRIMARY KEY AUTO_INCREMENT,
	content text,
    parentage_id bigint NOT NULL,
    create_date date,
    views bigint,
    title varchar(255),
    FOREIGN KEY (parentage_id) REFERENCES parentage(parentage_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);