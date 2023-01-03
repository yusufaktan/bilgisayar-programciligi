#include <iostream>
using namespace std;

int faktoriyel(int n){

    int f=1;
    for (int i = 1; i <= n; i++)
    {
        f=f*i;
    }

    return f;
}

int main(){

    int n;
    cout << "Faktoriyeli hesaplanacak sayiyi giriniz : " << endl;
    cin >> n;

    cout << "Sonuc : " << faktoriyel(n) << endl;


    return 0;
}
