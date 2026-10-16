# 🏨 Otel Rezervasyon ve Konaklama Yönetim Sistemi

Bu depo, **Veritabanı Yönetim Sistemleri** dersi dönem projesi kapsamında geliştirilen **Otel Rezervasyon ve Konaklama Yönetim Sistemi**'nin veritabanı mimarisini, backend API servislerini ve kullanıcı arayüzünü içermektedir.

---

## 👥 Proje Ekibi
* **Yusuf Sercan İşçi** - 455142
* **İlhan Sami Adaklı** - [İlhan'ın Öğrenci Numarası]

---

## 🛠️ Teknoloji Yığını (Tech Stack)
* **Veritabanı (DBMS):** Microsoft SQL Server (MSSQL / T-SQL)
* **Backend:** Spring Boot (Java) *(veya .NET / Flask - hangisini seçtiyseniz)*
* **Frontend:** [React / Vue / HTML-CSS-JS]
* **Veritabanı Tasarım Aracı:** dbdiagram.io
* **API Test & Dokümantasyon:** Swagger / Postman

---

## 📌 Proje Kapsamı ve Veritabanı Gereksinimleri

Proje, 3NF normalizasyon kurallarına uygun olarak tasarlanan ilişkisel şema üzerinde çalışmaktadır.

### 1. Temel Tablolar (En az 13 Tablo)
1. `OdaTipi`: Kapasite, açıklama, temel fiyat
2. `Oda`: Numara, kat, oda tipi, durum (boş, dolu, temizlikte, bakımda)
3. `SezonFiyati`: Oda tipi, başlangıç-bitiş tarihi, gecelik fiyat
4. `Misafir`: Ad, soyad, TC/pasaport, telefon, e-posta, doğum tarihi
5. `Kullanici`: Kimlik doğrulama, roller (misafir, resepsiyon, yönetici)
6. `Personel`: Görev, işe giriş tarihi
7. `Rezervasyon`: Tarihler, kişi sayısı, rezervasyon durumu
8. `Konaklama`: Check-in / check-out gerçekleşme zamanları
9. `EkHizmet`: Hizmet adı, birim fiyat
10. `KonaklamaHizmeti`: Alınan ek hizmetler, adet, tarih
11. `Odeme`: Tutar, ödeme türü, işlem tarihi
12. `TemizlikKaydi`: Oda, görevli personel, temizlik durumu
13. `IslemLog`: Tetikleyicilerle tutulan denetim günlüğü

---

### 2. Kritik İş Kuralları & Veritabanı Nesneleri
* **Çakışan Rezervasyon Engeli (TRIGGER):** Aynı odanın çakışan tarihlerde çift rezerve edilmesi veritabanı seviyesinde engellenir.
* **Oda Durum Yönetimi (TRIGGER):** Check-in işleminde oda "dolu", check-out işleminde "temizlikte" yapılır.
* **Denetim Günlüğü (TRIGGER):** Rezervasyon ve ödeme hareketleri `IslemLog` tablosuna otomatik loglanır.
* **Saklı Prosedürler (STORED PROCEDURE):**
  * Boş oda sorgulama (tarih aralığı ve oda tipine göre)
  * Toplam konaklama tutarı hesaplama (sezon fiyatları + ek hizmetler)
  * Aylık doluluk oranı ve gelir raporu üretme
* **Görünümler (VIEW):** Günlük giriş/çıkış listesi ve oda temizlik takip ekranları.
* **İşlem Güvenliği (TRANSACTION):** Check-out süreci tek bir transaction içinde işletilerek veri tutarlılığı güvenceye alınır (ROLLBACK/COMMIT).

---

## 📂 Dizin Yapısı
* `/odev1`: Ders sonu ödevi (Hastane Otomasyonu ER Şeması ve SQL betikleri)
* `/database`: Otel projesine ait DDL betikleri, Trigger, Stored Procedure ve örnek test verileri
* `/backend`: REST API kaynak kodları
* `/frontend`: Kullanıcı ve yönetim paneli arayüz kodları
