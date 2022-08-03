while True: #Oyunun çıkış komutu verilene kadar devam etmesini sağlar
    liste=[]
    liste.append("Ayse")
    liste.append("Ali")
    liste.append("Ozgur")
    liste.append("Cem")
    liste.append("Melis")        #listeye eleman ekleme
    liste.append("Suna")
    liste.append("Derya")
    liste.append("Aykut")
    liste.append("Duygu")
    liste.append("Seref")

    print("Sıcak Patates Başlıyor !\n-----------------------------------")
    elemansayisi=len(liste)  #listedeki elemanlarin sayisi
    print(liste,"- [ Oyuncu Sayısı = ",elemansayisi,"]\n-----------------------------------")  #listeyi ve eleman sayisini ekrana bastirma

    ilk=0
    son=10
    sum=0

    while(sum!=1): #son 1 kişi kalana kadar oyunun devam etmesini sağlıyor
        tur = 3
        while(tur>0): #ilk turun bitmesi için 3 sayı alınmasını sağlıyor
            alinan = int(input("Sayı söyle ! = "))
            tur = tur - 1    #kullanıcıdan sayı alınıyor ve tur 1 eksiltilerek oyun devam ediyor
            while (alinan>0):  #alınan sayı sıfırdan büyükse gerekli işlemler yapılıyor
                x=liste[ilk]
                liste.append(x)
                ilk=ilk+1
                son=son+1
                alinan=alinan-1
                print(liste[ilk:son])
                sum=son-ilk
            if (alinan<0): #alınan sayı sıfırdan küçükse yeni sayı girilmesi sağlanıyor
                tur = tur + 1
            elif (tur==0): #3 turun sonunda baştaki kişi kuyruktan çıkarılıyor
                print("Elenen kişi = ",liste[ilk])
                ilk=ilk+1
                elemansayisi=elemansayisi-1
                print("Güncel liste ==> ",liste[ilk:son],"- [ Oyuncu Sayısı = ",elemansayisi,"]\n-----------------------------------")
                sum=son-ilk
                if (sum == 1): #sona kalan kişi oyunu kazanıyor
                    print("SONA KALAN = ", liste[ilk:son],"KAZANDI !")
                    print("-----------------------------------")
                    cikis=input("Çıkmak için X'i tuşlayınız\nTekrar oynamak için farklı bir tuşlama yapınız = ")

    if (cikis=="X" or cikis=="x"):
        exit()        #kullanıcı seçimi - oyundan çıkma veya tekrar oynama
    else:
        continue