#include <stdio.h>
int main(){
   char harf[100];
   int x=0, sayac[26] = {0};
   printf("Kelime giriniz:  ");
   scanf("%s",harf);
   while (harf[x] != '\0'){
      if (harf[x] >= 'a'||harf[x] <= 'z')
         sayac[harf[x]-'a']++; x++;
   }
   for (x=0; x < 26; x++){
      if (sayac[x] != 0)
         printf("%c:%d\n",x+'a',sayac[x]);
   }
   printf("kere kullanilmistir.\n");
}
