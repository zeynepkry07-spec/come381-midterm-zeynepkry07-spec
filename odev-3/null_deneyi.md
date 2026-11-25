# NULL Deneyleri

## Deney 1: NULL karşılaştırması

### Tahmin
phone = NULL sorgusunun kayıt döndürmeyeceğini,
phone IS NULL sorgusunun 3 kayıt döndüreceğini tahmin ediyorum.

### Gerçek sonuç
```text
SELECT full_name FROM customer WHERE phone = NULL;
 full_name 
-----------
(0 satır)

SELECT full_name FROM customer WHERE phone IS NULL;
  full_name   
--------------
 Mehmet Kaya
 Can Arslan
 Selin Öztürk
(3 satır)

```

### Yorum
NULL bilinmeyen veya eksik bir değeri temsil eder.
NULL kontrolü için eşittir yerine IS NULL kullanılmalıdır.

## Deney 2: COUNT ve NULL

### Tahmin
COUNT(*) sonucunun 8, COUNT(age) sonucunun 6
olacağını tahmin ediyorum.

### Gerçek sonuç
```text
SELECT COUNT(*) AS toplam, COUNT(age) AS yasi_bilinen FROM customer;
 toplam | yasi_bilinen 
--------+--------------
      8 |            6
(1 satır)

```

### Yorum
COUNT(*) bütün satırları sayar.
COUNT(age) ise yalnızca NULL olmayan yaş değerlerini sayar.
