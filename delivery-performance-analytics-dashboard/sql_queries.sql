CREATE DATABASE ecommerce;
USE ecommerce;

SELECT platform, AVG(delivery_time_minutes) AS avg_delivery_time
FROM ecommerce_cleaned_final
GROUP BY platform
ORDER BY avg_delivery_time ASC;

SELECT platform, COUNT(*) AS total_orders,
SUM(CASE WHEN delivery_delay = 'YES' THEN 1 ELSE 0 END) AS delayed_orders
FROM ecommerce_cleaned_final
GROUP BY platform
ORDER BY delayed_orders DESC;

SELECT platform, COUNT(*) AS total_orders,
SUM(CASE WHEN delivery_delay = 'Yes' THEN 1 ELSE 0 END) AS delayed_orders,
SUM(CASE WHEN delivery_delay = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS delay_percentage
FROM ecommerce_cleaned_final
GROUP BY platform
ORDER BY  delay_percentage DESC;

SELECT product_category, COUNT(*) AS total_orders,
SUM(CASE WHEN delivery_delay = 'Yes' THEN 1 ELSE 0 END) AS delayed_orders
FROM ecommerce_cleaned_final
GROUP BY product_category
ORDER BY delayed_orders DESC;

SELECT COUNT(*) AS total_orders,
SUM(CASE WHEN delivery_delay = 'Yes' THEN 1 ELSE 0 END) AS delayed_orders,
SUM(CASE WHEN delivery_delay = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS delay_percentage
FROM ecommerce_cleaned_final;

SELECT product_category, SUM(order_value_INR) AS total_revenue
FROM ecommerce_cleaned_final
GROUP BY product_category
ORDER BY total_revenue DESC;

SELECT platform, AVG(order_value_INR) AS avg_order_value
FROM ecommerce_cleaned_final
GROUP BY platform
ORDER BY avg_order_value DESC;  

SELECT platform, AVG(service_rating) AS avg_rating
FROM ecommerce_cleaned_final
GROUP BY platform
ORDER BY avg_rating DESC; 

SELECT delivery_delay, AVG(service_rating) AS avg_rating, COUNT(*) AS total_orders
FROM ecommerce_cleaned_final
GROUP BY delivery_delay;

SELECT product_category, COUNT(*) AS total_orders,
SUM(CASE WHEN refund_requested = 'Yes' THEN 1 ELSE 0 END) AS refund_orders,
(SUM(CASE WHEN refund_requested = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS refund_percentage
FROM ecommerce_cleaned_final
GROUP BY product_category
ORDER BY refund_percentage DESC;

SELECT delivery_delay, COUNT(*) AS total_orders,
SUM(CASE WHEN refund_requested = 'Yes' THEN 1 ELSE 0 END) AS refund_orders,
SUM(CASE WHEN refund_requested = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS refund_percentage
FROM ecommerce_cleaned_final
GROUP BY delivery_delay;