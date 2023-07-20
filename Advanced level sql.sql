-- 1. Retrieve the names and emails of all users who have a 'gmail.com' domain in their email addresses.
SELECT name, email
FROM users
WHERE email LIKE '%@gmail.com';

-- 2. Calculate the total number of users for each gender along with their average age.
SELECT gender,
       COUNT(*) AS total_users,
       AVG(DATEDIFF(CURRENT_DATE, DOB) / 365.25) AS average_age
FROM users
GROUP BY gender;

-- 3. Find the users whose passwords are the same as their contact numbers.
SELECT name, email, contact
FROM users
WHERE password = contact;

-- 4. List the names and addresses of users whose status is set to '1' and have a specific domain in their email addresses.
SELECT name, address
FROM users
WHERE status = 1 AND email LIKE '%@example.com';

-- 5. Retrieve the users who have the same names and were born on the same date.
SELECT name, DOB, COUNT(*) AS occurrence
FROM users
GROUP BY name, DOB
HAVING COUNT(*) > 1;

-- 6. Find the number of active (status=1) female users in each city along with the percentage of the total active female users.
SELECT SUBSTRING_INDEX(address, ',', 1) AS city,
       COUNT(*) AS active_female_users,
       (COUNT(*) / (SELECT COUNT(*) FROM users WHERE status = 1 AND gender = 'F')) * 100 AS percentage
FROM users
WHERE status = 1 AND gender = 'F'
GROUP BY city;

-- 7. List the names of users who have not provided their contact numbers and have a status of '0'.
SELECT name
FROM users
WHERE contact IS NULL AND status = 0;

-- 8. Find the users with the top 5 most common birth years along with the number of users born in each year.
SELECT EXTRACT(YEAR FROM DOB) AS birth_year,
       COUNT(*) AS number_of_users
FROM users
GROUP BY birth_year
ORDER BY number_of_users DESC
LIMIT 5;

-- 9. Calculate the total number of users for each status (0 or 1) and their average age for each status.
SELECT status,
       COUNT(*) AS total_users,
       AVG(DATEDIFF(CURRENT_DATE, DOB) / 365.25) AS average_age
FROM users
GROUP BY status;

-- 10. Retrieve the names and emails of users with duplicate email addresses.
SELECT name, email
FROM users
WHERE email IN (
    SELECT email
    FROM users
    GROUP BY email
    HAVING COUNT(*) > 1
);

-- 11. Find the users who have the same contact numbers and list their names and contact numbers.
SELECT name, contact
FROM users
WHERE contact IN (
    SELECT contact
    FROM users
    GROUP BY contact
    HAVING COUNT(*) > 1
);

-- 12. Calculate the average age of male users and female users separately.
SELECT gender,
       AVG(DATEDIFF(CURRENT_DATE, DOB) / 365.25) AS average_age
FROM users
GROUP BY gender;

-- 13. List the names of users who have a password longer than their email address.
SELECT name
FROM users
WHERE CHAR_LENGTH(password) > CHAR_LENGTH(email);

-- 14. Find the names of users who have the same names as their city (assuming city names can be the same as names).
SELECT name
FROM users
WHERE name IN (SELECT city FROM users);

-- 15. Retrieve the names and emails of users whose names start with 'A' and have an odd-numbered ID.
SELECT name, email
FROM users
WHERE name LIKE 'A%' AND id % 2 = 1;

-- 16. Calculate the total number of male and female users in each city and order the results by the city name.
SELECT SUBSTRING_INDEX(address, ',', 1) AS city,
       gender,
       COUNT(*) AS total_users
FROM users
GROUP BY city, gender
ORDER BY city;

-- 17. List the names and emails of users who have provided an address and have the longest passwords.
SELECT name, email
FROM users
WHERE address IS NOT NULL
ORDER BY LENGTH(password) DESC
LIMIT 1;

-- 18. Find the users whose names are composed of two words and list their names and emails.
SELECT name, email
FROM users
WHERE name LIKE '% %';

-- 19. Retrieve the names and emails of users who were born in the current year.
SELECT name, email
FROM users
WHERE EXTRACT(YEAR FROM DOB) = EXTRACT(YEAR FROM CURRENT_DATE);

-- 20. Calculate the total number of users for each gender born after a specific date.
SELECT gender,
       COUNT(*) AS total_users
FROM users
WHERE DOB > '1990-01-01'
GROUP BY gender;

-- 21. List the names and emails of users who have not provided their email addresses and contact numbers.
SELECT name, email
FROM users
WHERE email IS NULL AND contact IS NULL;

-- 22. Find the users with the highest and lowest ages along with their names.
SELECT name, DATEDIFF(CURRENT_DATE, DOB) / 365.25 AS age
FROM users
ORDER BY age DESC
LIMIT 1
UNION ALL
SELECT name, DATEDIFF(CURRENT_DATE, DOB) / 365.25 AS age
FROM users
ORDER BY age
LIMIT 1;

-- 23. Calculate the number of users for each gender who were born in each year.
SELECT gender,
       EXTRACT(YEAR FROM DOB) AS birth_year,
       COUNT(*) AS total_users
FROM users
GROUP BY gender, birth_year;

-- 24. List the names and emails of users who have the same email domains.
SELECT name, email
FROM users
WHERE SUBSTRING_INDEX(email, '@', -1) IN (
    SELECT SUBSTRING_INDEX(email, '@', -1)
    FROM users
    GROUP BY SUBSTRING_INDEX(email, '@', -1)
    HAVING COUNT(*) > 1
);

-- 25. Retrieve the names of users who have not provided their addresses, emails, or contact numbers.
SELECT name
FROM users
WHERE address IS NULL AND email IS NULL AND contact IS NULL;

-- 26. Find the users whose email addresses are composed of the word 'security' and list their names and emails.
SELECT name, email
FROM users
WHERE email LIKE '%security%';

-- 27. Calculate the total number of users for each status (0 or 1) in each city.
SELECT SUBSTRING_INDEX(address, ',', 1) AS city,
       status,
       COUNT(*) AS total_users
FROM users
GROUP BY city, status;

-- 28. List the names and email addresses of users who have not provided their date of birth.
SELECT name, email
FROM users
WHERE DOB IS NULL;

-- 29. Find the users whose names have more vowels than consonants, and list their names and emails.
SELECT name, email
FROM users
WHERE LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'a', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'e', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'i', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'o', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'u', '')) >
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'b', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'c', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'd', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'f', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'g', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'h', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'j', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'k', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'l', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'm', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'n', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'p', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'q', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'r', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 's', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 't', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'v', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'w', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'x', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'y', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'z', ''));

-- 30. Retrieve the names and emails of users who were born in the current month.
SELECT name, email
FROM users
WHERE EXTRACT(MONTH FROM DOB) = EXTRACT(MONTH FROM CURRENT_DATE);

-- 31. Calculate the average length of passwords for each status (0 or 1).
SELECT status,
       AVG(CHAR_LENGTH(password)) AS average_password_length
FROM users
GROUP BY status;

-- 32. List the names and emails of users who have provided their contact numbers but not their email addresses.
SELECT name, email
FROM users
WHERE contact IS NOT NULL AND email IS NULL;

-- 33. Find the users whose names have more than one word and contain the letter 'a', and list their names and emails.
SELECT name, email
FROM users
WHERE name LIKE '%a%' AND name LIKE '% %';

-- 34. Retrieve the names and emails of users who were born in the previous year.
SELECT name, email
FROM users
WHERE EXTRACT(YEAR FROM DOB) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;

-- 35. Calculate the total number of users for each gender born in each year, and order the results by birth year in ascending order.
SELECT gender,
       EXTRACT(YEAR FROM DOB) AS birth_year,
       COUNT(*) AS total_users
FROM users
GROUP BY gender, birth_year
ORDER BY birth_year;

-- 36. List the names and emails of users who have provided their contact numbers but not their email addresses.
SELECT name, email
FROM users
WHERE contact IS NOT NULL AND email IS NULL;

-- 37. Retrieve the names and emails of users who were born in the previous year.
SELECT name, email
FROM users
WHERE EXTRACT(YEAR FROM DOB) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;

-- 38. Calculate the total number of users for each gender born in each year, and order the results by birth year in ascending order.
SELECT gender,
       EXTRACT(YEAR FROM DOB) AS birth_year,
       COUNT(*) AS total_users
FROM users
GROUP BY gender, birth_year
ORDER BY birth_year;

-- 39. List the names and emails of users who have provided their contact numbers but not their email addresses.
SELECT name, email
FROM users
WHERE contact IS NOT NULL AND email IS NULL;

-- 40. Find the users whose names have more than one word and contain the letter 'a', and list their names and emails.
SELECT name, email
FROM users
WHERE name LIKE '%a%' AND name LIKE '% %';

-- 41. Retrieve the names and emails of users who were born in the current month.
SELECT name, email
FROM users
WHERE EXTRACT(MONTH FROM DOB) = EXTRACT(MONTH FROM CURRENT_DATE);

-- 42. Calculate the average length of passwords for each status (0 or 1).
SELECT status,
       AVG(CHAR_LENGTH(password)) AS average_password_length
FROM users
GROUP BY status;

-- 43. List the names and emails of users who have not provided their date of birth.
SELECT name, email
FROM users
WHERE DOB IS NULL;

-- 44. Find the users whose names have more than one word and contain the letter 'a', and list their names and emails.
SELECT name, email
FROM users
WHERE name LIKE '%a%' AND name LIKE '% %';

-- 45. Retrieve the names and emails of users who were born in the current month.
SELECT name, email
FROM users
WHERE EXTRACT(MONTH FROM DOB) = EXTRACT(MONTH FROM CURRENT_DATE);

-- 46. Calculate the average length of passwords for each status (0 or 1).
SELECT status,
       AVG(CHAR_LENGTH(password)) AS average_password_length
FROM users
GROUP BY status;

-- 47. List the names and emails of users who have not provided their date of birth.
SELECT name, email
FROM users
WHERE DOB IS NULL;

-- 48. Find the users whose names have more than one word and contain the letter 'a', and list their names and emails.
SELECT name, email
FROM users
WHERE name LIKE '%a%' AND name LIKE '% %';

-- 49. Retrieve the names and emails of users who were born in the current month.
SELECT name, email
FROM users
WHERE EXTRACT(MONTH FROM DOB) = EXTRACT(MONTH FROM CURRENT_DATE);

-- 50. Calculate the total number of users for each gender born in each year, and display only the results with more than 5 users.
SELECT gender,
       EXTRACT(YEAR FROM DOB) AS birth_year,
       COUNT(*) AS total_users
FROM users
GROUP BY gender, birth_year
HAVING COUNT(*) > 5;
