#include <iostream>
using namespace std;

int main(int argc, char const *argv[]) {

  int sayi;

  cout << "Bir sayi giriniz" << '\n';
  cin >> sayi;

  if (sayi%2==0) {
    cout << sayi << " 2'ye tam bölünür" << '\n';
  }
  if (sayi%3==0) {
    cout << sayi << " 3'ye tam bölünür" << '\n';
  }
  if (sayi%4==0) {
    cout << sayi << " 4'ye tam bölünür" << '\n';
  }
  if (sayi%5==0) {
    cout << sayi << " 5'ye tam bölünür" << '\n';
  }
  if (sayi%6==0) {
    cout << sayi << " 6'ye tam bölünür" << '\n';
  }
  if (sayi%7==0) {
    cout << sayi << " 7'ye tam bölünür" << '\n';
  }
  if (sayi%8==0) {
    cout << sayi << " 8'ye tam bölünür" << '\n';
  }
  if (sayi%9==0) {
    cout << sayi << " 9'ye tam bölünür" << '\n';
  }

  return 0;
}
