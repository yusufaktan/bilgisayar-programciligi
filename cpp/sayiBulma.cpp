#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define ANLIK_KAPASITE 2
void yazdir(int *arr, int kapasite);
void ekle(int *arr, int yer, int deger, int *buyukluk, int *kapasite){
 if(*buyukluk > *kapasite){
 realloc(arr, sizeof(arr) * 2);
 *kapasite = sizeof(arr) * 2;
 }
 arr[yer] = deger;
 *buyukluk = *buyukluk + 1;
}
int main() {
 int buyukluk = 0;
 int yer = 0;
 int kapasite = ANLIK_KAPASITE;
 int* arr = malloc(ANLIK_KAPASITE * sizeof(int));
 
 char word[256];
 while(scanf("%255s", word) != EOF){
 if(strcmp(&word[0], "@") == 0 ) break;
 if( atoi(word) != 0 ){
 ekle(arr, yer, atoi(word), &buyukluk, &kapasite);
 yer++;
 }
 else{
 if(strcmp(&word[0], "0") == 0 ){
 ekle(arr, yer, 0, &buyukluk, &kapasite);
 yer++;
 }
 }
 }
 yazdir(arr, buyukluk);
 return 0;
}
void yazdir(int *arr, int buyukluk){
 printf("Cikti:\n");
 for( int i=0; i<buyukluk; i++){
 printf("%d\n", arr[i]);
 }
}
