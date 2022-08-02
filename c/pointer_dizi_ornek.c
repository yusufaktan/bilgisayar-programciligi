#include <stdio.h> 

void bol(int a[], int b[], double *bolum, int *kalan);

int main(){

    double bolum[6];
    int kalan[6];
    int a[6] = { 3,6,9,12,16,18 };
    int b[6] = { 2,3,3,4,4,4 };

    printf("Ilk dizi ;\n");
    for(int i=0;i<=4;i++)
        printf("Dizinin %d. elemani= %d\n",i,a[i]);

    printf("\nIkinci dizi ;\n");
    for(int i=0;i<=4;i++)
        printf("Dizinin %d. elemani= %d\n",i,b[i]);

    printf("\n");

    bol(a,b,bolum,kalan);

    printf("Bolum: ");
    for(int i=0; i<6; i++){
        printf("%.1f, ", bolum[i]);
    }

    printf("\n");
    
    printf("Kalan:  ");
    for(int i=0; i<6; i++){
        printf("%d, ", kalan[i]);
    }

    printf("\n");

    return 0;
}

void bol(int a[], int b[], double *bolum, int *kalan){
    
    int sonuc;

    for(int i=0; i<6; i++){
        bolum[i] = a[i] / (float)b[i];
        sonuc = a[i] / b[i];
        kalan[i] = a[i] - b[i]*sonuc;
    }
}