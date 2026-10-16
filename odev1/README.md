# 🏥 Veritabanı Yönetim Sistemleri - Ders Sonu Ödevi 1

Bu depo, **Veritabanı Yönetim Sistemleri** dersi kapsamında hazırlanan **Hastane Otomasyonu Prototipi** veritabanı tasarımını, ER (Varlık-İlişki) diyagramını ve MSSQL (T-SQL) şemasını içermektedir.

---

## 👥 Proje Ekibi
* **Yusuf Sercan İşçi**
* **İlhan Sami Adaklı**

---

## 📌 Problem Tanımı ve İş Kuralları

Ödev kapsamında belirtilen varlıklar (Hasta, Doktor, Poliklinik, Laboratuvar, Tahlil, Hemşire, Servis) ve kurallar doğrultusunda ilişkisel şema kurgulanmıştır:

1. **Doktorlar & Poliklinikler (1:N):** Bir poliklinikte birden fazla doktor çalışabilir; bir doktor yalnızca tek bir polikliniğe bağlıdır.
2. **Hastalar & Poliklinikler (N:M):** Hastalar polikliniklerde muayene olur. Bu çok-a-çok ilişki `Muayene` ara tablosu ile modellenmiş, gerçek hayat senaryosuna uygun olarak muayeneyi yapan `doktor_id` bilgisi de eklenmiştir.
3. **Hastalar & Tahliller & Doktorlar (N:M):** Hastalar tahlil yaptırabilir ve bu tahlilleri doktorlar talep eder. Bu ilişki `Hasta_Tahlil` (İstem) ara tablosu üzerinden kurulmuştur.
4. **Tahliller & Laboratuvarlar (1:N):** Tahliller laboratuvarlarda gerçekleştirilir; bir tahlil yalnızca bir laboratuvara aittir.
5. **Hemşireler & Servisler (1:N):** Hemşireler servislerde görev alır. Bir serviste birden fazla hemşire çalışabilir ancak bir hemşire yalnızca tek bir servise hizmet verir.
6. **Servisler & Poliklinikler (1:N):** Servisler polikliniklere bağlıdır. Bir polikliniğin birden fazla servisi bulunabilir.

---

## 🗺️ Varlık-İlişki (ER) Diyagramı

Aşağıdaki şema **dbdiagram.io** üzerinde modellenmiş olup yabancı anahtarlar (FK) ve birincil anahtarlar (PK) ilişkileri görselleştirilmiştir:

![Hastane ER Diyagramı](hastane_er_diyagrami.png)

---

## 🛠️ Kullanılan Teknolojiler ve Standartlar

* **Veritabanı Motoru:** Microsoft SQL Server (MSSQL / T-SQL)
* **Yönetim Aracı:** SQL Server Management Studio (SSMS)
* **Tasarım Aracı:** dbdiagram.io
* **Veri Tipleri & Kurallar:**
  * Kimlik alanlarında `IDENTITY(1,1)` ile otomatik artan tekil anahtarlar kullanılmıştır.
  * Türkçe karakter uyumluluğu için metin alanlarında `NVARCHAR` standardı benimsenmiştir.
  * T.C. Kimlik numarası `CHAR(11)` ve `UNIQUE` kısıtıyla korunmuştur.
  * Tablolar arası bütünlük yabancı anahtar (`FOREIGN KEY`) kısıtları ile garanti altına alınmıştır.

---

## 📂 Depo İçeriği

* `hastane_er_diyagrami.png`: İlişkisel veritabanı mimarisini gösteren ER diyagramı.
* `hastane_veritabani_semasi.sql`: Veritabanını, tabloları ve tüm kısıtları oluşturan çalıştırılabilir T-SQL betiği.
