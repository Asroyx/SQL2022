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
  
  
  */
