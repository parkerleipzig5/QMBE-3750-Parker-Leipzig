SELECT price, taskid
FROM tasks;

SELECT price, category;
FROM task;
WHERE category = 'DRM';

SELECT price,category
FROM tasks
WHERE price >= 50
GROUP BY category, price
HAVING ABS(price>40
ORDER BY price DESC
LIMIT 10;