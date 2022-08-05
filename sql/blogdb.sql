-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 27 Kas 2020, 15:15:11
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
-- Veritabanı: `blogdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `kategoriID` int(11) NOT NULL,
  `KATEGORI` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kategoriID`, `KATEGORI`) VALUES
(1, 'Tarih'),
(2, 'Matematik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `makale`
--

CREATE TABLE `makale` (
  `makaleID` int(11) NOT NULL,
  `BASLIK` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ICERIK` text COLLATE utf8_turkish_ci NOT NULL,
  `TARIH` date NOT NULL,
  `yazarID` int(11) NOT NULL,
  `kategoriID` int(11) NOT NULL,
  `KEYWORDS` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `SAYAC` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `makale`
--

INSERT INTO `makale` (`makaleID`, `BASLIK`, `ICERIK`, `TARIH`, `yazarID`, `kategoriID`, `KEYWORDS`, `SAYAC`) VALUES
(2, 'faktöriyel hesaplama', 'faktöriyel', '2020-11-27', 1, 2, 'aaaaa', 2),
(3, 'şart yapısı', 'aaa', '2020-11-27', 1, 2, 'aaaa', 21);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazarID` int(11) NOT NULL,
  `ADI` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYADI` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `EPOSTA` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `KULLANICIADI` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SIFRE` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yazarID`, `ADI`, `SOYADI`, `EPOSTA`, `KULLANICIADI`, `SIFRE`) VALUES
(1, 'Oğuzhan', 'Taş', 'oguzhantas@gmail.com', 'oguzhantas', '123321'),
(2, 'Erhan', 'Can', 'erhan@gmail.com', NULL, NULL),
(3, 'Yusuf', 'Aktan', 'yusuf@gmail.com', 'yusuf123', '123123'),
(4, 'MEHMET', 'MUSTAFA', 'mehmetm@gmail.com', 'mehmet123', '123123'),
(5, 'Burak', 'Aktan', 'burak@gmail.com', 'burak123', '123123');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Tablo için indeksler `makale`
--
ALTER TABLE `makale`
  ADD PRIMARY KEY (`makaleID`),
  ADD KEY `yazarID` (`yazarID`,`kategoriID`),
  ADD KEY `kategoriID` (`kategoriID`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazarID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `makale`
--
ALTER TABLE `makale`
  MODIFY `makaleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `makale`
--
ALTER TABLE `makale`
  ADD CONSTRAINT `makale_ibfk_1` FOREIGN KEY (`yazarID`) REFERENCES `yazar` (`yazarID`),
  ADD CONSTRAINT `makale_ibfk_2` FOREIGN KEY (`kategoriID`) REFERENCES `kategori` (`kategoriID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
