import random
while True:
    f=input("[Oyuncu 1] - İsminizi giriniz : ")
    g=input("[Oyuncu 2] - İsminizi giriniz : ")
    print("-----------------------------------------")

    x=0
    y=0

    kartlar1 = range(1,100)
    a=random.sample(kartlar1,5)
    print(f,"Adlı Oyuncunun Destesi = ",a)

    kartlar2= range(1,100)
    b=random.sample(kartlar2,5)
    print(g,"Adlı Oyuncunun Destesi = ",b)


    def mergeSort(a):
        if len(a) > 1:
            orta = len(a) // 2
            sol = a[:orta]
            sag = a[orta:]
            mergeSort(sol)
            mergeSort(sag)
            i = 0
            j = 0
            k = 0
            while i < len(sol) and j < len(sag):
                if sol[i] < sag[j]:
                    a[k] = sol[i]
                    i += 1
                else:
                    a[k] = sag[j]
                    j += 1
                k += 1
            while i < len(sol):
                a[k] =sol[i]
                i += 1
                k += 1
            while j < len(sag):
                a[k] = sag[j]
                j += 1
                k += 1

    print("-----------------------------------------")
    input("DESTELERİ SIRALAMAK İÇİN 'ENTER' TUŞUNA BASINIZ")
    print("-----------------------------------------")
    mergeSort(a)
    print(f,"Adlı Oyuncunun sıralanmış destesi = ",a)
    mergeSort(b)
    print(g,"Adlı Oyuncunun sıralanmış destesi = ",b)
    print("-----------------------------------------")
    input("OYUN BAŞLIYOR\n-----------------------------------------\nİLK TUR İÇİN 'ENTER' TUŞUNA BASINIZ")
    print("-----------------------------------------")

    print("1.TUR")
    print("-----------------------------------------")
    if (a[0]>b[0]):
        print(f,"Adlı Oyuncunun Kartı = ", a[0])
        print(g,"Adlı Oyuncunun Kartı = ", b[0], "\n")

        x = x + 1
        print(f, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)
    else:
        print(f,"Adlı Oyuncunun Kartı = ", a[0])
        print(g,"Adlı Oyuncunun Kartı = ", b[0],"\n")

        y = y + 1
        print(g, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)

    print("-----------------------------------------")
    input("2. TUR İÇİN 'ENTER' TUŞUNA BASIN")
    print("-----------------------------------------")

    if (a[1] > b[1]):
        print(f,"Adlı Oyuncunun Kartı = ", a[1])
        print(g,"Adlı Oyuncunun Kartı = ", b[1], "\n")

        x = x + 1
        print(f, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)
    else:
        print(f,"Adlı Oyuncunun Kartı = ", a[1])
        print(g,"Adlı Oyuncunun Kartı = ", b[1], "\n")

        y = y + 1
        print(g, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)

    print("-----------------------------------------")
    input("3. TUR İÇİN 'ENTER' TUŞUNA BASIN")
    print("-----------------------------------------")

    if (a[2] > b[2]):
        print(f,"Adlı Oyuncunun Kartı = ", a[2])
        print(g,"Adlı Oyuncunun Kartı = ", b[2], "\n")

        x = x + 1
        print(f, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)
    else:
        print(f,"Adlı Oyuncunun Kartı = ", a[2])
        print(g,"Adlı Oyuncunun Kartı = ", b[2], "\n")

        y = y + 1
        print(g, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)

    print("-----------------------------------------")
    input("4. TUR İÇİN 'ENTER' TUŞUNA BASIN")
    print("-----------------------------------------")

    if (a[3] > b[3]):
        print(f,"Adlı Oyuncunun Kartı = ", a[3])
        print(g,"Adlı Oyuncunun Kartı = ", b[3], "\n")

        x = x + 1
        print(f,"1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)
    else:
        print(f,"Adlı Oyuncunun Kartı = ", a[3])
        print(g,"Adlı Oyuncunun Kartı = ", b[3], "\n")

        y = y + 1
        print(g, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)

    print("-----------------------------------------")
    input("5. TUR İÇİN 'ENTER' TUŞUNA BASIN")
    print("-----------------------------------------")

    if (a[4] > b[4]):
        print(f,"Adlı Oyuncunun Kartı = ", a[4])
        print(g,"Adlı Oyuncunun Kartı = ", b[4], "\n")

        x = x + 1
        print(f, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)
    else:
        print(f,"Adlı Oyuncunun Kartı = ", a[4])
        print(g,"Adlı Oyuncunun Kartı = ", b[4], "\n")

        y = y + 1
        print(g, "1 PUAN KAZANDI")
        print("SKOR =", f, ">", x, "--", y, "<", g)

    print("OYUN BİTTİ")
    print("-----------------------------------------")

    if (x>y):
        print(f,"KAZANDI")
        print("-----------------------------------------")
    else:
        print(g,"KAZANDI")
        print("-----------------------------------------")

    t=input("OYUNDAN ÇIKMAK İÇİN 'H'\nDEVAM ETMEK İÇİN 'E' TUŞUNA BASINIZ : ")
    if (t=='H' or t=='h'):
        break
    else:
        continue