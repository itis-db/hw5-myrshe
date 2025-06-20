SELECT
    date,
    amount,
    sum(amount) over (order by date rows between unbounded preceding and current row) as running_total
FROM transactions;

SELECT
    id,
    category,
    price,
    round(avg(price) over (partition by category), 2) as avg_price_by_category,
    price - avg(price) over (patition by category) as deviation_from_avg
FROM products;

SELECT
    log_time,
    temperature,
    round(avg(temperature) over (oder by log_time rows between 2 preceding and current row), 2) as moving_avg_3
FROM temperature_logs;

SELECT
    project_id,
    min(start_date) as first_task_date,
    max(start_date) as last_task_date
FROM project_tasks
GROUP BY project_id;