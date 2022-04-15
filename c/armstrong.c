#include <stdio.h>

void ekranaBas(int x){
	printf("- %d\n",x);
}

int main()
{
   int x,a,b,c,d,e;
   
	baslangic:
	printf("Minimum degeri giriniz : ",d);
	scanf("%d",&d);
	printf("Maksimum degeri giriniz : ",e);
	scanf("%d",&e);
	printf("==================================================\n");
   
	if(d>999 || e<100){
   		printf("Sadece 100 ve 999 arasi deger girebilirsiniz!\n");
   		printf("==================================================\n");
    	goto baslangic;
		}
	else if(d<100 || e>999){
    	printf("Sadece 100 ve 999 arasi deger girebilirsiniz!\n");
    	printf("==================================================\n");
    	goto baslangic;
		}
	else if(e<d){
    	printf("Minimum sayi Maksimum sayidan buyuk olamaz!\n");
    	printf("==================================================\n");
    	goto baslangic;
		}
	else if(d>e){
    	printf("Maksimum sayi Minimum sayidan kucuk olamaz!\n");
    	printf("==================================================\n");
    	goto baslangic;
		}
	else {
		printf("%d ve %d arasindaki Armstrong sayilar\n",d,e);
	}

  
	for(x=d;x<=e;x++){
	a = x / 100;     
    b = (x%100)/10;
    c = x % 10;

	if(a*a*a + b*b*b + c*c*c == x){
    	ekranaBas(x);
	}
}
	
	return 0;
}