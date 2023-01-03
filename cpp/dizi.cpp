#include <stdio.h> 
int toplamBul(int sayi[], int n);
int main() 
{ 
 int sayi[3] = {2,3,1};
 for(int i=0;i<=2;i++)
 printf("Dizinin %d. elemani= %d\n",i,sayi[i]);
 int toplam = toplamBul(sayi, sizeof(sayi)/sizeof(sayi[0]));
 printf("Dizi Elemanlari Toplami : %d\n", toplam);
 return 0;
}
int toplamBul(int sayi[], int n){
 int toplam = 0;
 for(int i=0; i<n; i++){
 toplam += sayi[i];
 }
 return toplam;
}