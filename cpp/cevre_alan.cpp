#include <iostream>

using namespace std;
#define PI 3.14

class daire{

	float r;

public:
	void set_daire(float yaricap){
		r=yaricap;
	}
	float alan_hesapla(){
		return(PI*r*r);
	}
	float cevre_hesapla(){
		return(2*PI*r);
	}


};


int main(){

	float yaricapdeger;
	cout << "yaricap degerini giriniz :" <<"\n";
	cin >> yaricapdeger;

	daire d1;

	d1.set_daire(yaricapdeger);
	cout << "Cevresi : "<< d1.cevre_hesapla()<<"\n";

	cout<< "Alanı : "<< d1.alan_hesapla()<<"\n";




	return 0;
}
