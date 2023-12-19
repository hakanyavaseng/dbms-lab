--1) Ürünler(products) tablosundaki yer alan ürünlerden en düþük ürün fiyatýný ve en yüksek
--ürün fiyatýný ekrana listeleyiniz (10p).

SELECT MAX(list_price) from production.products

SELECT MIN(list_price) from production.products


--2) Ürünler(products) tablosundaki yer alan ürünlerin toplam sayýsýný, toplam fiyatýný ve
--ortalama fiyatýný ekrana listeleyiniz (10p).

SELECT COUNT(product_id) [Toplam Urun Sayisi], SUM(list_price) [Toplam Fiyat], AVG(list_price) [Ortalama Fiyat] from production.products

--3) 'Santa Cruz Bikes' maðazasýndan(stores) sipariþ(orders) veren 5 adet müþteriyi(customers)
--listeleyiniz. Ad ve soyad bilgilerini ekrana yazdýrýnýz (20p).

SELECT DISTINCT TOP(5) first_name, last_name from sales.customers C
INNER JOIN sales.orders O on O.customer_id = C.customer_id 
INNER JOIN sales.stores St on St.store_id = O.store_id where ST.store_name = 'Santa Cruz Bikes' 

--4) Adýnýn ikinci harfi S ve soyadýnýn son harfi A olan tüm müþterileri(customers) listeleyiniz.
--Ad ve soyad bilgilerini ekrana yazdýrýnýz (20p).

SELECT first_name, last_name from sales.customers C where first_name like '_s%' and last_name like '%a'




--5) Model yýlý 2015 ve 2017 dahil olmak üzere bu yýllar arasýndaki ürünleri(products) sipariþ
--etmiþ (order_items & orders) müþterileri(customers) listeleyiniz. Ad ve soyad bilgilerini
--eþsiz olarak ekrana yazdýrýnýz (20p). Bu soruyu gerçekleþtirirken BETWEEN kullanýnýz.

SELECT DISTINCT first_name, last_name from sales.customers C 
INNER JOIN sales.orders O on C.customer_id = O.customer_id
INNER JOIN sales.order_items OI on OI.order_id = O.order_id
INNER JOIN  production.products P on P.product_id = OI.product_id where P.model_year between 2015 and 2017



--6) 'Santa Cruz Bikes' ve 'Baldwin Bikes' maðazalarýndan(stores) sipariþ(orders) veren 10 adet
--müþteriyi(customers) listeleyiniz (20p). Ad ve soyad bilgilerini
--Bu soruyu gerçekleþtirirken IN kullanýnýz.

SELECT DISTINCT TOP(10) first_name, last_name, St.store_name from sales.customers C 
INNER JOIN sales.orders O on C.customer_id = O.customer_id 
INNER JOIN sales.stores St on St.store_id = O.store_id where store_name IN('Santa Cruz Bikes','Baldwin Bikes')