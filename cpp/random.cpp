#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main() {

  int random1, random2, random;

  char *bharf ="ABCDEFGHIJKLMNOPRSTUVYZXWQ";
  char *kharf ="abcdefghijklmnoprstuvyzxwq";
  char *rakam ="0123456789";
  char *sembol ="!+%&/*-=";
  char *sifre;


  srand(time(0));

  for (int i = 1; i <=2 ; i++) {
    random1=rand()% 26;
    random2=rand()% 26;
    cout << bharf[random1];
    cout << kharf[random2];
  }

  for (int i = 1; i <=2 ; i++) {
    random=rand()% 11;
    cout << rakam[random];
  }
  for (int i = 1; i <=2 ; i++) {
    random=rand()% 9;
    cout << sembol[random];
  }

  return 0;
}
