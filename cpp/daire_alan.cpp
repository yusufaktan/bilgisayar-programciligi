#include <iostream>
using namespace std;

#define PI 3.14

class daire{

private:
  float r;

public:
  void set_daire(float yaricap){
		r=yaricap;
	}
  float alan_hesapla(){
    return (PI*r*r);
  }
};


int main() {

  daire d1;
  float yaricap = 2;
  d1.set_daire(yaricap);

  cout << "ALAN = " << d1.alan_hesapla() <<'\n';

  return 0;
}
