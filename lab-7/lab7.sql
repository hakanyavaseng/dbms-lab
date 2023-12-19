-- Soru 1: Bir m��terinin t�m sipari�lerini ve sipari�lerin detaylar�n� listeleyen bir sakl� yordam�
--yaz�n�z. Yordam, m��teri kimli�ini parametre olarak almal�d�r. Exec komutu ile yordam�
--�a��r�n�z. (15p)
DROP PROC question1

CREATE PROC question1
@id INT
AS
SELECT * FROM SALES.customers  C
JOIN SALES.orders O on C.customer_id = O.customer_id
JOIN SALES.order_items OI on OI.order_id = O.order_id
WHERE C.customer_id = @id

EXEC question1 259

--Soru 2: Olu�turulan sakl� yordam� g�ncelleyerek; m��teri ad� X olan ki�inin en y�ksek sipari�ini
--getirmesini sa�layan sakl� yordam� yaz�n�z. Exec komutu ile yordam� �a��r�n�z. (15p)

ALTER PROC question1
@name varchar(30)
AS
SELECT TOP 1 * FROM SALES.customers  C
JOIN SALES.orders O on C.customer_id = O.customer_id
JOIN SALES.order_items OI on OI.order_id = O.order_id
WHERE C.first_name = @name
ORDER BY list_price DESC

EXEC question1 'Johnathan'




--Soru 3: Belirli bir m��teriye ait t�m sipari�lerin ma�azalara g�re toplam de�erini hesaplayan
--bir sakl� yordam yaz�n. Yordam, m��teri kimli�ini parametre olarak almal�d�r. Exec komutu ile
--yordam� �a��r�n�z. (20p)

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



---Soru 4: �r�nler (products) tablosundaki en y�ksek ve en d���k fiyatl� �r�nlerin detaylar�n�
--(�r�n ad�, marka, kategori, fiyat) g�steren bir sakl� yordam yaz�n�z. Bu yordam, markalar ve
--kategorilerle karma��k sorgular� i�ermelidir. Exec komutu ile yordam� �a��r�n�z. (20p)

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


--Soru 5: Belirli bir kategoriye ait �r�nlerin say�s�n� ve bu �r�nlerin ortalama fiyat�n� hesaplayan
--bir sakl� yordam yaz�n�z. Yordam, kategori ID'sini parametre olarak almal�d�r. Exec komutu ile
--yordam� �a��r�n�z. (20p)

CREATE PROC question5
@categoryID INT
AS
SELECT C.category_name, COUNT(P.product_id) URUNSAYISI, ROUND(AVG(P.list_price),2) KATEGORIADI
FROM production.products P
JOIN production.categories C on C.category_id = P.category_id
WHERE C.category_id = @categoryID
GROUP BY C.category_name

EXEC question5 2

--Soru 6: Olu�turulan son sakl� yordam� siliniz. (10p)

DROP PROCEDURE question5
GO




