-- Retrieve all the distinct genders present in the table.
SELECT DISTINCT gender FROM users;
-- Count the number of users whose status is "active".
SELECT COUNT(*) AS active_users
FROM users
WHERE status = 'active';
-- Retrieve the names and email addresses of users whose contact numbers start with "+1".
SELECT name, email FROM users WHERE contact LIKE '+1%';
-- Calculate the average age of male users.
SELECT AVG(DATEDIFF(YEAR, DOB, GETDATE())) AS average_age
FROM users
WHERE gender = 'male';
-- Find the users whose passwords contain at least one digit.
SELECT name FROM users WHERE password LIKE '%[0-9]%';
-- Retrieve the oldest and the youngest user's date of birth.
SELECT MIN(DOB) AS oldest_dob, MAX(DOB) AS youngest_dob
FROM users;
-- List the users whose names start with the letter "A" and have a Gmail address.
SELECT name, email
FROM users
WHERE name LIKE 'A%' AND email LIKE '%ali@gmail.com';
-- Count the number of users for each status value.
SELECT status, COUNT(*) AS user_count
FROM users
GROUP BY status;
-- Retrieve the names and addresses of users whose status is "active" or "pending".
SELECT name, address
FROM users
WHERE status IN ('active', 'pending');
-- Calculate the average length of passwords for female users.
SELECT AVG(LEN(Password)) AS average_length
FROM users
WHERE gender = 'M';
select * from users;

-- 




