USE BikeStores,


SELECT production.products.product_name, production.brands.brand_name, categories.category_name
FROM production.products 
INNER JOIN production.brands 
ON production.products.brand_id = production.brands.brand_id
INNER JOIN production.categories 
ON  production.products.category_id = production.categories.category_id
WHERE  production.products.model_year = 2016 AND  production.products.list_price > 500;

SELECT COUNT( production.products.product_id) AS siparis_edilmemis_urunn_sayisi
FROM  production.products
LEFT JOIN sales.order_items 
ON Products.product_id = order_items.product_id
WHERE sales.order_items.product_id IS NULL;




SELECT sales.stores.store_name
FROM sales.stores
FULL JOIN sales.orders
ON Stores.store_id = orders.store_id
WHERE orders.order_id IS NULL;



SELECT COUNT(DISTINCT production.products.product_id) AS toplam_trek
FROM production.products
WHERE brand_id = (SELECT brand_id FROM production.brands WHERE brand_name = 'Trek');