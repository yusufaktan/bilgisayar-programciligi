#include <iostream>
using namespace std;

class otomobil{
private:
  string marka;
  string model;
  int yil;
  string renk;

public:
  void set_renk(string _renk);
  string get_renk();

  void set_marka(string _marka);
  string get_marka();

  void set_model(string _model);
  string get_model();

  void set_yil(int _yil);
  int get_yil();

  int yasHesapla(){

  }

}; // sınıf bitimi

//marka atama
void otomobil::set_marka(string _marka){
  marka=_marka;
}
string otomobil:: get_marka(){
  return(marka);
}

//renk atama
void otomobil::set_renk(string _renk){
  renk=_renk;
}
string otomobil:: get_renk(){
  return(renk);
}

//model atama
void otomobil::set_model(string _model){
  model=_model;
}
string otomobil:: get_model(){
  return(model);
}

//yil atama
void otomobil::set_model(string _yil){
  yil=_yil;
}
int otomobil:: get_model(){
  return(yil);
}

int otomobil::yasHesapla(){
  return (2020-yil);
}

int main() {

  otomobil oto1;
  oto1.set_marka("Seat");
  oto1.set_model("Ibiza");
  oto1.set_renk("Mavi");
  oto1.set_yil(2015);

  cout << "Marka :" << oto1.get_marka() << '\n';
  return 0;
}
