USE Bahçeişleri
GO
SELECT COUNT(*) FROM Müşteriler --142
SELECT COUNT(*) FROM Siparişler --87
-- Hangi müşteri hangi siparişi vermiştir ?
SELECT COUNT(*) FROM Siparişler INNER JOIN Müşteriler
ON Siparişler.MüşteriNO = Müşteriler.MüşteriNo --10

/*
1. INNER JOIN : İç birleştirme : Birleştirme Koşulunu sağlayan kayıtları listeler.
2. OUTER JOIN : Dış Birleştirme : İç birleştirmye ek olarak birleştirme koşulunu
 sağlamayan kayıtları da listelemek için kullanılır :
 a) LEFT OUTER JOIN : Sol Dış Birleştirme : 
  Birleştirme koşulunu sağlayan kayıtlara ek olarak,
  soldaki tablonun birleştirme koşulunu sağlaMAYAN
  kayıtlarını da listeler
  SELECT * FROM Soltablo LEFT OUTER JOIN SağTablo ON Birleştirme Koşulu 
  b) RIGHT OUTER JOIN : Sağ Dış Birleştirme : 
  Birleştirme koşulunu sağlayan kayıtlara ek olarak,
  sağdaki tablonun birleştirme koşulunu sağlaMAYAN
  kayıtlarını da listeler
  SELECT * FROM Sağtablo RIGHT OUTER JOIN SolTablo ON Birleştirme Koşulu 
  c) FULL OUTER JOIN : Tam Dış Birleştirme : 
  Birleştirme koşulunu sağlayan kayıtlara ek olarak,
  hem soldaki tablonun hem sağdaki tablonun
   birleştirme koşulunu sağlaMAYAN kayıtlarını da listeler
  SELECT * FROM Sağtablo RIGHT OUTER JOIN SolTablo ON Birleştirme Koşulu 
3. Çapraz Birleştirme
	CROSS JOIN : Soldaki tablonun herbit satırı ile sağdaki tablonun
	 her bir satırını eşleştirmek için kullanılır.
	 SELECT * FROM SolTablo CROSS JOIN SağTablo

Sipraiş vermemiş müşteriler ile beraber,
sipariş vermemiş müşterileri de listeleyiniz
  */
  SELECT Adı,Soyadı,SiparişNo
  FROM Müşteriler INNER JOIN Siparişler
  ON Müşteriler.MüşteriNo = Siparişler.MüşteriNO
  ORDER BY SiparişNo ASC
  -- Müşteriler tab. Birleştirme koşulunu sağlamayan kayıtlar isteniyor.
  -- Müşteriler solda mı? sağda mı?

  --Sipariş vermemiş müşteriler ile beraber, (iç)
  --Sipariş vermemiş müşteriler, (sol)
  --Kimin verdiği belli olmayan siparişler (sağ)
  SELECT Adı,Soyadı,SiparişNo
  FROM Müşteriler FULL OUTER JOIN Siparişler
  ON Müşteriler.MüşteriNo = Siparişler.MüşteriNO
  ORDER BY SiparişNo ASC

--Her bir müşteri ile her bir çalışanı eşleştiriniz
SELECT COUNT(*) FROM Müşteriler --142
SELECT COUNT(*) FROM Siparişler --87
-- cross join satır sayısı 142*13 = 1846

SELECT M.Adı+' '+M.Soyadı AS Müşteriler,
C.Adı AS ÇalışanAdı,C.Soyadı AS ÇalışanSoyadı
FROM Müşteriler AS M
CROSS JOIN Çalışanlar AS C --1846


CREATE VIEW tümMüşteriveSiparişleriGör
AS
  SELECT Adı,Soyadı,SiparişNo
  FROM Müşteriler FULL OUTER JOIN Siparişler
  ON Müşteriler.MüşteriNo = Siparişler.MüşteriNO
  ORDER BY SiparişNo ASC
  GO
  SELECT * FROM tümMüşteriveSiparişleriGör
  ORDER BY Adı ASC
  --Bir VT nesnesini oluşturan sql ifadesini görmek için sistem saklı yordamlarından :
  sp_helptext tümMüşteriveSiparişleriGör
  -- nesneyi oluşturan sql scripti kriptolayarak gizleyebiliriz
  -- Bunun için görünümü değiştirmemiz gerekir

ALTER VIEW tümMüşteriveSiparişleriGör
WITH ENCRYPTION
AS
  SELECT Adı,Soyadı,SiparişNo
  FROM Müşteriler FULL OUTER JOIN Siparişler
  ON Müşteriler.MüşteriNo = Siparişler.MüşteriNO
  GO
-- Görünümü silelim
DROP VIEW tümMüşteriveSiparişleriGör
