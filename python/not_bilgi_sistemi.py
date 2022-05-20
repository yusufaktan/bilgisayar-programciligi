szl3 = {'191216013': {'vize1': 190, 'kisasinav1': 100, 'kisasinav2': 100, 'final': 590, 'odev1': 110, 'odev2': 10,
                      'proje': 400, 'Not Ort.': "CB", 'Not Yüz': 75},
        '191216035': {'vize1': 200, 'kisasinav1': 100, 'kisasinav2': 100, 'final': 600, 'odev1': 200, 'odev2': 200,
                      'proje': 400, 'Not Ort.': "AA", 'Not Yüz': 100}}
ortalama={'191216013':{'BA'},'191216035':{'AA'}}
ogryuzz={'191216013':{'Not Yüz':75},'191216035':{'Not Yüz':100}}
#Sözlüğü GLOBAL Olarak Atıyoruz.

#ÖĞRENCİ EKLEME İŞLEMİ
def ogrekle(okulno,vize1,kisasinav1,kisasinav2,final,ödev1,ödev2,proje,notort,notyuz):
    szl3 = {okulno:{vize1,kisasinav1,kisasinav2,final,ödev1,ödev2,proje,notort,notyuz}}
    ortalama={okulno:{notort}}
    ogryuz={okulno:{notyuz}}
    print("Başarıyla Eklenmiştir")
    print(ortalama)
    #Yukarıda aldığımız değişken verileriyle kullanıcıdan giriş sağlıyoruz ve başarıyla eklenmiştir mesajı veriyoruz
    #Aynı zamanda 3 farklı tabloyada girişini sağlıyoruz ilerde kullanılabilmesi açısından.
#ÖĞRENCİ HARF NOTU GÖRME İŞLEMİ
def ogrgor():
    okulno=input("Görmek İstediğiniz Öğrencinin Numarasını Giriniz ?")
    if(ortalama.get(okulno)==None):
        print("Böyle Bir Öğrenci Bulunmamaktadır.")#EĞER O NUMARAYLA KULLANICI YOKSA PROGRAM HATA MESAJIMIZ İLE KAPANIR.
        exit()
    else:
        print(ortalama[okulno])
    #Yukarıda da oluşturduğumuz sözlükten verileri okulno değişkeni ile çekiyoruz
#ÖĞRENCİ NOTUNU YÜZLÜK TABANDA GÖRME İŞLEMİ EĞER O NUMARAYLA BİRİ YOKSA HATA MESAJIMIZ İLE PROGRAM KAPANIR.
def ogryuz():
    okulnoo=input("Öğrenci Numarasını Giriniz ?")
    if (ogryuzz.get(okulnoo) == None):
        print("Geçersiz Değer Sözlükte Böyle Bir Numaralı Kayıt Yok")
        exit()
    else:
        print(ogryuzz[okulnoo])
#ÖĞRENCİ SİLME İŞLEMİ GEÇERSİZ GİRİŞTE MESAJIMIZ İLE PROGRAM KAPANIR
def ogrsil():
    no=input("Silmek İstediğiniz Öğrencinin Numarasını Giriniz.")
    if(szl3.get(no)==None):
        print("Geçersiz Değer Sözlükte Böyle Bir Numaralı Kayıt Yok")
        exit()
    else:
        szl3.pop(no)
        ortalama.pop(no)
        ogryuzz.pop(no)
        print(no,"Numaralı Öğrenci Silinmiştir.")

#ÖĞRENCİ GÜNCELLEME İŞLEMİ GEÇERSİZ GİRİŞTE PROGRAM MESAJIMIZ İLE KAPANIR.
def ogrguncelle():
    #Öğrencinin yeni bilgilerini szl4 isimli sözlüğümüze alıyoruz.
    guncel=input("Hangi Öğrencinin Notunu Değiştirmek İstiyorsunuz")
    if (szl3.get(guncel) == None):
        print("Geçersiz Değer Sözlükte Böyle Bir Numaralı Kayıt Yok")
        exit()
    else:
        vize1 = int(input("Öğrenci 1.Vizesi Kaç ?"))
        kisasinav1 = int(input("Öğrenci 1.Kısa Sınav Notu Kaçtır ?"))
        kisasinav2 = int(input("Öğrenci 2.Kısa Sınav Notu Kaçtır ?"))
        final = int(input("Öğrenci Final Notu Kaç ?"))
        ödev1 = int(input("Öğrenci 1.Ödev Notu Kaç ?"))
        ödev2 = int(input("Öğrenci 2.Ödev Notu Kaç ?"))
        proje = int(input("Öğrenci Proje Notu Kaç ?"))
        nottoplam = vize1 + kisasinav1 + kisasinav2 + final + ödev1 + ödev2 + proje
        notort = nottoplam / 20
        notyuz = notort

        if (notort <= 100):
            if (notort >= 90):
                notort = "AA"
            elif (notort >= 80):
                notort = "BA"
            elif (notort >= 70):
                notort = "BB"
            elif (notort >= 60):
                notort = "CB"
            elif (notort >= 50):
                notort = "CC"
            elif (notort >= 40):
                notort = "DC"
            elif (notort >= 20):
                notort = "DD"
            elif (notort > 0):
                notort = "FF"
        else:
            print("Yanlış Not Girişi Yapıldı")
            exit()
        szl4 = {guncel: {"vize1":vize1,"kisasinav1":kisasinav1,"kisasinav2":kisasinav2,"ödev1":ödev1,"ödev2":ödev2,"proje":proje,"Not Ort.":notort,"Not Yüz":notyuz}}
        szl3.update(szl4)
        ortalama={guncel:{"Not Ort.":notort}}
        ogryuzz={guncel:{"Not Yuz":notyuz}}
        print(szl3)
        print("Değerler Güncellenmiştir.")

#---------------------------------------------------FONKSİYONLAR BİTİMİ----------------------------------------------------------------------------------------------------------------------------------

print("1=Öğrenci Ekleme")
print("2=Öğrenci Harf Notu Görme")
print("3=Yüzlük Sistemde Öğrenci Notu Görme")
print("4=Öğrenci Silme")
print("5=Öğrenci Notu Güncelleme")
print("Çıkmak İçin = Bunlar dışında bir şeye basınız.")
menu=input("Merhabalar, Hangi İşlemi Yapmak İstersiniz ?")
#Menu Değeri İsteniyor
#Yeni Öğrenci Girişi Yapılıyor Eğer Daha Önce Girilmişse Güncelleme Ekranını Kullanmasını Söylüyoruz.
if (menu=="1"):
        okulno =input("Öğrenci Okul Numarası Nedir ?")
        if (szl3.get(okulno) == None):#Eğer benzersiz ise kod çalışsın ve notlarını eklesin diyoruz.
            vize1 = int(input("Öğrenci 1.Vizesi Kaç ?"))
            kisasinav1 = int(input("Öğrenci 1.Kısa Sınav Notu Kaçtır ?"))
            kisasinav2 = int(input("Öğrenci 2.Kısa Sınav Notu Kaçtır ?"))
            final = int(input("Öğrenci Final Notu Kaç ?"))
            ödev1 = int(input("Öğrenci 1.Ödev Notu Kaç ?"))
            ödev2 = int(input("Öğrenci 2.Ödev Notu Kaç ?"))
            proje = int(input("Öğrenci Proje Notu Kaç ?"))
            nottoplam = vize1 + kisasinav1 + kisasinav2 + final + ödev1 + ödev2 + proje
            #Tüm Sınav Notlarını Topluyoruz
            notort = nottoplam / 20
            #notort değişkenine 20ye bölüp ekliyoruz böylece yüzlük sistem olarak görebiliyoruz.
            #notyuz değişkeninede bunu atıyoruz ve if ile kontrollerini sağlıyoruz.
            notyuz = notort
            if (notort <= 100):
                if (notort >= 90):
                    notort = "AA"
                elif (notort >= 80):
                    notort = "BA"
                elif (notort >= 70):
                    notort = "BB"
                elif (notort >= 60):
                    notort = "CB"
                elif (notort >= 50):
                    notort = "CC"
                elif (notort >= 40):
                    notort = "DC"
                elif (notort >= 20):
                    notort = "DD"
                elif (notort > 0):
                    notort = "FF"
            #Değerler ile fonksiyon çağırılıyor.
            ogrekle(okulno, vize1, kisasinav1, kisasinav2, final, ödev1, ödev2, proje, notort, notyuz)
        else:
            print("Bu Numarayla Daha Önce Öğrenci Kayıtı Yapılmıştır Güncelleme Ekranını Kullanmalısın.")
#Öğrenci Numarasıyla Notlarını Harflerle Görünmesi Sağlanıyor
elif(menu=="2"):
    ogrgor()
#Öğrenci Numarasıyla Notlarını Yüzlük Sisteme Göre Görmeleri Sağlanıyor
elif(menu=="3"):
    ogryuz()
#Öğrenci Silme İşlemi Yapılıyor
elif(menu=="4"):
    ogrsil()
#Öğrenci Güncelleme İşlemi Yapılıyor
elif(menu=="5"):
    ogrguncelle()
#Geçersiz Bir Değer İle Programı Kapatıyoruz.
else:
    print("Geçersiz Bir Değer Girdin")
    exit()

