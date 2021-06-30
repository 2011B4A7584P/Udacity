/*Average events per day for each channel*/
SELECT z.channel, AVG(z.event_freq) AS avg_events, 
                                                  CASE 
                                                        WHEN AVG(z.event_freq)  > 1.5 THEN 'TOP' 
                                                        ELSE 'NOT'
                                                        END AS channel_performance 
FROM 
(SELECT 
        date(w.occurred_at) AS date, w.channel, COUNT(w.id) AS event_freq 
        FROM web_events w 
        GROUP BY 1,2) z
GROUP BY 1 ORDER BY 2 DESC;

/*Avg std qty, avg gloss_qty, avg poster_qty, total_spending in USD in the earliest month of orders*/
SELECT 
        AVG(o.standard_qty) AS avg_std_qty,AVG(o.gloss_qty) AS avg_gloss_qty, AVG(o.poster_qty) AS avg_poster_qty,SUM(o.total_amt_usd) AS total_spending 
FROM orders o 
        WHERE (MONTH(o.occurred_at), YEAR(o.occurred_at))
        =
                (SELECT 
                        MONTH(MIN(DATE(o.occurred_at))) AS earliest_order_month, 
                        YEAR(MIN(DATE(o.occurred_at))) AS earliest_order_year 
                 FROM orders o);
                 
/*Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.*/
SELECT z.salesman, y.region, y.max_regional_sale FROM
(SELECT 
        r.name AS region, MAX(x.total_sale) AS max_regional_sale
FROM 
        region r JOIN sales_reps s ON r.id = s.region_id
JOIN                 
(SELECT 
        a.sales_rep_id, SUM(o.total_amt_usd) as total_sale
FROM
        accounts a JOIN orders o 
        ON a.id = o.account_id 
        GROUP BY 1)x
        ON s.id = x.sales_rep_id GROUP BY 1)y 
JOIN        
(SELECT 
        s.name AS salesman, SUM(o.total_amt_usd) as total_sale
FROM
        sales_reps s JOIN accounts a ON s.id = a.sales_rep_id
        JOIN orders o ON o.account_id = a.id 
        GROUP BY 1)z
ON y.max_regional_sale = z.total_sale GROUP BY 2 ORDER BY 3 DESC;

/*For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?*/

SELECT 
        r.name AS region, MAX(x.total_sale) AS max_regional_sale, SUM(x.order_count)
FROM 
        region r JOIN sales_reps s ON r.id = s.region_id
JOIN                 
(SELECT 
        a.sales_rep_id, SUM(o.total_amt_usd) as total_sale, COUNT(o.id) AS order_count
FROM
        accounts a JOIN orders o 
        ON a.id = o.account_id 
        GROUP BY 1)x
        ON s.id = x.sales_rep_id GROUP BY 1;



/*How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?*/
       
       SELECT COUNT(aa.id) FROM 
       (SELECT 
                a.id, SUM(o.standard_qty) AS total_std_ordered, SUM(o.total) AS total_purchase 
       FROM 
                orders o JOIN accounts a 
                ON o.account_id = a.id
                GROUP BY 1 HAVING SUM(o.total) >       
       (SELECT 
                y.total
                FROM 
       (SELECT 
                a.id, SUM(o.standard_qty) AS total_std_ordered, SUM(o.total) AS total
        FROM 
                orders o JOIN accounts a 
                ON o.account_id = a.id 
                GROUP BY 1 ORDER BY 2 DESC LIMIT 1)y
                )) aa; 
                
                
/*For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?*/ 
        SELECT 
                w. channel, COUNT(w.id)
        FROM 
                web_events w
                WHERE w.account_id =                
        (SELECT 
                x.id 
        FROM 
        (SELECT 
                a.id, SUM(o.total_amt_usd) AS total_spending
        FROM 
                orders o JOIN accounts a 
                ON o.account_id = a.id 
                GROUP BY 1 ORDER BY 2 DESC LIMIT 1)x)
                GROUP BY 1 ORDER BY 2 DESC;
                
                
/*What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?*/                
        SELECT 
                AVG(x.total_spending) AS avg_spending
        FROM
        (SELECT 
                a.id, SUM(o.total_amt_usd) AS total_spending
        FROM 
                orders o JOIN accounts a 
                ON o.account_id = a.id 
                GROUP BY 1 ORDER BY 2 DESC LIMIT 10)x;                
                
/*What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order, on average, 
than the average of all orders.*/
        SELECT AVG(y.avg_spending_for_company) AS lifetime_avg_spending
        FROM
        (
        SELECT 
                aa.name, AVG(oo.total_amt_usd) AS avg_spending_for_company
                FROM
                orders oo JOIN accounts aa 
                ON oo.account_id = aa.id
                GROUP BY 1
                HAVING
                AVG(oo.total_amt_usd) >
                
        (SELECT 
                SUM(x.spending)/SUM(x.order_count) AS avg_order_spending 
        FROM                 
        (SELECT 
                a.name, SUM(o.total_amt_usd) AS spending, COUNT(o.id) AS order_count
        FROM 
                orders o JOIN accounts a 
                ON o.account_id = a.id 
                GROUP BY 1)x)
                )y;/*3348.019651*/
                
SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                                   FROM orders o)) temp_table;                