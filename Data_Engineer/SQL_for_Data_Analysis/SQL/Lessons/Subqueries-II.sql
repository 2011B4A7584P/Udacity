/*Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.*/
WITH repid_level_sales AS 
                                (SELECT a.sales_rep_id, SUM(o.total_amt_usd) AS total_sales, COUNT(o.id) AS order_count
                                 FROM accounts a 
                                 JOIN orders o ON a.id = o.account_id
                                 GROUP BY 1),
     repname_level_sales AS     (SELECT s.name, SUM(o.total_amt_usd) AS total_sales
                                 FROM sales_reps s 
                                 JOIN accounts a ON s.id = a.sales_rep_id
                                 JOIN orders o ON a.id = o.account_id
                                 GROUP BY 1)                                                                       
                                 
SELECT z.name AS sales_rep_name, y.region, y.max_sale FROM 
(SELECT 
        r.name AS region, MAX(x.total_sales) AS max_sale
FROM region r 
JOIN sales_reps s ON r.id = s.region_id
JOIN repid_level_sales x
ON s.id = x.sales_rep_id GROUP BY 1 ORDER BY 2 DESC)y
JOIN repname_level_sales z
ON y.max_sale = z.total_sales GROUP BY 2 ORDER BY 3 DESC;      

/*For the region with the largest sales total_amt_usd, how many total orders were placed?*/
WITH repid_level_sales AS 
                                (SELECT a.sales_rep_id, SUM(o.total_amt_usd) AS total_sales, COUNT(o.id) AS order_count
                                 FROM accounts a 
                                 JOIN orders o ON a.id = o.account_id
                                 GROUP BY 1)
                                 
SELECT 
        r.name AS region, MAX(x.total_sales) AS max_sale, SUM(x.order_count) AS total_orders 
FROM region r 
JOIN sales_reps s ON r.id = s.region_id
JOIN repid_level_sales x
ON s.id = x.sales_rep_id GROUP BY 1 ORDER BY 2 DESC;

/*How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?*/
WITH acct_std_order_details AS 
                                (SELECT 
                                        a.name, SUM(o.standard_qty) AS std_order, SUM(o.total) AS total_acct_order
                                 FROM   accounts a 
                                        JOIN orders o ON a.id = o.account_id
                                        GROUP BY 1 ORDER BY 2 DESC LIMIT 1),
     acct_total_order_details AS 
                                (SELECT 
                                        a.name, SUM(o.total) AS total_acct_order
                                 FROM   accounts a 
                                        JOIN orders o ON a.id = o.account_id
                                        GROUP BY 1)
SELECT 
        COUNT(y.name) 
FROM 
         acct_total_order_details y 
         WHERE y.total_acct_order > (SELECT 
                                            x.total_acct_order 
                                     FROM acct_std_order_details x);

                        
/*For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?*/
WITH best_customer AS 
                        (SELECT 
                                 a.name, SUM(o.total_amt_usd) AS total_spending
                         FROM    accounts a 
                                 JOIN orders o ON a.id = o.account_id
                                 GROUP BY 1 ORDER BY 2 DESC LIMIT 1)

SELECT 
        a.name, w.channel, COUNT(w.id)
FROM    web_events w 
        JOIN accounts a ON a.id = w.account_id 
        GROUP BY 1,2 HAVING a.name = (SELECT x.name FROM best_customer x)
        ORDER BY 3 DESC;

        
/*What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?*/
WITH top_10_customers AS 
                                (SELECT
                                        a.name, SUM(o.total_amt_usd) AS total_spending
                                 FROM   accounts a 
                                        JOIN orders o ON a.id = o.account_id
                                        GROUP BY 1 ORDER BY 2 DESC LIMIT 10)
                                        
SELECT 
        AVG(t.total_spending) AS lifetime_avg_spending 
FROM    top_10_customers t;

/*What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order, on average, 
than the average of all orders.*/
WITH rich_companies AS
                        (SELECT 
                                a.name, AVG(o.total_amt_usd) AS avg_order_spending
                         FROM   accounts a 
                                JOIN orders o ON a.id = o.account_id
                                GROUP BY 1)                        

SELECT 
       AVG(avg_order_spending) AS lifetime_avg_order_spending_for_rich_companies
       FROM rich_companies r WHERE r.avg_order_spending > (SELECT AVG(o.total_amt_usd) FROM orders o);       
