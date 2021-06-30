SELECT RIGHT(a.website, 3) AS web_extension, COUNT(*) FROM accounts a GROUP BY 1 ORDER BY 2 DESC;

SELECT LEFT(a.name, 1) AS name_initial, COUNT(*) FROM accounts a GROUP BY 1 ORDER BY 2 DESC;

SELECT 
        CASE WHEN LEFT(a.name,1) IN('0','1','2','3','4','5','6','7','8','9') THEN 'Numeric_Companies'
             ELSE 'Alphabetical_Companies' END AS company_type,
        COUNT(*)     
FROM accounts a 
GROUP BY 1;             

SELECT 
        CASE WHEN LEFT(UPPER(a.name),1) IN ('A','E','I','O','U') THEN 'Vowel_Companies'
             ELSE 'Others' END AS company_type,
        COUNT(*)     
FROM accounts a 
GROUP BY 1;          

SELECT 
        CASE WHEN LEFT(LOWER(a.name),1) IN ('a','e','i','o','u') THEN 'Vowel_Companies'
             ELSE 'Others' END AS company_type,
        COUNT(*)     
FROM accounts a 
GROUP BY 1;
/*Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.*/
SELECT LEFT(a.primary_poc, POSITION(' ' IN a.primary_poc)-1) AS first_name, RIGHT(a.primary_poc, LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)) AS last_name,
a.primary_poc as full_name FROM accounts a;
/*Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.*/
SELECT LEFT(s.name, POSITION(' ' IN s.name)-1) AS first_name, RIGHT(s.name, LENGTH(s.name)-POSITION(' ' IN s.name)) AS last_name,
s.name as full_name FROM sales_reps s;
/*
Each company in the accounts table wants to create an email address for each primary_poc. 
The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
*/
SELECT 
        a.primary_poc, CONCAT(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1),'.',RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),
        '@',RIGHT(a.website,LENGTH(a.website)-POSITION('.' IN a.website))) AS poc_email_address 
FROM accounts a;        
/*
We would also like to create an initial password, which they will change after their first log in. The first password will be the first letter of the 
primary_poc's first name (lowercase), then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last 
letter of their last name (lowercase), the number of letters in their first name, the number of letters in their last name, and then the name of the 
company they are working with, all capitalized with no spaces.        
*/        
SELECT 
        a.primary_poc, 
        CONCAT(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1),'.',
               RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),
                '@',
               RIGHT(a.website,LENGTH(a.website)-POSITION('.' IN a.website))) AS poc_email_address,
        CONCAT(LEFT(LOWER(a.primary_poc),1),
               RIGHT(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1),1),
               LEFT(RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),1),
               RIGHT(RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),1),
               LENGTH(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1)),
               LENGTH(RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc))),
               LEFT(SUBSTRING(UPPER(a.website),POSITION('.' IN a.website)+1),LENGTH(SUBSTRING(UPPER(a.website),POSITION('.' IN a.website)+1)) - 4))
FROM accounts a;

SELECT 
        a.primary_poc, 
        CONCAT(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1),'.',
               RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),
                '@',
               RIGHT(a.website,LENGTH(a.website)-POSITION('.' IN a.website))) AS poc_email_address,
        CONCAT(LEFT(LOWER(a.primary_poc),1),
               RIGHT(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1),1),
               LEFT(RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),1),
               RIGHT(RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc)),1),
               LENGTH(LEFT(LOWER(a.primary_poc), POSITION(' ' IN a.primary_poc)-1)),
               LENGTH(RIGHT(LOWER(a.primary_poc), LENGTH(a.primary_poc)-POSITION(' ' IN a.primary_poc))),
               REPLACE(UPPER(a.name), ' ',''))
FROM accounts a;





