--Soru 1: 
--Ürünler tablosundan kategori kimliði (category_id) 3 olan tüm ürünlerin adýný ve liste fiyatýný listelemek için bir SQL SELECT sorgusu yazýnýz.
SELECT production.products.product_name, production.products.list_price 
FROM production.products 
WHERE production.products.category_id = 3

--Soru 2:
--Müþteriler tablosundaki tüm benzersiz þehirleri, eyaleti 'California' olan müþterileri listeyiniz.
SELECT DISTINCT city 
FROM sales.customers 
WHERE sales.customers.state = 'CA'

--Soru 3:
--Müþteriler arasýnda California (CA) eyaletinde oturan ama ‘Los Angeles’ ve ‘Campbell’þehirlerinde oturmayan tüm müþterilerin ‘adý, soyadý, telefon numarasý, þehri ve eyaletini listeleyiniz.

SELECT first_name, last_name, phone, city, state 
FROM sales.customers 
WHERE (sales.customers.city <> 'Los Angeles') and (sales.customers.city <> 'Campbell') 


--Soru 4:
--Müþteriler tablosuna yeni bir müþteri ekleyin. Müþterinin adý 'John Doe', e-posta adresi'john.doe@email.com' ancak telefon numarasý ve adres bilgilerini tabloya ekleyiniz.
INSERT sales.customers(first_name, last_name, email) 
VALUES ('John', 'Doe', 'john.doe@email.com')  

SELECT * FROM sales.customers 
WHERE sales.customers.first_name = 'John' and sales.customers.last_name = 'Doe'


--Soru 5:
--a) Müþteriler tablosuna eklenen müþteri adý 'John Doe' olan kiþinin telefon numarasýný '559-329-7915’ olarak güncelleyiniz.
UPDATE sales.customers SET phone = '559-329-7915' 
WHERE sales.customers.first_name = 'John' and sales.customers.last_name = 'Doe'

SELECT * FROM sales.customers 
WHERE sales.customers.first_name = 'John' and sales.customers.last_name = 'Doe'


--b) Müþteri numarasý 1446 olan müþterinin bazý bilgileri eksik ya da yanlýþ girilmiþ, bu müþterikaydýnýz siliniz ve John Doe isimli kiþinin bilgilerini SELECT sorgusu ile çekiniz.
DELETE from sales.customers 
WHERE sales.customers.customer_id = 1446

SELECT * FROM sales.customers 
WHERE sales.customers.first_name = 'John' and sales.customers.last_name = 'Doe'
