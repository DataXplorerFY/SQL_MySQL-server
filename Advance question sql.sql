select * from users;
-- Retrieve the names and email addresses of users whose status is "active" and have a Gmail address.
SELECT name, email
FROM users
WHERE status = 'active' AND email LIKE '%@gmail.com';
-- Calculate the total count of users for each gender.
SELECT gender, COUNT(*) AS user_count
FROM users
GROUP BY gender;
-- Retrieve the names of users who were born in the year 1990 or later.
SELECT name
FROM users
WHERE YEAR(DOB) >= 1990;
-- Find the users whose names contain the substring "son" (case-insensitive).
SELECT name
FROM users
WHERE name LIKE '%son%';
-- Calculate the average length of names for users with a status of "active".
SELECT AVG(LEN(name)) AS average_name_length
FROM users
WHERE status = 'active';
-- Retrieve the email addresses of users whose names start with a vowel.
SELECT email
FROM users
WHERE name LIKE 'A%' OR name LIKE 'E%' OR name LIKE 'I%' OR name LIKE 'O%' OR name LIKE 'U%';
-- Count the number of distinct email domains present in the "email" column.
SELECT COUNT(DISTINCT SUBSTRING_INDEX(email, '@', -1)) AS distinct_domains_count
FROM users;
-- Retrieve the names and contact numbers of users with a contact number that does not contain any alphabetic characters.
SELECT name, contact
FROM users
WHERE contact REGEXP '^[0-9]+$';
-- Find the users whose names are longer than the average name length.
SELECT name
FROM users
WHERE LEN(name) > (SELECT AVG(LEN(name)) FROM users);
-- Calculate the difference in days between the current date and the date of birth for each user.
SELECT name, DATEDIFF(CURDATE(), DOB) AS age_in_days
FROM users;
-- Retrieve the names and email addresses of users whose names contain exactly three characters.
SELECT name, email FROM users WHERE LEN(name) = 3;
-- Calculate the percentage of male and female users among all users.
SELECT gender, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM users) AS percentage
FROM users
GROUP BY gender;
-- Find the users whose email addresses have a domain ending with ".net".
SELECT name, email
FROM users
WHERE email LIKE '%.net';
-- Retrieve the names of users whose passwords contain at least one uppercase letter and one lowercase letter.
SELECT name
FROM users
WHERE password REGEXP '[a-z]' AND password REGEXP '[A-Z]';
-- Calculate the average number of characters in email addresses for each gender.
SELECT gender, AVG(LEN(email)) AS average_email_length
FROM users
GROUP BY gender;
-- 


