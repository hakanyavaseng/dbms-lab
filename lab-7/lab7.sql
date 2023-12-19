-- Soru 1: Bir müþterinin tüm sipariþlerini ve sipariþlerin detaylarýný listeleyen bir saklý yordamý
--yazýnýz. Yordam, müþteri kimliðini parametre olarak almalýdýr. Exec komutu ile yordamý
--çaðýrýnýz. (15p)
DROP PROC question1

CREATE PROC question1
@id INT
AS
SELECT * FROM SALES.customers  C
JOIN SALES.orders O on C.customer_id = O.customer_id
JOIN SALES.order_items OI on OI.order_id = O.order_id
WHERE C.customer_id = @id

EXEC question1 259

--Soru 2: Oluþturulan saklý yordamý güncelleyerek; müþteri adý X olan kiþinin en yüksek sipariþini
--getirmesini saðlayan saklý yordamý yazýnýz. Exec komutu ile yordamý çaðýrýnýz. (15p)

ALTER PROC question1
@name varchar(30)
AS
SELECT TOP 1 * FROM SALES.customers  C
JOIN SALES.orders O on C.customer_id = O.customer_id
JOIN SALES.order_items OI on OI.order_id = O.order_id
WHERE C.first_name = @name
ORDER BY list_price DESC

EXEC question1 'Johnathan'




--Soru 3: Belirli bir müþteriye ait tüm sipariþlerin maðazalara göre toplam deðerini hesaplayan
--bir saklý yordam yazýn. Yordam, müþteri kimliðini parametre olarak almalýdýr. Exec komutu ile
--yordamý çaðýrýnýz. (20p)

CREATE PROC question3
@id INT
AS
SELECT C.customer_id, S.store_id, S.store_name, SUM(OI.list_price) SUMTOTAL
FROM SALES.customers C 
JOIN SALES.orders O on C.customer_id = O.customer_id
JOIN SALES.stores S on S.store_id = O.store_id
JOIN SALES.order_items OI on OI.order_id = O.order_id
GROUP BY C.customer_id, S.store_id, S.store_name

EXEC question3 259



---Soru 4: Ürünler (products) tablosundaki en yüksek ve en düþük fiyatlý ürünlerin detaylarýný
--(ürün adý, marka, kategori, fiyat) gösteren bir saklý yordam yazýnýz. Bu yordam, markalar ve
--kategorilerle karmaþýk sorgularý içermelidir. Exec komutu ile yordamý çaðýrýnýz. (20p)

CREATE PROC question4
AS
SELECT TOP 1 P.product_name, B.brand_name, C.category_id, P.list_price
FROM production.products P
JOIN production.brands B ON P.brand_id = B.brand_id
JOIN production.categories C on C.category_id = P.category_id
ORDER BY list_price DESC 

SELECT TOP 1 P.product_name, B.brand_name, C.category_id, P.list_price
FROM production.products P
JOIN production.brands B ON P.brand_id = B.brand_id
JOIN production.categories C on C.category_id = P.category_id
ORDER BY list_price 

EXEC question4


--Soru 5: Belirli bir kategoriye ait ürünlerin sayýsýný ve bu ürünlerin ortalama fiyatýný hesaplayan
--bir saklý yordam yazýnýz. Yordam, kategori ID'sini parametre olarak almalýdýr. Exec komutu ile
--yordamý çaðýrýnýz. (20p)

CREATE PROC question5
@categoryID INT
AS
SELECT C.category_name, COUNT(P.product_id) URUNSAYISI, ROUND(AVG(P.list_price),2) KATEGORIADI
FROM production.products P
JOIN production.categories C on C.category_id = P.category_id
WHERE C.category_id = @categoryID
GROUP BY C.category_name

EXEC question5 2

--Soru 6: Oluþturulan son saklý yordamý siliniz. (10p)

DROP PROCEDURE question5
GO




