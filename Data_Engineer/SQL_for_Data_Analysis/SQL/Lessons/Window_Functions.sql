SELECT
         o.standard_amt_usd, 
         SUM(o.standard_amt_usd) OVER (ORDER BY o.occurred_at) AS running_total 
FROM     orders o;

SELECT
         o.standard_amt_usd,
         YEAR(o.occurred_at) AS year_occurred_at,
         SUM(o.standard_amt_usd) OVER (PARTITION BY YEAR(o.occurred_at) ORDER BY o.occurred_at) AS running_total 
FROM     orders o;

SELECT
         o.id,
         o.account_id,
         o.total,
         RANK() OVER (PARTITION BY o.account_id ORDER BY o.total DESC) AS total_rank
FROM     orders o;

SELECT id,
       account_id,
       standard_qty,
       MONTH(occurred_at) AS month_occurred_at,
       /*DENSE_RANK() OVER (PARTITION BY account_id ORDER BY MONTH(occurred_at)) AS dense_rank,*/
       SUM(standard_qty) OVER (PARTITION BY account_id ORDER BY MONTH(occurred_at)) AS sum_std_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id ORDER BY MONTH(occurred_at)) AS count_std_qty,
       AVG(standard_qty) OVER (PARTITION BY account_id ORDER BY MONTH(occurred_at)) AS avg_std_qty,
       MIN(standard_qty) OVER (PARTITION BY account_id ORDER BY MONTH(occurred_at)) AS min_std_qty,
       MAX(standard_qty) OVER (PARTITION BY account_id ORDER BY MONTH(occurred_at)) AS max_std_qty
FROM orders;

SELECT id,
       account_id,
       standard_qty,
       /*DENSE_RANK() OVER (PARTITION BY account_id) AS dense_rank,*/
       SUM(standard_qty) OVER (PARTITION BY account_id) AS sum_std_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id) AS count_std_qty,
       AVG(standard_qty) OVER (PARTITION BY account_id) AS avg_std_qty,
       MIN(standard_qty) OVER (PARTITION BY account_id) AS min_std_qty,
       MAX(standard_qty) OVER (PARTITION BY account_id) AS max_std_qty
FROM orders;


SELECT id,
       account_id,
       YEAR(occurred_at) AS year_occurred_at,
       /*DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS dense_rank,*/
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY YEAR(occurred_at));


SELECT occurred_at,
       total_amt_sum,
       LEAD(total_amt_sum) OVER (ORDER BY total_amt_sum) AS lead_sum,
       LEAD(total_amt_sum) OVER (ORDER BY total_amt_sum) - total_amt_sum AS lead_difference
FROM (
SELECT occurred_at,
       SUM(total_amt_usd) AS total_amt_sum
  FROM orders 
 GROUP BY 1
 ) sub;
 /*
 Use the NTILE functionality to divide the accounts into 4 levels in terms of the amount of standard_qty for their orders. 
 Your resulting table should have the account_id, the occurred_at time for each order, the total amount of standard_qty paper purchased, 
 and one of four levels in a standard_quartile column.*/
SELECT 
        o.account_id,
        o.occurred_at,
        o.standard_qty,
        NTILE(4) OVER (ORDER BY SUM(o.standard_qty)) AS standard_quartile
FROM 
        orders o
        ORDER BY 1;
/*Use the NTILE functionality to divide the accounts into two levels in terms of the amount of gloss_qty for their orders. 
Your resulting table should have the account_id, the occurred_at time for each order, the total amount of gloss_qty paper purchased, 
and one of two levels in a gloss_half column.*/
SELECT 
        o.account_id,
        o.occurred_at,
        o.gloss_qty,
        NTILE(2) OVER (ORDER BY o.gloss_qty) AS gloss_half
FROM 
        orders o
        ORDER BY 1;
/*Use the NTILE functionality to divide the orders for each account into 100 levels in terms of the amount of total_amt_usd for their orders. 
Your resulting table should have the account_id, the occurred_at time for each order, the total amount of total_amt_usd paper purchased, 
and one of 100 levels in a total_percentile column.*/
SELECT 
        o.account_id,
        o.occurred_at,
        o.total_amt_usd ,
        NTILE(100) OVER (PARTITION BY o.account_id ORDER BY o.total_amt_usd) AS total_percentile
FROM 
        orders o
        ORDER BY 1;