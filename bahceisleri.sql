SELECT Siparişler.SiparişNo,
Müşteriler.Adı +' '+ Müşteriler.Soyadı AS Müşteriler
Çalışanlar.Adı AS ÇalışanAd, Çalışanlar.Soyadı AS ÇalışanSoyad,
Nakliyeciler.ŞİRKET AS KargoFirması, SD.ÜrünNo,Ürünler.ÜrünAd, 
Ürünler.KategoriNo,
SD.BirimFiyat, SD.Miktar, SD.İndirim, Ürünler.SatıcıFirmaNo,
Satıcılar.FirmaAdı, Satıcılar.FirmaAdı AS TedarikçiFirma, Satıcılar.Kişi
AS FirmaTemsilci, Satıcılar.Telefon

FROM Siparişler
INNER JOIN Müşteriler
ON Siparişler.MüşteriNo = Müşteriler.MüşteriNo
INNER JOIN Müşteriler
ON Siparişler.MüşteriNo = Müşteriler.MüşteriNo
INNER JOIN Çalışanlar
ON Siparişler.ÇalışanNo = Çalışanlar.ÇalışanNo
INNER JOIN Nakliyeciler
ON Siparişler.Nakliyeci = Nakliyeciler.NAKLİYECİNO
INNER JOIN [Sipariş Detayları] AS SD
ON Siparişler.SiparişNo = SD.SiparişNo
INNER JOIN Ürünler ON SD.ÜrünNo ON SD.ÜrünNo = Ürünler.ÜrünNo
INNER JOIN Satıcılar ON Ürünler.SatıcıFirmaNo = Satıcılar.SatıcıFirmaNo
INNER JOIN Kategoriler ON Ürünler.KategoriNo= Kategoriler.KategoriNo

