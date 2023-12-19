--1) �r�nler(products) tablosundaki yer alan �r�nlerden en d���k �r�n fiyat�n� ve en y�ksek
--�r�n fiyat�n� ekrana listeleyiniz (10p).

SELECT MAX(list_price) from production.products

SELECT MIN(list_price) from production.products


--2) �r�nler(products) tablosundaki yer alan �r�nlerin toplam say�s�n�, toplam fiyat�n� ve
--ortalama fiyat�n� ekrana listeleyiniz (10p).

SELECT COUNT(product_id) [Toplam Urun Sayisi], SUM(list_price) [Toplam Fiyat], AVG(list_price) [Ortalama Fiyat] from production.products

--3) 'Santa Cruz Bikes' ma�azas�ndan(stores) sipari�(orders) veren 5 adet m��teriyi(customers)
--listeleyiniz. Ad ve soyad bilgilerini ekrana yazd�r�n�z (20p).

SELECT DISTINCT TOP(5) first_name, last_name from sales.customers C
INNER JOIN sales.orders O on O.customer_id = C.customer_id 
INNER JOIN sales.stores St on St.store_id = O.store_id where ST.store_name = 'Santa Cruz Bikes' 

--4) Ad�n�n ikinci harfi S ve soyad�n�n son harfi A olan t�m m��terileri(customers) listeleyiniz.
--Ad ve soyad bilgilerini ekrana yazd�r�n�z (20p).

SELECT first_name, last_name from sales.customers C where first_name like '_s%' and last_name like '%a'




--5) Model y�l� 2015 ve 2017 dahil olmak �zere bu y�llar aras�ndaki �r�nleri(products) sipari�
--etmi� (order_items & orders) m��terileri(customers) listeleyiniz. Ad ve soyad bilgilerini
--e�siz olarak ekrana yazd�r�n�z (20p). Bu soruyu ger�ekle�tirirken BETWEEN kullan�n�z.

SELECT DISTINCT first_name, last_name from sales.customers C 
INNER JOIN sales.orders O on C.customer_id = O.customer_id
INNER JOIN sales.order_items OI on OI.order_id = O.order_id
INNER JOIN  production.products P on P.product_id = OI.product_id where P.model_year between 2015 and 2017



--6) 'Santa Cruz Bikes' ve 'Baldwin Bikes' ma�azalar�ndan(stores) sipari�(orders) veren 10 adet
--m��teriyi(customers) listeleyiniz (20p). Ad ve soyad bilgilerini
--Bu soruyu ger�ekle�tirirken IN kullan�n�z.

SELECT DISTINCT TOP(10) first_name, last_name, St.store_name from sales.customers C 
INNER JOIN sales.orders O on C.customer_id = O.customer_id 
INNER JOIN sales.stores St on St.store_id = O.store_id where store_name IN('Santa Cruz Bikes','Baldwin Bikes')