SELECT a.primary_poc, w.occurred_at AS time_of_the_event, w.channel, a.name FROM web_events w JOIN accounts a ON w.account_id = a.id WHERE a.name = 'Walmart';

SELECT r.name AS region, s.name AS sales_rep, a.name AS account FROM region r JOIN sales_reps s ON s.region_id = r.id JOIN
accounts ON s.id = a.sales_rep_id order by 3;

SELECT r.name AS region, a.name AS account, o.total_amount_usd/(o.total + 0.01) AS unit_price FROM region r JOIN sales_reps s ON r.id = s.region_id JOIN
accounts a ON s.id = a.sales_rep_id JOIN orders o ON a.id = o.account_id;
