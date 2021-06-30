/*Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. 
Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z)
according to account name.*/

SELECT r.name AS region, s.name AS sales_rep_name, a.name AS account FROM sales_reps s INNER JOIN  region r ON s.region_id = r.id INNER JOIN
accounts a ON s.id = a.sales_rep_id WHERE r.name = 'Midwest' ORDER BY 3; /*48*/  

/*Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a 
first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.*/

SELECT r.name AS region, s.name AS sales_rep_name, a.name AS account FROM sales_reps s INNER JOIN  region r ON s.region_id = r.id INNER JOIN
accounts a ON s.id = a.sales_rep_id WHERE r.name = 'Midwest' AND s.name LIKE 'S%' ORDER BY 3; /*5*/  

/*Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a 
last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name.
 Sort the accounts alphabetically (A-Z) according to account name.*/

SELECT r.name AS region, s.name AS sales_rep_name, a.name AS account FROM sales_reps s INNER JOIN  region r ON s.region_id = r.id INNER JOIN
accounts a ON s.id = a.sales_rep_id WHERE r.name = 'Midwest' AND s.name LIKE '% K%' ORDER BY 3; /*13*/

/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, 
and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).*/

SELECT r.name AS region,  a.name AS account, (o.total_amt_usd/(o.total+0.01)) AS unit_price FROM orders o INNER JOIN accounts a ON o.account_id = a.id
INNER JOIN sales_reps s ON a.sales_rep_id = s.id INNER JOIN region r ON s.region_id = r.id WHERE o.standard_qty > 100;/*4509*/
/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. 
Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by 
zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).*/

SELECT r.name AS region,  a.name AS account, (o.total_amt_usd/(o.total+0.01)) AS unit_price FROM orders o INNER JOIN  accounts a ON o.account_id = a.id 
INNER JOIN sales_reps s ON a.sales_rep_id = s.id INNER JOIN region r ON s.region_id = r.id WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY 3;

/*Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table 
should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, 
adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).*/

SELECT r.name AS region,  a.name AS account, (o.total_amt_usd/(o.total+0.01)) AS unit_price FROM orders o INNER JOIN  accounts a ON o.account_id = a.id 
INNER JOIN sales_reps s ON a.sales_rep_id = s.id INNER JOIN region r ON s.region_id = r.id WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY 3 DESC;

/*
What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. 
You can try SELECT DISTINCT to narrow down the results to only the unique values.*/

SELECT DISTINCT w.channel AS channel, a.name AS account_name FROM accounts a INNER JOIN web_events w ON a.id = w.account_id
WHERE a.id = 1001;/**/

/*Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.*/

SELECT o.occurred_at AS order_time, a.name AS account_name, o.total AS order_total, o.total_amt_usd AS total_amt_usd
FROM orders o INNER JOIN accounts a ON o.account_id = a.id WHERE YEAR(o.occurred_at) = 2015;/*1725*/

SELECT SUM(o.poster_qty) FROM orders o;/*723646*/

SELECT SUM(o.standard_qty) FROM orders o;/*1938346*/

SELECT SUM(o.total_amt_usd) FROM orders o;/*23141511.83*/

SELECT o.id AS order_id, (o.standard_amt_usd + o.gloss_amt_usd) AS total_amt_usd_for_std_and_gloss FROM orders o;

SELECT SUM(o.standard_amt_usd)/SUM(o.standard_qty) AS standard_unit_price FROM orders o;/*4.99*/

SELECT MIN(occurred_at) AS earliest_order_time FROM orders o;

SELECT occurred_at AS earliest_order_time FROM orders o ORDER BY occurred_at LIMIT 1;

SELECT MAX(w.occurred_at) AS latest_event_time FROM web_events w;

SELECT w.occurred_at AS latest_event_time FROM web_events w ORDER BY 1 DESC LIMIT 1;

/*Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order.
Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.*/

SELECT AVG(standard_amt_usd), AVG(gloss_amt_usd), AVG(poster_amt_usd), AVG(standard_qty), AVG(gloss_qty), AVG(poster_qty) FROM orders o;

SELECT AVG(b.total_amt_usd) FROM (SELECT z.total_amt_usd FROM (SELECT ord.total_amt_usd FROM orders ord ORDER BY ord.total_amt_usd LIMIT 3457)z ORDER BY 1 DESC LIMIT 2)b;
/*Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order*/
SELECT a.name AS account, o.occurred_at AS earliest_order_time FROM orders o JOIN accounts a ON o.account_id = a.id ORDER BY 2 LIMIT 1;
/*Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.*/
SELECT a.name AS company, SUM(o.total_amt_usd) AS total_sales FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY 1;
/*
Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? 
Your query should return only three values - the date, channel, and account name.*/
SELECT w.channel AS channel, DATE(w.occurred_at) AS latest_event_date, a.name FROM accounts a JOIN web_events w ON a.id = w.account_id
ORDER BY 2 DESC LIMIT 1;
/*Find the total number of times each type of channel from the web_events was used. 
Your final table should have two columns - the channel and the number of times the channel was used.
*/
SELECT w.channel AS channel, COUNT(*) AS frequency FROM web_events w GROUP BY 1;
/*Who was the primary contact associated with the earliest web_event?*/
SELECT w.occurred_at AS earliest_event_date, a.primary_poc AS primary_contact FROM web_events w JOIN accounts a ON w.account_id = a.id
ORDER BY 1 LIMIT 1;
/*
What was the smallest order placed by each account in terms of total usd.
Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
*/
SELECT a.name AS account, o.total_amt_usd AS total_order_amount FROM accounts a JOIN orders o ON a.id = o.account_id ORDER BY 2;
/*Find the number of sales reps in each region. 
Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
*/
SELECT r.name, COUNT(s.id) FROM region r JOIN sales_reps s ON r.id = s.region_id  GROUP BY 1 ORDER BY 2;

/*For each account, determine the average amount of each type of paper they purchased across their orders. 
Your result should have four columns - one for the account name and one for the average quantity purchased 
for each of the paper types for each account.*/

SELECT a.name AS account, AVG(o.standard_qty), AVG(o.gloss_qty), AVG(o.poster_qty) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY 1;

SELECT a.name AS account, AVG(o.standard_amt_usd), AVG(o.gloss_amt_usd), AVG(o.poster_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id 
GROUP BY 1;


/*Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - 
the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.*/

SELECT w.channel AS channel, s.name AS sales_rep_name, COUNT(w.id) AS frequency FROM web_events w JOIN accounts a 
ON w.account_id = a.id JOIN sales_reps s ON a.sales_rep_id = s.id GROUP BY 1,2 ORDER BY 3 DESC;
/*
Determine the number of times a particular channel was used in the web_events table for each region. 
Your final table should have three columns - the region name, the channel, and the number of occurrences.
 Order your table with the highest number of occurrences first.*/

SELECT w.channel AS channel, r.name AS region, COUNT(w.id) AS frequency FROM web_events w JOIN accounts a 
ON w.account_id = a.id JOIN sales_reps s ON a.sales_rep_id = s.id JOIN region r ON s.region_id = r.id 
GROUP BY 1,2 ORDER BY 3 DESC;

SELECT DISTINCT a.name AS account, r.name AS region FROM accounts a JOIN sales_reps s ON a.sales_rep_id = s.id
JOIN region r ON s.region_id = r.id;


SELECT s.name AS sales_rep, COUNT(a.id) AS freq  FROM accounts a JOIN sales_reps s ON a.sales_rep_id = s.id GROUP BY 1;

SELECT COUNT(*) FROM (SELECT s.name, COUNT(a.id) AS acct_freq FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id GROUP BY 1 HAVING COUNT(a.id) > 5)z;/*34*/
SELECT COUNT(*) FROM (SELECT a.name, COUNT(o.id) AS order_freq FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 HAVING COUNT(o.id) > 20)z;/*120*/
SELECT a.name, COUNT(o.id) AS order_freq FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 ORDER BY 2 DESC LIMIT 1;/*Leucadia National*/
SELECT a.name, sum(o.total_amt_usd) AS total_spending FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 HAVING SUM(o.total_amt_usd) > 30000;/*204*/
SELECT a.name, sum(o.total_amt_usd) AS total_spending FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 HAVING SUM(o.total_amt_usd) < 1000;/*3*/
SELECT a.name, sum(o.total_amt_usd) AS total_spending FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 ORDER BY 2 DESC LIMIT 1;/*EOG Resources*/
SELECT a.name, sum(o.total_amt_usd) AS total_spending FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 ORDER BY 2 LIMIT 1;/*Nike*/

SELECT a.name, COUNT(w.id) AS contact_freq FROM web_events w JOIN accounts a ON w.account_id = a.id 
WHERE w.channel = 'facebook' GROUP BY 1 HAVING COUNT(w.id) > 6;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;


SELECT a.name, COUNT(w.id) AS contact_freq FROM web_events w JOIN accounts a ON w.account_id = a.id 
WHERE w.channel = 'facebook' GROUP BY 1 ORDER BY 2 DESC LIMIT 1;


SELECT w.channel, COUNT(w.id) AS contact_freq FROM web_events w JOIN accounts a ON w.account_id = a.id 
GROUP BY 1 ORDER BY 2 DESC LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;


/*Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?*/

SELECT YEAR(o.occurred_at) AS year_of_sale, SUM(o.total_amt_usd) FROM orders o GROUP BY 1 ORDER BY 2 DESC;

SELECT DATE_TRUNC('year', o.occurred_at) AS year_of_sale, SUM(o.total_amt_usd) FROM orders o GROUP BY 1 ORDER BY 2 DESC;

/*Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?*/
SELECT MONTH(o.occurred_at) AS month_of_sale, SUM(o.total_amt_usd) FROM orders o GROUP BY 1 ORDER BY 2 DESC;

SELECT DATE_TRUNC('month', o.occurred_at) AS month_of_sale, SUM(o.total_amt_usd) FROM orders o GROUP BY 1 ORDER BY 2 DESC;

/*Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?*/
SELECT YEAR(o.occurred_at) AS year_of_sale, COUNT(o.id) AS order_count FROM orders o GROUP BY 1 ORDER BY 2 DESC;
SELECT DATE_TRUNC('year', o.occurred_at) AS year_of_sale, COUNT(o.id) AS order_count FROM orders o GROUP BY 1 ORDER BY 2 DESC;

/*Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?*/
SELECT MONTH(o.occurred_at) AS month_of_sale, COUNT(o.id) AS order_count FROM orders o GROUP BY 1 ORDER BY 2 DESC;
SELECT DATE_TRUNC('month', o.occurred_at) AS month_of_sale, COUNT(o.id) AS order_count FROM orders o GROUP BY 1 ORDER BY 2 DESC;

/*In which month of which year did Walmart spend the most on gloss paper in terms of dollars?*/
SELECT MONTH(o.occurred_at) AS month_of_sale, SUM(gloss_amt_usd) AS total_spent_on_gloss_qty  FROM orders o
JOIN accounts a ON o.account_id = a.id WHERE a.name = 'Walmart' GROUP BY 1 ORDER BY 2 DESC;

SELECT DATE_TRUNC('month', o.occurred_at) AS month_of_sale, SUM(gloss_amt_usd) AS total_spent_on_gloss_qty FROM orders o
JOIN accounts a ON o.account_id = a.id WHERE a.name = 'Walmart' GROUP BY 1 ORDER BY 2 DESC;

/*
Write a query to display for each order, the account ID, total amount of the order, and the level of the order - ‘Large’ or ’Small’ - 
depending on if the order is $3000 or more, or smaller than $3000.*/

SELECT o.account_id, o.total_amt_usd, CASE WHEN o.total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END AS order_level FROM orders o;

/*
Write a query to display the number of orders in each of three categories, based on the total number of items in each order. 
The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.  */
SELECT CASE WHEN o.total >= 2000 THEN 'At Least 2000' WHEN o.total >= 1000 AND o.total < 2000 THEN 'Between 1000 and 2000' 
ELSE 'Less than 1000' END AS order_category, COUNT(*) AS order_count FROM orders o GROUP BY 1;

/*We would like to understand 3 different levels of customers based on the amount associated with their purchases. 
The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. 
The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. 
Provide a table that includes the level associated with each account.
You should provide the account name, the total sales of all orders for the customer, and the level. 
Order with the top spending customers listed first.*/
SELECT a.name, SUM(o.total_amt_usd) AS total_sales, CASE 
                                                          WHEN SUM(o.total_amt_usd) > 200000 THEN 'TOP_LEVEL'
                                                          WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) < 200000 THEN 'SECOND_LEVEL'
                                                          ELSE 'LOWEST_LEVEL' END AS customer_level
                                                          FROM orders o JOIN accounts a ON o.account_id = a.id GROUP BY 1 ORDER BY 2 DESC;


/*We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017.
Keep the same levels as in the previous question. Order with the top spending customers listed first.                                                          
*/                                                          

SELECT a.name, SUM(o.total_amt_usd) AS total_sales, CASE 
                                                          WHEN SUM(o.total_amt_usd) > 200000 THEN 'TOP_LEVEL'
                                                          WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) < 200000 THEN 'SECOND_LEVEL'
                                                          ELSE 'LOWEST_LEVEL' END AS customer_level
                                                          FROM orders o JOIN accounts a ON o.account_id = a.id 
                                                          WHERE YEAR(o.occurred_at) IN (2016,2017) GROUP BY 1 ORDER BY 2 DESC;

                                                          
/*We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. 
Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. 
Place the top sales people first in your final table.                                                          
*/

SELECT s.name AS sales_rep_name, COUNT(o.id) AS order_count, CASE WHEN COUNT(o.id) > 200 THEN 'TOP' ELSE 'LOW' END AS performance
FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id JOIN orders o ON a.id = o.account_id GROUP BY 1 ORDER BY 2 DESC;

/*The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics 
represented as well. We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 
in total sales. The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, 
the total number of orders, total sales across all orders, and a column with top, middle, or low depending on this criteria. 
Place the top sales people based on dollar amount of sales first in your final table. You might see a few upset sales people by this criteria!*/

SELECT s.name AS sales_rep_name, COUNT(o.id) AS order_count, SUM(o.total_amt_usd) AS total_sales,
CASE WHEN COUNT(o.id) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top' 
     WHEN (COUNT(o.id) >= 150 AND COUNT(o.id) < 200) OR (SUM(o.total_amt_usd) > 500000 AND SUM(o.total_amt_usd) < 750000) THEN 'middle' 
     ELSE 'low' END AS performance
FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id JOIN orders o ON a.id = o.account_id GROUP BY 1 ORDER BY 3 DESC;
