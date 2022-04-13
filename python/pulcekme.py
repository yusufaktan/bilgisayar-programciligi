#Kodu yazarken bana kolaylık sağlaması için 2 atama ve ufak bir kişiselleştirme.
print("SON PULU ÇEKEN KAZANIR !\n--------" )
x=int(input("Çekilecek toplam pul sayısı :"))
y=int(input("Çekilecek maksimum pul sayısı :"))
print("--------\nOYUN BAŞLADI\n--------")

#Fonksiyon başlangıcı
def pul_kaldirma_oyna (x,y):
    while x>0:
        oyuncu1=int(input("1. oyuncu kaç pul çekmek istiyorsun ? ="))
        while (oyuncu1<=0 or oyuncu1>y): #Hatalı ifadeler girilmesine karşılık aldığım önlemler
            if oyuncu1>y:
                print("Maksimum pul sayısından fazla pul çekemezsin")
            oyuncu1=int(input("1. oyuncu kaç pul çekmek istiyorsun ? ="))
        x=x-oyuncu1
        print("Kalan pul sayısı =",x)  #Ekrana ortada kalan pul sayısının yazılması.
        if(x<=0):
            print("1. oyuncu\nKAZANDINIZ!")
            break

        oyuncu2=int(input("2. oyuncu kaç pul çekmek istiyorsun ? ="))
        while (oyuncu2<=0 or oyuncu2>y):
            if oyuncu2>y:
                print("Maksimum pul sayısından fazla pul çekemezsin")
            oyuncu2=int(input("2. oyuncu kaç pul çekmek istiyorsun ? ="))
        x=x-oyuncu2
        print("Kalan pul sayısı",x)
        if(x<=0):

            print("2. oyuncu\nKAZANDINIZ!")

#Sıfır pul girilmesine karşılık aldığım önlem.
if x<=0:
    print("Lütfen sıfırdan büyük bir sayı giriniz.")

pul_kaldirma_oyna(x,y)