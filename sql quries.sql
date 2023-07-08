-- Retrieve the names and email addresses of users whose email addresses are not in a specific domain.
SELECT Name, Email FROM users WHERE Email NOT LIKE '%@gmail.com';
-- Retrieve the names and email addresses of users who have a specific status and whose email addresses are in a specific domain.
select name, email from users  WHERE Status = '1' AND Email LIKE '%@example.com';
-- Retrieve the names and email addresses of users who have a specific status and whose names do not contain a specific substring.
SELECT Name, Email FROM users WHERE Status = '1' AND Name NOT LIKE '%Farhan%';
-- Retrieve the names and email addresses of users who have a specific status and whose contact numbers are not null.
select name, email from users where status = "1" and contact is not null;
-- Retrieve the names and email addresses of users who have a specific status and whose contact numbers are null.
select name email from users where status = "0" and contact is null; 
-- Retrieve the names and email addresses of users who have a specific status and whose email addresses are null.
select name, email from users where status ="1" and email is null;
-- Retrieve the names and email addresses of users who have a specific status and whose names are not null.
SELECT Name, Email FROM users WHERE Status = '1' AND Name IS NOT NULL;
-- Retrieve the names and email addresses of users who have a specific status and whose email addresses start with a specific letter.
select name, email from users where status ="0" and email LIKE 'a%';
-- Retrieve the names and email addresses of users who have a specific status and whose email addresses end with a specific letter.
select name, email from users where status ="0" and email LIKE '%a';
-- Retrieve the names and email addresses of users who have a specific status and whose names are not empty.
SELECT Name, Email FROM users WHERE Status = '1' AND Name != '';
-- Retrieve the names and email addresses of users who have a specific status and whose names are empty.
SELECT Name, Email FROM users WHERE Status = '1' AND Name = '';
-- Retrieve the names and email addresses of users who have a specific status and whose contact numbers are not empty.
SELECT Name, Email FROM users WHERE Status = '1' AND Contact != '';
-- Retrieve the names and email addresses of users who have a specific status and whose contact numbers are empty.
SELECT Name, Email FROM users WHERE Status = '1' AND Contact = '';
-- Retrieve the names and email addresses of users who have a specific status and whose email addresses are empty.
SELECT Name, Email FROM users WHERE Status = '1' AND Email = '';


