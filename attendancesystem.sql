DROP DATABASE IF EXISTS AttendanceSystem;
CREATE DATABASE AttendanceSystem;
USE AttendanceSystem;


CREATE TABLE user_list(
user_id int PRIMARY KEY AUTO_INCREMENT,
user_fname varchar(20) NOT NULL,
user_mname varchar(20),
user_lname varchar(20) NOT NULL,
user_age int,
user_dob date NOT NULL,
user_gender varchar(6) NOT NULL,
user_street varchar(40) NOT NULL,
user_district varchar(20) NOT NULL,
user_state varchar(20) NOT NULL,
user_country varchar(30) NOT NULL,
user_email varchar(50) UNIQUE,
is_student BOOL NOT NULL
);

CREATE TABLE course(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(40) NOT NULL,
course_desc TEXT NOT NULL,
course_credithr FLOAT NOT NULL
);

CREATE TABLE user_course(
uc_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
course_id INT,
FOREIGN KEY (user_id) REFERENCES user_list(user_id),
FOREIGN KEY(course_id) REFERENCES course(course_id)
);

CREATE TABLE user_phnumber(
up_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
FOREIGN KEY (user_id) REFERENCES user_list(user_id),
up_number VARCHAR(13)
);

CREATE TABLE user_attendance(
ua_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
course_id INT,
FOREIGN KEY (user_id) REFERENCES user_list(user_id),
FOREIGN KEY(course_id) REFERENCES course(course_id),
ua_datetime datetime
);

CREATE TABLE static_data(
static_id INT PRIMARY KEY AUTO_INCREMENT,
data_type VARCHAR(255) NOT NULL,
data_desc VARCHAR(30),
data_value INT NOT NULL
);

SHOW TABLES;


-- we start stored proc-- 

-- it takes 12 input parameters --
DELIMITER //
CREATE PROCEDURE sp_insert_user_list(
IN _user_fname varchar(20),
IN _user_mname varchar(20),
IN _user_lname varchar(20),
IN _user_age int,
IN _user_dob date,
IN _user_gender varchar(6),
IN _user_street varchar(40),
IN _user_district varchar(20),
IN _user_state varchar(20),
IN _user_country varchar(30),
IN _user_email varchar(50),
IN _is_student BOOL)
BEGIN
INSERT INTO user_list(user_fname,user_mname,user_lname,user_age,user_dob,user_gender,user_street,user_district, user_state,user_country,user_email,is_student) 
VALUE (_user_fname,_user_mname,_user_lname,
_user_age,_user_dob,_user_gender,
_user_street,_user_district,_user_state,
_user_country,_user_email,_is_student);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_insert_course(
in _course_id int,
in _course_name varchar(20),
in _course_desc varchar(20),
in _course_credithr varchar(20))
BEGIN
INSERT INTO course(course_id, course_name, course_desc, course_credithr)
VALUE (_course_id, _course_name, _course_desc, _course_credithr);
END //  
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_user_attendance(
IN _ua_id int,
IN _user_id int,
IN _course_id int,
IN _ua_datetime datetime
)
BEGIN
INSERT INTO user_attendance(ua_id, user_id, course_id, ua_datetime)
VALUE(_ua_id, _user_id, _course_id, _ua_datetime);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_user_course(
IN _uc_id int, 
IN _user_id int,
IN _course_id int)
BEGIN
INSERT INTO user_course(uc_id, user_id, course_id)
VALUE(_uc_id, _user_id, _course_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_user_phnumber(
IN _up_id int,
IN _user_id int,
IN _up_number varchar(13)
)
BEGIN
INSERT INTO user_phnumber(up_id, user_id, up_number)
VALUE(_up_id, _user_id, _up_number);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_static_data(
IN _data_type VARCHAR(255),
IN _data_desc VARCHAR(30),
IN _data_value INT)
BEGIN
INSERT INTO static_data(data_type,data_desc,data_value)
VALUE (_data_type,_data_desc,_data_value);
END // 
DELIMITER ;

show tables

-- STORED PROCEDURE TO SELECT 

DELIMITER //
CREATE PROCEDURE sp_select_user_list()
BEGIN
SELECT * FROM user_list;
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE sp_select_course()
BEGIN
SELECT * FROM course;
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE sp_select_user_course()
BEGIN
SELECT * FROM user_course;
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE sp_select_user_attendance()
BEGIN
SELECT * FROM user_attendance;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_select_user_phnumber()
BEGIN
SELECT * FROM user_phnumber;
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE sp_select_static_data()
BEGIN
SELECT * FROM user_static_data;
END //
DELIMITER ;

call sp_select_user_phnumber();

show tables
