#include <stdio.h>
#include <string.h>
int main()
{
 FILE *dosya;
 char ad[32];
 char soyad[32];
 int yas;
 float maas;
 int found = 0;
 // Dosyayı aç
 dosya = fopen("kayit.txt", "wt");
 if (!dosya)
 {
 printf("Dosya acilamadi\n\a\a");
 return -1;
 }
 // Verileri oku ve kaydet
 // Oku
 printf("Ad: "); scanf("%s", ad);
 printf("Soyad: "); scanf("%s", soyad);
 printf("Yas: "); scanf("%d", &yas);
 printf("Maas: "); scanf("%f", &maas);
 printf("\n");
 // Kaydet
 fprintf(dosya, "%s\t%s\t%d\t%f\n", ad, soyad, yas, maas);
 
 // Dosyayı kapat
 fclose(dosya);
 return 0;
}
