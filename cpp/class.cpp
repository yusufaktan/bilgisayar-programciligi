#include <iostream>
using namespace std;

class Banka {
private:
  float bakiye;
public:
  void set_bakiye(float b){
    bakiye=b;
  }
  float bakiye_goster(){
    return bakiye;
  }
  float para_yatir(float b){
    if (b<0) {
      cout << "Hatali giris" << '\n';
    }
    else
      bakiye=bakiye+b;
  }
  float para_cek(float b){
    if (bakiye<b) {
      cout << "Yetersiz bakiye" << '\n';
    }
    else
      bakiye = bakiye-b;
  }
};

int main() {

  Banka hesap1;

  hesap1.set_bakiye(200);
  cout << "Paranız : " << hesap1.bakiye_goster() <<'\n';

  hesap1.para_yatir(100);
  cout << "Paranız : " << hesap1.bakiye_goster() <<'\n';

  hesap1.para_cek(450);
  cout << "Paranız : " << hesap1.bakiye_goster() <<'\n';

  return 0;
}
