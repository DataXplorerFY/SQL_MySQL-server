select * from users;
-- Retrieve the names of users whose addresses contain the word "Street".
SELECT name
FROM users
WHERE address LIKE '%UK%';
-- select address from users;
-- Calculate the total number of users born in each month.
SELECT MONTH(DOB) AS birth_month, COUNT(*) AS user_count
FROM users
GROUP BY birth_month;
-- Find the users whose passwords are longer than the average password length.
SELECT name
FROM users
WHERE LEN(password) > (SELECT AVG(LEN(password)) FROM users);
-- Retrieve the names and email addresses of users whose status is either "active" or "pending" and have a Gmail address.
SELECT name, email
FROM users
WHERE status IN ('active', 'pending') AND email LIKE '%@gmail.com';
-- Calculate the age distribution of users, grouping them into different age ranges.
SELECT 
  CASE
    WHEN DATEDIFF(CURDATE(), DOB) BETWEEN 0 AND 18 THEN '0-18'
    WHEN DATEDIFF(CURDATE(), DOB) BETWEEN 19 AND 30 THEN '19-30'
    WHEN DATEDIFF(CURDATE(), DOB) BETWEEN 31 AND 45 THEN '31-45'
    ELSE '45+'
  END AS age_range,
  COUNT(*) AS user_count
FROM users
GROUP BY age_range;
/* 1. Q: Retrieve the names and email addresses of users whose status is "active" and have a Gmail address.
   A: */
SELECT name, email
FROM users
WHERE status = 'active' AND email LIKE '%@gmail.com';

/* 2. Q: Calculate the total count of users for each gender.
   A: */
SELECT gender, COUNT(*) AS user_count
FROM users
GROUP BY gender;

/* 3. Q: Retrieve the names of users who were born in the year 1990 or later.
   A: */
SELECT name
FROM users
WHERE YEAR(DOB) >= 1990;

/* 4. Q: Find the users whose names contain the substring "son" (case-insensitive).
   A: */
SELECT name
FROM users
WHERE name LIKE '%son%';

/* 5. Q: Calculate the average length of names for users with a status of "active".
   A: */
SELECT AVG(LEN(name)) AS average_name_length
FROM users
WHERE status = 'active';

/* 6. Q: Retrieve the email addresses of users whose names start with a vowel.
   A: */
SELECT email
FROM users
WHERE name LIKE 'A%' OR name LIKE 'E%' OR name LIKE 'I%' OR name LIKE 'O%' OR name LIKE 'U%';

/* 7. Q: Count the number of distinct email domains present in the "email" column.
   A: */
SELECT COUNT(DISTINCT SUBSTRING_INDEX(email, '@', -1)) AS distinct_domains_count
FROM users;

/* 8. Q: Retrieve the names and contact numbers of users with a contact number that does not contain any alphabetic characters.
   A: */
SELECT name, contact
FROM users
WHERE contact REGEXP '^[0-9]+$';

/* 9. Q: Find the users whose names are longer than the average name length.
   A: */
SELECT name
FROM users
WHERE LEN(name) > (SELECT AVG(LEN(name)) FROM users);

/* 10. Q: Calculate the difference in days between the current date and the date of birth for each user.
    A: */
SELECT name, DATEDIFF(CURDATE(), DOB) AS age_in_days
FROM users;
