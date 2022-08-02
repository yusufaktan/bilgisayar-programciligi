#include <stdio.h>

#define ESAYISI 5

float elemanlar[ESAYISI];

float ToplamHesapla(int sayi, float toplam){
  if (sayi <= 0) return toplam;
  toplam += elemanlar[sayi-1];
  return ToplamHesapla(sayi-1, toplam);
}

float CarpimHesapla(int sayi, float carpim){
  if (sayi <= 0) return carpim;
  carpim *= elemanlar[sayi-1];
  return CarpimHesapla(sayi-1, carpim);
}

void SayilariAl(int gidilecek, int simdiki){
  if (simdiki >= gidilecek) return;
  printf("%d. sayiyi giriniz: ", simdiki+1);
  float alinanSayi=0;
  if (scanf("%f", &alinanSayi) == 1){
  	elemanlar[simdiki] = alinanSayi;
  	SayilariAl(gidilecek, simdiki+1);
  }else{
    while (fgetc(stdin) != '\n');
    printf("Hatali giris. Lutfen tekrar giriniz.\n");
    SayilariAl(gidilecek, simdiki);
  }
  return;
}

int main(void) {
  SayilariAl(ESAYISI, 0);
  printf("Girilen sayilarin carpimlari: %.2f\n", CarpimHesapla(ESAYISI, 1));
  printf("Girilen sayilarin toplamlari: %.2f\n", ToplamHesapla(ESAYISI, 0));
  return 0;
}
