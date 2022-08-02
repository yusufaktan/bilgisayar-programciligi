#include <stdio.h> 

void toplamBul(int sayi1[], int sayi2[], int* toplam);

int main() 
{ 
    
    int sayi1[30]; 
    int sayi2[30];
    int toplam[33];

    printf("Birinci numarayı girin (30 basamaklı): ");
    for(int i = 0; i < 30; i++) { 
        scanf("%1d", &sayi1[i]); 
    } 

    printf("İkinci numarayı girin (30 basamaklı): ");
    for(int i = 0; i < 30; i++) { 
        scanf("%1d", &sayi2[i]); 
    } 
  
    toplamBul(sayi1, sayi2, toplam);

    printf("Toplam: ");
    for(int i=0; i<33; i++){
        if ( i <= 2 && toplam[i] == 0 ) continue;
        printf("%d", toplam[i]);
    }

    printf("\n");
      
    return 0; 
} 

void toplamBul(int sayi1[], int sayi2[], int* toplam){

    int elde = 0;
    int basamakToplam = 0;
    int i = 0;
    for( i = 29; i>=0; i--){
        basamakToplam = sayi1[i] + sayi2[i] + elde;
        elde = basamakToplam / 10;
        basamakToplam %= 10;
        toplam[i+3] = basamakToplam;
    }

    basamakToplam = 0;
    while(elde>0){
        basamakToplam += elde;
        elde = basamakToplam / 10;
        basamakToplam %= 10;
        toplam[i+3] = basamakToplam;
        i--;
    }
}