SELECT COUNT(*) FROM orders o WHERE o.standard_qty > 100;/*4509*/

SELECT COUNT(*) FROM orders o HAVING o.standard_qty > 100;/*fails as there is no table column for aggregation*/

SELECT o.account_id, COUNT(o.id) FROM orders o GROUP BY 1 HAVING COUNT(o.id) > 10 AND o.account_id >100;

SELECT o.id, o.account_id, o.total_amt_usd FROM orders o ORDER BY 1 LIMIT 20 OFFSET 20;

SELECT o.id, o.account_id, o.total_amt_usd FROM orders o ORDER BY 1 LIMIT 20 OFFSET 5;

SELECT o.id, o.account_id, o.total_amt_usd FROM orders o ORDER BY 1 OFFSET 10 FETCH NEXT 5 ROWS ONLY;

SELECT o.account_id, SUM(o.total_amt_usd) FROM orders o GROUP BY 1 ORDER BY 2 DESC LIMIT 1 OFFSET 2;


select a.name from accounts a order by right(a.name,3);
SELECT CASE WHEN 4+5 > 7 THEN 'true' ELSE FALSE end;