SELECT o.id, o.occurred_at, o.total_amt_usd FROM orders o ORDER BY o.occurred_at LIMIT 10;

SELECT o.id, o.occurred_at, o.total_amt_usd FROM orders o ORDER BY o.total_amt_usd DESC LIMIT 5;

SELECT o.id, o.occurred_at, o.total_amt_usd FROM orders o ORDER BY o.total_amt_usd LIMIT 20;

SELECT o.id, o.account_id, o.total_amt_usd FROM orders o ORDER BY 2,3 DESC;

SELECT o.id, o.account_id, o.total_amt_usd FROM orders o ORDER BY 3 DESC;

SELECT * FROM orders o WHERE o.gloss_amt_usd >= 1000 LIMIT 5;

SELECT * FROM orders o WHERE o.total_amt_usd < 500 LIMIT 10;

SELECT a.name, a.website, a.primary_poc FROM accounts a WHERE a.name = 'Exxon Mobil';

SELECT o.id, o.account_id, (o.standard_amt_usd/o.standard_qty) AS standard_unit_price FROM orders o LIMIT 10;

SELECT o.id, o.account_id, (o.poster_amt_usd/(o.standard_amt_usd + o.gloss_amt_usd + o.poster_amt_usd))*100 AS poster_percentage_share  FROM orders o LIMIT 10;

SELECT * FROM accounts a WHERE a.name LIKE 'C%';

SELECT * FROM accounts a WHERE a.name LIKE '%one%';

SELECT * FROM accounts a WHERE a.name LIKE '%s';

SELECT a.name, a.primary_poc, a.sales_rep_id FROM accounts a WHERE a.name IN ('Walmart', 'Target', 'Nordstrom');

SELECT * FROM web_events w WHERE w.channel IN ('organic','adwords');

SELECT a.name, a.primary_poc, a.sales_rep_id FROM accounts a WHERE a.name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT * FROM web_events w WHERE w.channel NOT IN ('organic','adwords');

SELECT * FROM accounts a WHERE a.name NOT LIKE 'C%';

SELECT * FROM accounts a WHERE a.name NOT LIKE '%one%';

SELECT * FROM accounts a WHERE a.name NOT LIKE '%s';

SELECT * FROM orders o WHERE o.standard_qty > 1000 AND o.poster_qty = 0 AND o.gloss_qty = 0; 

SELECT * FROM accounts a WHERE a.name NOT LIKE 'C%' AND a.name LIKE '%s';

SELECT DATE(o.occurred_at) AS order_date, o.gloss_qty FROM orders o WHERE o.gloss_qty BETWEEN 24 AND 29;

SELECT * FROM web_events w WHERE w.channel IN ('organic','adwords') AND year(w.occurred_at) = 2016 ORDER BY w.occurred_at DESC;

SELECT * FROM web_events w WHERE w.channel IN ('organic','adwords') AND w.occurred_at BETWEEN '2016-01-01 00:00:00' AND '2017-01-01 00:00:00' 
ORDER BY w.occurred_at DESC;

SELECT id FROM orders o WHERE o.gloss_qty > 4000 OR o.poster_qty > 4000;

SELECT id FROM orders o WHERE o.standard_qty = 0 AND (o.gloss_qty > 1000 OR o.poster_qty > 1000);

SELECT * FROM accounts a WHERE (a.name LIKE 'C%' OR  a.name LIKE 'W%') AND ((a.primary_poc LIKE '%ana%' OR a.primary_poc LIKE '%Ana%')
AND a.primary_poc NOT LIKE '%eana%');