CREATE TABLE users
( 
id int unsigned,
name varchar(100),
email varchar(150),
password varchar(100),
contact varchar(15),
address text,
DOB date,
gender enum("M", "F", "O"),
status boolean
)

