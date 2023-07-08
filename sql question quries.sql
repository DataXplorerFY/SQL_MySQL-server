-- Q1 Retrieve the names and email addresses of all users.
select name, email from users;
-- Q2 Retrieve the total count of users.
select count(*) from users;
-- Retrieve the details of users whose status is active.
select * from users where status = "1";
-- Retrieve the names of users born after 1990-01-01.
select * from users where DOB > "1990-01-01";
-- Retrieve the names and addresses of female users.
select name, address from users where  Gender ="F";
-- Retrieve the names and contact numbers of users from a specific city.
select name, contact from users where address like "%Toronto%";
-- Retrieve the names of users with a specific email domain.
select name, id from users where email like "%@example.com%";
-- etrieve the names of users whose names start with a specific letter
select name from users where name like "A%";
-- Retrieve the names of users in alphabetical order.
select name from users order by name asc;
-- Retrieve the names and birth dates of users sorted by birth date in descending order.
select name, DOB from users order by DOB  desc;
-- Retrieve the names and genders of users whose names contain a specific substring.
SELECT Name, Gender FROM users WHERE Name LIKE '%Farhan%';
-- Retrieve the average age of all users
SELECT AVG(YEAR(CURDATE()) - YEAR(DOB)) FROM users;
-- Retrieve the names and passwords of users whose passwords contain at least 8 characters.
SELECT Name, Password FROM users WHERE LENGTH(Password) >= 8;
-- Retrieve the names and contact numbers of users whose contact numbers start with a specific digit.
select name, contact from users where contact like  "123%";
-- Retrieve the names and email addresses of users with a specific status and gender.
SELECT Name, Email FROM users WHERE Status = '1' AND Gender = 'M';
-- Retrieve the names of users with duplicate email addresses.
SELECT Name FROM users GROUP BY Email HAVING COUNT(*) > 1;
-- Retrieve the names and addresses of users whose addresses contain a specific substring.
SELECT Name, Address FROM users WHERE Address LIKE '%toronto%';
-- Retrieve the names and email addresses of users with a specific status or gender.
select name, email from users where status="1" or gender ="F";
-- Retrieve the names and email addresses of users who were born in a specific year.
SELECT Name, Email FROM users WHERE YEAR(DOB) = '2000';
-- Retrieve the names and email addresses of users whose names have more than one word.
SELECT Name, Email FROM users WHERE Name LIKE '% %';
-- Retrieve the names and addresses of users who have a specific status or were born after a specific date.
select name, address from users WHERE Status = '1' OR DOB > '1999-11-25';
-- Retrieve the names and email addresses of users who have both a specific status and were born before a specific date.
select Name, Email FROM users WHERE Status = '1' AND DOB < '1999-11-25';
-- Retrieve the names and contact numbers of users whose names end with a specific letter.
SELECT Name, Contact FROM users WHERE Name LIKE '%n';
-- Retrieve the names and email addresses of users who have a specific status and were born in a specific month.
SELECT Name, Email FROM users WHERE Status = '1' AND MONTH(DOB) = '09';
-- Retrieve the names and email addresses of users whose email addresses are not in a specific domain.
select email, name from users where email not like '%@example.com';






