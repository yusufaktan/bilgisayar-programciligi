-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Haz 2021, 03:16:26
-- Sunucu sürümü: 10.4.18-MariaDB
-- PHP Sürümü: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `proje`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `depoKalanYer` ()  SELECT depobilgi.depoID, depobilgi.KAPASITE, SUM(ilacbilgi.STOK) AS "BULUNAN ILAC", depobilgi.KAPASITE-SUM(ilacbilgi.STOK) AS "KALAN YER" 
FROM ilacbilgi, depobilgi
WHERE ilacbilgi.depoID=depobilgi.depoID AND
depobilgi.depoID=1
UNION
SELECT depobilgi.depoID, depobilgi.KAPASITE, SUM(ilacbilgi.STOK) AS "BULUNAN ILAC", depobilgi.KAPASITE-SUM(ilacbilgi.STOK) AS "KALAN YER" 
FROM ilacbilgi, depobilgi
WHERE ilacbilgi.depoID=depobilgi.depoID AND
depobilgi.depoID=2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `toplamMaas` ()  SELECT 'Eczane Çalışanları' AS "YER", SUM(personelbilgi.MAAS) AS "TOPLAM" FROM personelbilgi
UNION
SELECT 'Depo Personelleri', SUM(depopersonel.MAAS) FROM depopersonel
UNION
SELECT 'Depo Müdürleri', SUM(depomudur.MAAS) FROM depomudur$$

--
-- İşlevler
--
CREATE DEFINER=`root`@`localhost` FUNCTION `canliStok` (`ilacismi` VARCHAR(45)) RETURNS INT(11) RETURN (SELECT ilacbilgi.STOK FROM ilacbilgi 
        WHERE ilacbilgi.ILACADI=ilacismi)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kacGundurCalisiyor` (`gununTarihi` DATE, `calisanIsmi` VARCHAR(45)) RETURNS INT(11) RETURN (SELECT DATEDIFF(gununTarihi, personelbilgi.BASLAMATARIHI) 
        FROM personelbilgi WHERE personelbilgi.AD=calisanIsmi)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `depobilgi`
--

CREATE TABLE `depobilgi` (
  `depoID` int(11) NOT NULL,
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `KAPASITE` int(11) DEFAULT NULL,
  `depoMudurID` int(11) DEFAULT NULL,
  `depoPersonelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `depobilgi`
--

INSERT INTO `depobilgi` (`depoID`, `ADRES`, `KAPASITE`, `depoMudurID`, `depoPersonelID`) VALUES
(1, 'Selami Caddesi No:44-45', 700, 1, 1),
(2, 'Muhtar Caddesi No:11-12', 650, 2, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `depomudur`
--

CREATE TABLE `depomudur` (
  `depoMudurID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CINSIYET` tinyint(1) DEFAULT NULL COMMENT 'ERKEK=0, KADIN=1',
  `TELEFON` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DOGUMTARIHI` date DEFAULT NULL,
  `BASLAMATARIHI` date DEFAULT NULL,
  `MAAS` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `depomudur`
--

INSERT INTO `depomudur` (`depoMudurID`, `AD`, `SOYAD`, `CINSIYET`, `TELEFON`, `DOGUMTARIHI`, `BASLAMATARIHI`, `MAAS`) VALUES
(1, 'Aydın', 'Can', 0, '55555555555', '1993-04-23', '2018-05-05', '5000.00'),
(2, 'Zeynep', 'Çetin', 1, '66666666666', '1995-10-28', '2018-05-01', '5000.00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `depopersonel`
--

CREATE TABLE `depopersonel` (
  `depoPersonelID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CINSIYET` tinyint(1) DEFAULT NULL COMMENT 'ERKEK=0, KADIN=1',
  `TELEFON` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DOGUMTARIHI` date DEFAULT NULL,
  `BASLAMATARIHI` date DEFAULT NULL,
  `MAAS` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `depopersonel`
--

INSERT INTO `depopersonel` (`depoPersonelID`, `AD`, `SOYAD`, `CINSIYET`, `TELEFON`, `DOGUMTARIHI`, `BASLAMATARIHI`, `MAAS`) VALUES
(1, 'Erkan', 'Gül', 0, '05313313131', '1994-05-07', '2018-05-05', '3500.00'),
(2, 'Muhammed', 'Kömürcü', 0, '05323323232', '1990-05-30', '2018-05-01', '3500.00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hastabilgi`
--

CREATE TABLE `hastabilgi` (
  `hastaID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CINSIYET` tinyint(1) DEFAULT NULL COMMENT 'ERKEK=0, KADIN=1',
  `YAS` int(11) DEFAULT NULL,
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `sikayetID` int(11) DEFAULT NULL,
  `personelID` int(11) DEFAULT NULL,
  `ilacID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hastabilgi`
--

INSERT INTO `hastabilgi` (`hastaID`, `AD`, `SOYAD`, `CINSIYET`, `YAS`, `ADRES`, `sikayetID`, `personelID`, `ilacID`) VALUES
(1, 'Halime', 'Sultan', 1, 62, 'Altın Mahallesi Bohça Sokak No: 22/4', 1, 3, 2),
(2, 'Abuzer', 'Kaya', 0, 70, 'Balta Mahallesi Çekiç Sokak No: 64/4', 2, 2, 3),
(3, 'Tarık', 'Olgun', 0, 45, 'Urfa Mahallesi İsot Sokak No: 53/7', 3, 2, 4),
(4, 'Gülsüm', 'Kaya', 1, 55, 'Kemal Mahallesi Paşa Caddesi No: 23/8', 4, 1, 6),
(5, 'Emrecan', 'Özdemir', 0, 19, 'Canlı Mahallesi Köşe Caddesi No:12/1', 5, 1, 7),
(6, 'Çetin', 'Solmaz', 0, 76, 'Süleymaniye Mahallesi Altılı Sokak No: 12/2', 3, 2, 4),
(7, 'Cemre', 'Yalçın', 1, 28, 'Tepe Mahallesi Okul Caddesi No: 27/9', 1, 3, 3),
(8, 'Mehmet', 'Şentürk', 0, 42, 'İçerenköy Mahallesi Bağlar Mahallesi No: 34/4', 4, 1, 6),
(9, 'Fatma', 'Doğan', 1, 24, 'Akbaba Mahallesi Fatih Caddesi No: 42/3', 5, 2, 7),
(10, 'Deniz', 'Demir', 0, 19, 'Yılmaz Mahallesi Sert Sokak No: 69/3', 5, 3, 7),
(11, 'Enes', 'Taşkın', 0, 18, 'Nispetiye Caddesi Yayabey Sokak No: 85/4', 3, 2, 4),
(12, 'Ruhi', 'Derma', 1, 57, 'Çavuşbaşı Caddesi Çamlıca Sokak No: 53/9', 3, 1, 4),
(13, 'Orkun', 'Selim', 1, 45, 'Saray Mahallesi Siteyolu Caddesi No: 35/6', 4, 1, 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilacbilgi`
--

CREATE TABLE `ilacbilgi` (
  `ilacID` int(11) NOT NULL,
  `ILACADI` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `FIYAT` decimal(15,2) DEFAULT NULL,
  `STOK` int(11) DEFAULT NULL,
  `kategoriID` int(11) DEFAULT NULL,
  `depoID` int(11) DEFAULT NULL,
  `ilacFirmaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilacbilgi`
--

INSERT INTO `ilacbilgi` (`ilacID`, `ILACADI`, `FIYAT`, `STOK`, `kategoriID`, `depoID`, `ilacFirmaID`) VALUES
(1, 'Calpol', '5.00', 50, 1, 1, 5),
(2, 'Minoset', '10.00', 40, 2, 1, 4),
(3, 'Muscoflex', '10.00', 70, 3, 2, 3),
(4, 'Augmentin', '15.00', 25, 4, 2, 3),
(5, 'Zantac', '15.00', 60, 5, 2, 2),
(6, 'Supradyn', '10.00', 40, 6, 1, 1),
(7, 'Histavet', '5.00', 50, 7, 2, 1),
(8, 'Apranax', '25.00', 0, 2, 1, 7),
(9, 'Parol', '15.00', 50, 2, 1, 3),
(10, 'Dolarex', '12.00', 120, 1, 2, 9),
(11, 'Kamfolin', '7.00', 40, 3, 1, 6),
(12, 'Zinnat', '14.00', 60, 2, 1, 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilacfirmabilgi`
--

CREATE TABLE `ilacfirmabilgi` (
  `ilacFirmaID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `TELEFON` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SEHIR` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `POSTAKODU` varchar(5) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilacfirmabilgi`
--

INSERT INTO `ilacfirmabilgi` (`ilacFirmaID`, `AD`, `ADRES`, `TELEFON`, `SEHIR`, `POSTAKODU`) VALUES
(1, 'Abdi İbrahim İlaç San. ve Tic A.Ş.', 'Eski Büyükdere Cad. Ayazağa Yolu No:5', '02123668400', 'ISTANBUL', '34398'),
(2, 'Akın İlaç San. ve Tic. Ltd. Şti.', 'Yüzyıl Mah. Barbaros Cad. 9. Sok. No:31/2', '02125397270', 'ISTANBUL', '34204'),
(3, 'Akur İlaç Ltd.Şti.', 'Aşağı Dudullu Mah. Tosya Cad. No:5', '02166129191', 'ISTANBUL', '34773'),
(4, 'Eczacıbaşı İlaç Pazarlama A.Ş.', 'Büyükdere Cad. Ali Kaya Sok. No:5', '02123508000', 'ISTANBUL', '34394'),
(5, 'Med-İlaç San ve Tic. A.Ş.', 'Bankalar Cad. Bozkurt Han No:19/4', '02123679100', 'GIRESUN', '28420'),
(6, 'Effectus İlaç Ltd. Şti', 'Katip Mustafa Çelebi Mh. S.Selviler Cd.Ayla İşh.N24 D2', '02122527992', 'İSTANBUL', '34670'),
(7, 'Helvacızade Gıda İlaç Kimya San. ve Tic. A.Ş.', 'Şerifali Mah. Alptekin Yolu No:73 Köroğlu İş Merkez, K:1', '02164110014', 'İSTANBUL', '34370'),
(8, 'Laurus İlaç San. ve Tic. Anonim Şirketi', 'Tekstilkent Ticaret Merkezi Koza Plaza A Blok Kat:27', '02826555505', 'İSTANBUL', '34980'),
(9, 'Sentinus İlaç A.Ş.', 'Mustafa Kemal Mah. 2123 sok no:2d Cepa Ofis no:802', '03122270202', 'ANKARA', '06524'),
(10, 'Nutrifarma Sağlık Ürünleri A.Ş.', 'Büyükdere Cad. Nurol Plaza No:71', '02122852550', 'İSTANBUL', '34891'),
(11, 'Osel İlaç San. ve Tic. A.Ş.', 'Akbaba Köyü Fener Cad. No:11/5', '02163204550', 'İSTANBUL', '34648'),
(12, 'OteLab İlaç San. ve Tic. Ltd. Şti.', 'Bağlar Mah. Oral Sok. No:5/Z1', '02126304860', 'İSTANBUL', '34665'),
(13, 'Pierre Fabre İlaç A.Ş.', 'Yenisahra Mah. İnönü Cad.Çalışkan Sok. No:4/2', '02163174707', 'İSTANBUL', '34978');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilackategori`
--

CREATE TABLE `ilackategori` (
  `kategoriID` int(11) NOT NULL,
  `KATEGORI` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilackategori`
--

INSERT INTO `ilackategori` (`kategoriID`, `KATEGORI`) VALUES
(1, 'Ateş Düşürücü'),
(2, 'Ağrı Kesici'),
(3, 'Kas Gevşetici'),
(4, 'Antibiyotik'),
(5, 'Mide Koruyucu'),
(6, 'Takviye Vitamin'),
(7, 'Alerji İlacı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nakliyecalisan`
--

CREATE TABLE `nakliyecalisan` (
  `nakCalisanID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TELEFON` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `nakFirmaBilgi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `nakliyecalisan`
--

INSERT INTO `nakliyecalisan` (`nakCalisanID`, `AD`, `SOYAD`, `TELEFON`, `nakFirmaBilgi`) VALUES
(1, 'Osman', 'Pazar', '05363363636', 1),
(2, 'Mehmet', 'Hızlı', '05373373737', 2),
(3, 'Selim', 'Güven', '05383383838', 3),
(4, 'Yavuz', 'Seçkin', '05393393939', 4),
(5, 'Cemal', 'Demir', '05403404040', 5),
(6, 'Hasan', 'Altın', '05413414141', 6),
(7, 'Celal', 'Dere', '05423424242', 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nakliyefirma`
--

CREATE TABLE `nakliyefirma` (
  `nakFirmaBilgi` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TELEFON` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `nakliyefirma`
--

INSERT INTO `nakliyefirma` (`nakFirmaBilgi`, `AD`, `TELEFON`, `ADRES`) VALUES
(1, 'Osman Nakliyat', '05333333333', 'Kuşçu Mahallesi Sıtkı Caddesi No: 24'),
(2, 'Hızlı Nakliyat', '05343343434', 'Berber Mahallesi Oya Caddesi No: 23'),
(3, 'Güven Nakliyat', '05353353535', 'Erdem Mahallesi Hocabaşı Caddesi No: 25'),
(4, 'Akaydın Nakliyat', '05363363636', 'İlbasan Mahallesi Altınok Sokak No: 23'),
(5, 'Tepe Nakliyat', '05373373737', 'Dere Mahallesi Tepe Caddesi No: 75'),
(6, ' Şensoy Nakliyat', '05383383838', 'Kayaş Mahallesi Firma Sokak No: 99'),
(7, 'Elite Nakliyat', '05393393939', 'Edremit Mahallesi Taşdelen Sokak No: 33');

--
-- Tetikleyiciler `nakliyefirma`
--
DELIMITER $$
CREATE TRIGGER `kayitSilme` BEFORE DELETE ON `nakliyefirma` FOR EACH ROW DELETE nakliyecalisan, siparisbilgi 
FROM nakliyecalisan INNER JOIN siparisbilgi 
ON nakliyecalisan.nakFirmaBilgi = siparisbilgi.nakFirmaBilgi 
WHERE nakliyecalisan.nakFirmaBilgi=OLD.nakFirmaBilgi 
AND siparisbilgi.nakFirmaBilgi=OLD.nakFirmaBilgi
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personelbilgi`
--

CREATE TABLE `personelbilgi` (
  `personelID` int(11) NOT NULL,
  `AD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYAD` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TC` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CINSIYET` tinyint(1) DEFAULT NULL COMMENT 'ERKEK=0, KADIN=1',
  `ADRES` text COLLATE utf8_turkish_ci DEFAULT NULL,
  `TELEFON` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DOGUMTARIHI` date DEFAULT NULL,
  `BASLAMATARIHI` date DEFAULT NULL,
  `MAAS` decimal(15,2) DEFAULT NULL,
  `KULLANICIADI` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SIFRE` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personelbilgi`
--

INSERT INTO `personelbilgi` (`personelID`, `AD`, `SOYAD`, `TC`, `CINSIYET`, `ADRES`, `TELEFON`, `DOGUMTARIHI`, `BASLAMATARIHI`, `MAAS`, `KULLANICIADI`, `SIFRE`) VALUES
(1, 'Yusuf', 'Aktan', '11111111111', 0, 'Sultan Süleyman Mahallesi Barbaros Caddesi No: 34/4', '11111111111', '1994-06-16', '2015-05-01', '7000.00', 'yusuf', 'yusuf123'),
(2, 'Enes', 'Albayrak', '22222222222', 0, 'Kapıkulu Caddesi Altınok Mahallesi No: 65/3', '22222222222', '1993-05-21', '2019-03-01', '4500.00', 'enes', 'enes123'),
(3, 'Fatma', 'Altın', '33333333333', 1, 'Sıtkı Mahallesi Ferman Caddesi No: 64/2', '33333333333', '1998-03-02', '2021-04-01', '3000.00', 'fatma', 'fatma123'),
(4, 'Selen', 'Demir', '44444444444', 1, 'Taşkesen Mahallesi Alabora Caddesi No: 23/5', '44444444444', '1999-09-17', '2020-08-01', '4000.00', 'selen', 'selen123');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sikayetbilgi`
--

CREATE TABLE `sikayetbilgi` (
  `sikayetID` int(11) NOT NULL,
  `SIKAYET` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sikayetbilgi`
--

INSERT INTO `sikayetbilgi` (`sikayetID`, `SIKAYET`) VALUES
(1, 'Baş Ağrısı'),
(2, 'Bel Ağrısı'),
(3, 'Grip'),
(4, 'Korona'),
(5, 'Alerji'),
(6, 'Yüksek Ateş'),
(7, 'Eklem Ağrısı'),
(8, 'Astım'),
(9, 'Obezite'),
(10, 'Tansiyon'),
(11, 'Şeker'),
(12, 'Boğaz Ağrısı'),
(13, 'Burun Akıntısı'),
(14, 'Havale'),
(15, 'Halsizlik'),
(16, 'Migren'),
(17, 'Uçuk');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisbilgi`
--

CREATE TABLE `siparisbilgi` (
  `siparisID` int(11) NOT NULL,
  `SIPARISTARIHI` date DEFAULT NULL,
  `ADET` int(11) DEFAULT NULL,
  `ilacID` int(11) DEFAULT NULL,
  `nakFirmaBilgi` int(11) DEFAULT NULL,
  `personelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisbilgi`
--

INSERT INTO `siparisbilgi` (`siparisID`, `SIPARISTARIHI`, `ADET`, `ilacID`, `nakFirmaBilgi`, `personelID`) VALUES
(1, '2021-03-03', 50, 1, 3, 4),
(2, '2021-01-07', 50, 2, 2, 1),
(3, '2021-05-01', 50, 6, 1, 1),
(4, '2020-04-10', 25, 7, 3, 3),
(5, '2020-06-27', 50, 3, 2, 1),
(6, '2020-11-28', 150, 1, 1, 2),
(7, '2021-03-01', 100, 4, 3, 2),
(8, '2020-06-04', 50, 1, 4, 2),
(9, '2021-03-12', 100, 2, 4, 3),
(10, '2021-06-03', 50, 3, 5, 4),
(11, '2021-03-16', 40, 4, 5, 4),
(12, '2021-06-01', 30, 5, 6, 2),
(13, '2021-01-20', 70, 6, 6, 1),
(14, '2021-05-05', 100, 8, 7, 4),
(15, '2021-03-17', 50, 9, 7, 3);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `depobilgi`
--
ALTER TABLE `depobilgi`
  ADD PRIMARY KEY (`depoID`),
  ADD KEY `depoMudurID` (`depoMudurID`),
  ADD KEY `depoPersonelID` (`depoPersonelID`);

--
-- Tablo için indeksler `depomudur`
--
ALTER TABLE `depomudur`
  ADD PRIMARY KEY (`depoMudurID`);

--
-- Tablo için indeksler `depopersonel`
--
ALTER TABLE `depopersonel`
  ADD PRIMARY KEY (`depoPersonelID`);

--
-- Tablo için indeksler `hastabilgi`
--
ALTER TABLE `hastabilgi`
  ADD PRIMARY KEY (`hastaID`),
  ADD KEY `sikayetID` (`sikayetID`),
  ADD KEY `personelID` (`personelID`),
  ADD KEY `ilacID` (`ilacID`);

--
-- Tablo için indeksler `ilacbilgi`
--
ALTER TABLE `ilacbilgi`
  ADD PRIMARY KEY (`ilacID`),
  ADD KEY `kategoriID` (`kategoriID`),
  ADD KEY `depoID` (`depoID`),
  ADD KEY `ilacFirmaID` (`ilacFirmaID`);

--
-- Tablo için indeksler `ilacfirmabilgi`
--
ALTER TABLE `ilacfirmabilgi`
  ADD PRIMARY KEY (`ilacFirmaID`);

--
-- Tablo için indeksler `ilackategori`
--
ALTER TABLE `ilackategori`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Tablo için indeksler `nakliyecalisan`
--
ALTER TABLE `nakliyecalisan`
  ADD PRIMARY KEY (`nakCalisanID`),
  ADD KEY `nakFirmaBilgi` (`nakFirmaBilgi`);

--
-- Tablo için indeksler `nakliyefirma`
--
ALTER TABLE `nakliyefirma`
  ADD PRIMARY KEY (`nakFirmaBilgi`);

--
-- Tablo için indeksler `personelbilgi`
--
ALTER TABLE `personelbilgi`
  ADD PRIMARY KEY (`personelID`);

--
-- Tablo için indeksler `sikayetbilgi`
--
ALTER TABLE `sikayetbilgi`
  ADD PRIMARY KEY (`sikayetID`);

--
-- Tablo için indeksler `siparisbilgi`
--
ALTER TABLE `siparisbilgi`
  ADD PRIMARY KEY (`siparisID`),
  ADD KEY `ilacID` (`ilacID`),
  ADD KEY `nakFirmaBilgi` (`nakFirmaBilgi`),
  ADD KEY `personelID` (`personelID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `depobilgi`
--
ALTER TABLE `depobilgi`
  MODIFY `depoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `depomudur`
--
ALTER TABLE `depomudur`
  MODIFY `depoMudurID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `depopersonel`
--
ALTER TABLE `depopersonel`
  MODIFY `depoPersonelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `hastabilgi`
--
ALTER TABLE `hastabilgi`
  MODIFY `hastaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `ilacbilgi`
--
ALTER TABLE `ilacbilgi`
  MODIFY `ilacID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `ilacfirmabilgi`
--
ALTER TABLE `ilacfirmabilgi`
  MODIFY `ilacFirmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `ilackategori`
--
ALTER TABLE `ilackategori`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `nakliyecalisan`
--
ALTER TABLE `nakliyecalisan`
  MODIFY `nakCalisanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `nakliyefirma`
--
ALTER TABLE `nakliyefirma`
  MODIFY `nakFirmaBilgi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `personelbilgi`
--
ALTER TABLE `personelbilgi`
  MODIFY `personelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `sikayetbilgi`
--
ALTER TABLE `sikayetbilgi`
  MODIFY `sikayetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `siparisbilgi`
--
ALTER TABLE `siparisbilgi`
  MODIFY `siparisID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `depobilgi`
--
ALTER TABLE `depobilgi`
  ADD CONSTRAINT `depobilgi_ibfk_1` FOREIGN KEY (`depoPersonelID`) REFERENCES `depopersonel` (`depoPersonelID`),
  ADD CONSTRAINT `depobilgi_ibfk_2` FOREIGN KEY (`depoMudurID`) REFERENCES `depomudur` (`depoMudurID`);

--
-- Tablo kısıtlamaları `hastabilgi`
--
ALTER TABLE `hastabilgi`
  ADD CONSTRAINT `hastabilgi_ibfk_1` FOREIGN KEY (`sikayetID`) REFERENCES `sikayetbilgi` (`sikayetID`),
  ADD CONSTRAINT `hastabilgi_ibfk_2` FOREIGN KEY (`personelID`) REFERENCES `personelbilgi` (`personelID`),
  ADD CONSTRAINT `hastabilgi_ibfk_3` FOREIGN KEY (`ilacID`) REFERENCES `ilacbilgi` (`ilacID`);

--
-- Tablo kısıtlamaları `ilacbilgi`
--
ALTER TABLE `ilacbilgi`
  ADD CONSTRAINT `ilacbilgi_ibfk_1` FOREIGN KEY (`kategoriID`) REFERENCES `ilackategori` (`kategoriID`),
  ADD CONSTRAINT `ilacbilgi_ibfk_2` FOREIGN KEY (`depoID`) REFERENCES `depobilgi` (`depoID`),
  ADD CONSTRAINT `ilacbilgi_ibfk_3` FOREIGN KEY (`ilacFirmaID`) REFERENCES `ilacfirmabilgi` (`ilacFirmaID`);

--
-- Tablo kısıtlamaları `nakliyecalisan`
--
ALTER TABLE `nakliyecalisan`
  ADD CONSTRAINT `nakliyecalisan_ibfk_1` FOREIGN KEY (`nakFirmaBilgi`) REFERENCES `nakliyefirma` (`nakFirmaBilgi`);

--
-- Tablo kısıtlamaları `siparisbilgi`
--
ALTER TABLE `siparisbilgi`
  ADD CONSTRAINT `siparisbilgi_ibfk_1` FOREIGN KEY (`ilacID`) REFERENCES `ilacbilgi` (`ilacID`),
  ADD CONSTRAINT `siparisbilgi_ibfk_2` FOREIGN KEY (`nakFirmaBilgi`) REFERENCES `nakliyefirma` (`nakFirmaBilgi`),
  ADD CONSTRAINT `siparisbilgi_ibfk_3` FOREIGN KEY (`personelID`) REFERENCES `personelbilgi` (`personelID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
