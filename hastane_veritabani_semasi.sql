-- 1. Veritabaný oluþturma
CREATE DATABASE HastaneOtomasyonu;
GO

USE HastaneOtomasyonu;
GO

-- 2. Poliklinik Tablosu
CREATE TABLE Poliklinik (
    poliklinik_id INT IDENTITY(1,1) PRIMARY KEY,
    poliklinik_adi NVARCHAR(100) NOT NULL,
    kat INT
);
GO

-- 3. Doktor Tablosu (Kural 1: Poliklinik - Doktor 1:N)
CREATE TABLE Doktor (
    doktor_id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    uzmanlik NVARCHAR(100),
    poliklinik_id INT NOT NULL,
    CONSTRAINT FK_Doktor_Poliklinik FOREIGN KEY (poliklinik_id) REFERENCES Poliklinik(poliklinik_id)
);
GO

-- 4. Hasta Tablosu
CREATE TABLE Hasta (
    hasta_id INT IDENTITY(1,1) PRIMARY KEY,
    tc_no CHAR(11) NOT NULL UNIQUE,
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    dogum_tarihi DATE,
    telefon VARCHAR(20)
);
GO

-- 5. Servis Tablosu (Kural 6: Poliklinik - Servis 1:N)
CREATE TABLE Servis (
    servis_id INT IDENTITY(1,1) PRIMARY KEY,
    servis_adi NVARCHAR(100) NOT NULL,
    yatak_kapasitesi INT,
    poliklinik_id INT NOT NULL,
    CONSTRAINT FK_Servis_Poliklinik FOREIGN KEY (poliklinik_id) REFERENCES Poliklinik(poliklinik_id)
);
GO

-- 6. Hemsire Tablosu (Kural 5: Servis - Hemsire 1:N)
CREATE TABLE Hemsire (
    hemsire_id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(50) NOT NULL,
    soyad NVARCHAR(50) NOT NULL,
    telefon VARCHAR(20),
    servis_id INT NOT NULL,
    CONSTRAINT FK_Hemsire_Servis FOREIGN KEY (servis_id) REFERENCES Servis(servis_id)
);
GO

-- 7. Muayene Tablosu (Kural 2: Hasta ile Poliklinik/Doktor N:M iliþkisinin ara tablosu)
CREATE TABLE Muayene (
    muayene_id INT IDENTITY(1,1) PRIMARY KEY,
    hasta_id INT NOT NULL,
    poliklinik_id INT NOT NULL,
    doktor_id INT NULL, -- Usta tavsiyesi: Muayeneyi yapan doktoru da bilmek gerçek hayatta þarttýr
    muayene_tarihi DATETIME NOT NULL DEFAULT GETDATE(),
    tani NVARCHAR(MAX),
    CONSTRAINT FK_Muayene_Hasta FOREIGN KEY (hasta_id) REFERENCES Hasta(hasta_id),
    CONSTRAINT FK_Muayene_Poliklinik FOREIGN KEY (poliklinik_id) REFERENCES Poliklinik(poliklinik_id),
    CONSTRAINT FK_Muayene_Doktor FOREIGN KEY (doktor_id) REFERENCES Doktor(doktor_id)
);
GO

-- 8. Laboratuvar Tablosu
CREATE TABLE Laboratuvar (
    lab_id INT IDENTITY(1,1) PRIMARY KEY,
    lab_adi NVARCHAR(100) NOT NULL,
    konum NVARCHAR(100)
);
GO

-- 9. Tahlil Tablosu (Kural 4: Laboratuvar - Tahlil 1:N)
CREATE TABLE Tahlil (
    tahlil_id INT IDENTITY(1,1) PRIMARY KEY,
    tahlil_adi NVARCHAR(100) NOT NULL,
    aciklama NVARCHAR(255),
    lab_id INT NOT NULL,
    CONSTRAINT FK_Tahlil_Laboratuvar FOREIGN KEY (lab_id) REFERENCES Laboratuvar(lab_id)
);
GO

-- 10. Hasta_Tahlil Tablosu (Kural 3: Hastalar tahlil yaptýrýr, doktorlar ister N:M)
CREATE TABLE Hasta_Tahlil (
    istem_id INT IDENTITY(1,1) PRIMARY KEY,
    hasta_id INT NOT NULL,
    tahlil_id INT NOT NULL,
    doktor_id INT NOT NULL,
    istem_tarihi DATETIME NOT NULL DEFAULT GETDATE(),
    sonuc NVARCHAR(MAX),
    CONSTRAINT FK_HastaTahlil_Hasta FOREIGN KEY (hasta_id) REFERENCES Hasta(hasta_id),
    CONSTRAINT FK_HastaTahlil_Tahlil FOREIGN KEY (tahlil_id) REFERENCES Tahlil(tahlil_id),
    CONSTRAINT FK_HastaTahlil_Doktor FOREIGN KEY (doktor_id) REFERENCES Doktor(doktor_id)
);
GO
