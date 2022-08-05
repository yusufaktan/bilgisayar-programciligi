-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 30 Ara 2020, 17:43:27
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `eczanedb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firmaBilgi`
--

CREATE TABLE `firmaBilgi` (
  `firmaID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `SEHIR` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `POSTAKODU` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `firmaBilgi`
--

INSERT INTO `firmaBilgi` (`firmaID`, `AD`, `ADRES`, `SEHIR`, `POSTAKODU`) VALUES
(1, 'Abdi İbrahim İlaç San. ve Tic A.Ş.', 'Eski Büyükdere Cad. Ayazağa Yolu No:5', 'Istanbul', 34398),
(2, 'Bayer Türk Kimya San. Ltd. Şti.', 'Çakmak Mah. Balkan Cad. No:53', 'Istanbul', 34770),
(3, 'Deva Holding A.Ş.', 'Halkalı Merkez Mah. Basın Ekspres Cad. No:1', 'Istanbul', 34303),
(4, 'Eczacıbaşı İlaç Pazarlama A.Ş.', 'Büyükdere Cad. Ali Kaya Sok. No:5', 'Istanbul', 34394),
(5, 'Nobel Sağlık Ürünleri Ltd. Şti.', 'Saray Mah. Akçakoca Sok. No:10', 'Istanbul', 34768);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hastaBilgi`
--

CREATE TABLE `hastaBilgi` (
  `hastaID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `YAS` int(11) DEFAULT NULL,
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `sikayetID` int(11) DEFAULT NULL,
  `personelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hastaBilgi`
--

INSERT INTO `hastaBilgi` (`hastaID`, `AD`, `SOYAD`, `YAS`, `ADRES`, `sikayetID`, `personelID`) VALUES
(1, 'Meliha', 'Özlenir', 65, 'Taşkıran Mahallesi Demir Sokak No: 56 Daire: 4', 1, 3),
(2, 'Semiha', 'Aydemir', 42, 'Yolcu Mahallesi Defter Sokak No: 76 Daire: 2', 3, 3),
(3, 'Salim', 'Demir', 60, 'Kubbe Mahallesi Manastır Sokak No: 54 Daire: 2', 4, 1),
(4, 'Mehmet', 'Yolcu', 56, 'Asker Mahallesi Murat Sokak No No: 87 Daire: 2', 2, 2),
(5, 'Sabahattin', 'Korkmaz', 23, 'Kıran Mahallesi Matkap Sokak No: 24 Daire: 7', 4, 4),
(6, 'Abuzer', 'Solak', 36, 'Yatak Mahallesi Elçi Sokak No: 23 Daire: 9', 3, 4),
(7, 'Mehtap', 'Başçı', 70, 'Toprak Mahallesi Altın Sokak No: 29 Daire: 8', 2, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilacBilgi`
--

CREATE TABLE `ilacBilgi` (
  `ilacID` int(11) NOT NULL,
  `ILACADI` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `FIYAT` decimal(15,2) DEFAULT NULL,
  `STOK` int(11) DEFAULT NULL,
  `firmaID` int(11) DEFAULT NULL,
  `kategoriID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilacBilgi`
--

INSERT INTO `ilacBilgi` (`ilacID`, `ILACADI`, `FIYAT`, `STOK`, `firmaID`, `kategoriID`) VALUES
(1, 'Parol', '5.00', 26, 1, 1),
(2, 'Amoklavin', '18.00', 93, 1, 2),
(3, 'Augmentin', '12.00', 32, 5, 2),
(4, 'MuscoFlex', '22.00', 25, 4, 4),
(5, 'Zinnat', '10.00', 50, 3, 3),
(6, 'Dolorex', '42.00', 300, 2, 1),
(7, 'Kamfolin', '25.00', 200, 3, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilacKategori`
--

CREATE TABLE `ilacKategori` (
  `kategoriID` int(11) NOT NULL,
  `KATEGORI` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilacKategori`
--

INSERT INTO `ilacKategori` (`kategoriID`, `KATEGORI`) VALUES
(1, 'Ağrı Kesici'),
(2, 'Ateş Düşürücü'),
(3, 'Antibiyotik'),
(4, 'Kas Gevşetici');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nakliyeBilgi`
--

CREATE TABLE `nakliyeBilgi` (
  `nakliyeID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TELEFON` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `nakliyeBilgi`
--

INSERT INTO `nakliyeBilgi` (`nakliyeID`, `AD`, `TELEFON`) VALUES
(1, 'Hakan Nakliyat', '0541 441 4141'),
(2, 'Aras Nakliyat', '0542 442 4242'),
(3, 'Osman Taşımacılık', '0543 443 4343'),
(4, 'Güngören Nakliyat', '0544 444 4444');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personelBilgi`
--

CREATE TABLE `personelBilgi` (
  `personelID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TELEFON` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `EPOSTA` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DOGUMTARIHI` date DEFAULT NULL,
  `BASLAMATARIHI` date DEFAULT NULL,
  `MAAS` decimal(15,2) DEFAULT NULL,
  `KULLANICIADI` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SIFRE` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personelBilgi`
--

INSERT INTO `personelBilgi` (`personelID`, `AD`, `SOYAD`, `TELEFON`, `EPOSTA`, `DOGUMTARIHI`, `BASLAMATARIHI`, `MAAS`, `KULLANICIADI`, `SIFRE`) VALUES
(1, 'Eren', 'Nuyan', '0532 332 3232', 'erennuyan@gmail.com', '2001-06-04', '2019-05-01', '3000.00', 'erennuyan', '1234'),
(2, 'Alp', 'Yükselsen', '0533 333 3333', 'alpyukselsen@gmail.com', '2001-06-08', '2015-03-01', '4500.00', 'alpyukselsen', '1234'),
(3, 'Yekta', 'Okdan', '0534 334 3434', 'yektaokdan@gmail.com', '2001-09-06', '2018-04-01', '4000.00', 'yektaokdan', '1234'),
(4, 'Ömer', 'Aktan', '0535 335 3535', 'omeraktan@gmail.com', '1997-11-11', '2020-01-01', '3000.00', 'omeraktan', '1234');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sikayetBilgi`
--

CREATE TABLE `sikayetBilgi` (
  `sikayetID` int(11) NOT NULL,
  `SIKAYET` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sikayetBilgi`
--

INSERT INTO `sikayetBilgi` (`sikayetID`, `SIKAYET`) VALUES
(1, 'Baş Ağrısı'),
(2, 'Yüksek Ateş'),
(3, 'Bel Ağrısı'),
(4, 'Grip'),
(5, 'Eklem Ağrısı'),
(6, 'Korona');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisBilgi`
--

CREATE TABLE `siparisBilgi` (
  `siparisID` int(11) NOT NULL,
  `SIPARISTARIHI` date DEFAULT NULL,
  `ADET` int(11) DEFAULT NULL,
  `ilacID` int(11) DEFAULT NULL,
  `firmaID` int(11) DEFAULT NULL,
  `nakliyeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisBilgi`
--

INSERT INTO `siparisBilgi` (`siparisID`, `SIPARISTARIHI`, `ADET`, `ilacID`, `firmaID`, `nakliyeID`) VALUES
(1, '2020-12-26', 50, 5, 3, 3),
(2, '2020-11-15', 200, 1, 1, 4),
(3, '2020-12-05', 100, 3, 5, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `firmaBilgi`
--
ALTER TABLE `firmaBilgi`
  ADD PRIMARY KEY (`firmaID`);

--
-- Tablo için indeksler `hastaBilgi`
--
ALTER TABLE `hastaBilgi`
  ADD PRIMARY KEY (`hastaID`),
  ADD KEY `sikayetID` (`sikayetID`),
  ADD KEY `personelID` (`personelID`);

--
-- Tablo için indeksler `ilacBilgi`
--
ALTER TABLE `ilacBilgi`
  ADD PRIMARY KEY (`ilacID`),
  ADD KEY `firmaID` (`firmaID`),
  ADD KEY `kategoriID` (`kategoriID`);

--
-- Tablo için indeksler `ilacKategori`
--
ALTER TABLE `ilacKategori`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Tablo için indeksler `nakliyeBilgi`
--
ALTER TABLE `nakliyeBilgi`
  ADD PRIMARY KEY (`nakliyeID`);

--
-- Tablo için indeksler `personelBilgi`
--
ALTER TABLE `personelBilgi`
  ADD PRIMARY KEY (`personelID`);

--
-- Tablo için indeksler `sikayetBilgi`
--
ALTER TABLE `sikayetBilgi`
  ADD PRIMARY KEY (`sikayetID`);

--
-- Tablo için indeksler `siparisBilgi`
--
ALTER TABLE `siparisBilgi`
  ADD PRIMARY KEY (`siparisID`),
  ADD KEY `ilacID` (`ilacID`),
  ADD KEY `firmaID` (`firmaID`),
  ADD KEY `nakliyeID` (`nakliyeID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `firmaBilgi`
--
ALTER TABLE `firmaBilgi`
  MODIFY `firmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `hastaBilgi`
--
ALTER TABLE `hastaBilgi`
  MODIFY `hastaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `ilacBilgi`
--
ALTER TABLE `ilacBilgi`
  MODIFY `ilacID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `ilacKategori`
--
ALTER TABLE `ilacKategori`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `nakliyeBilgi`
--
ALTER TABLE `nakliyeBilgi`
  MODIFY `nakliyeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `personelBilgi`
--
ALTER TABLE `personelBilgi`
  MODIFY `personelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `sikayetBilgi`
--
ALTER TABLE `sikayetBilgi`
  MODIFY `sikayetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `siparisBilgi`
--
ALTER TABLE `siparisBilgi`
  MODIFY `siparisID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `hastaBilgi`
--
ALTER TABLE `hastaBilgi`
  ADD CONSTRAINT `hastaBilgi_ibfk_1` FOREIGN KEY (`sikayetID`) REFERENCES `sikayetBilgi` (`sikayetID`),
  ADD CONSTRAINT `hastaBilgi_ibfk_2` FOREIGN KEY (`personelID`) REFERENCES `personelBilgi` (`personelID`);

--
-- Tablo kısıtlamaları `ilacBilgi`
--
ALTER TABLE `ilacBilgi`
  ADD CONSTRAINT `ilacBilgi_ibfk_1` FOREIGN KEY (`firmaID`) REFERENCES `firmaBilgi` (`firmaID`),
  ADD CONSTRAINT `ilacBilgi_ibfk_2` FOREIGN KEY (`kategoriID`) REFERENCES `ilacKategori` (`kategoriID`);

--
-- Tablo kısıtlamaları `siparisBilgi`
--
ALTER TABLE `siparisBilgi`
  ADD CONSTRAINT `siparisBilgi_ibfk_1` FOREIGN KEY (`ilacID`) REFERENCES `ilacBilgi` (`ilacID`),
  ADD CONSTRAINT `siparisBilgi_ibfk_2` FOREIGN KEY (`firmaID`) REFERENCES `firmaBilgi` (`firmaID`),
  ADD CONSTRAINT `siparisBilgi_ibfk_3` FOREIGN KEY (`nakliyeID`) REFERENCES `nakliyeBilgi` (`nakliyeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
