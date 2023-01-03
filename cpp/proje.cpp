#include <iostream>
#include <fstream>
using namespace std;

class Musteri{ //class baslangic
private:

    long int tc;
    string ad;
    string soyadi;
    float borc;
    float alacak;
    float bakiye;

public:

    void listele(){ // ekrana basma metodu
        ifstream dosyaOkuma("hesap.txt",ios::in);
        string satir;
        satir="";
        if (dosyaOkuma.is_open()){
            while (getline(dosyaOkuma, satir)){
                cout << satir << endl;
            }
        }
        else
            cout << "Dosya acilamadi !!" << endl;
        dosyaOkuma.close();
    }

    void ekle(){ // yeni musteri ekleme metodu

        cout << "Musteri TC : ";
        cin >> tc;
        cout << "Mustedi Adi : ";
        cin >> ad;
        cout << "Musteri Soyadi : ";
        cin >> soyadi;
        cout << "Borc : ";
        cin >> borc;
        cout << "Alacak : ";
        cin >> alacak;
        cout << "____________________________" << endl;
        bakiye=borc-alacak;
        cout << "Yeni Musteri Eklendi \n" << ad << " Adlı Kisinin Bakiyesi : " << bakiye << endl;
        ofstream dosyaYaz("hesap.txt",ios::app);
        if (dosyaYaz.is_open()){
            dosyaYaz << "\n" <<tc << " ";
            dosyaYaz << ad << " ";
            dosyaYaz << soyadi << " ";
            dosyaYaz << borc  << " ";
            dosyaYaz << alacak  << " ";
            dosyaYaz << bakiye;
            dosyaYaz.close();
        }
        else
            cout << "Dosya acilamadi !!" << endl;
    }

    void sil(){ // musteri silme metodu

        long int siltc;
        cout << "Silinecek Musterinin TC NO : " ;
        cin >> siltc;

        ifstream dosyaOku("hesap.txt");
        ofstream dosyaYaz("gecici.tmp");
        while (!(dosyaOku.eof())){

            dosyaOku >> tc >> ad >> soyadi  >> borc >> alacak >> bakiye;

            if (tc==siltc){
                cout<<"Musteri Silindi\n";
            }
            else
                dosyaYaz << tc << " " << ad << " " << soyadi << " " << borc << " " << alacak << " " << bakiye << "\n";

        }
        dosyaYaz.close();
        dosyaOku.close();

        remove("hesap.txt");
        rename("gecici.tmp", "hesap.txt");
    }

    void ara(){ // hesap.txt icindeki musterileri tc nosuna gore arayan metod
        long int sorgu_TC;

        cout << "Aranacak Musterinin TC NO :";
        cin >> sorgu_TC;

        ifstream DosyaOku("hesap.txt");
        while (!(DosyaOku.eof())){

            DosyaOku >> tc >> ad >> soyadi >> borc >> alacak >> bakiye;
            if (tc == sorgu_TC){
                cout << "=========== Musteri Bilgileri ==========" << endl;
                cout << "TC :" << tc << endl;
                cout << "Musteri Adi :" << ad << endl;
                cout << "Musteri Soyadi : " << soyadi << endl;
                cout << "Borc :" << borc << endl;
                cout << "Alacak :" << alacak << endl;
                cout << "Bakiye :" << bakiye << endl;
                DosyaOku.close();
                break;
            }
        }
    }

    void guncelle(){ // hesap.txt icindeki musteri bilgilerini guncelleyen metod
        long int sorgu_TC;
        ifstream DosyaOku("hesap.txt");
        ofstream DosyaYaz("gecici.tmp");

        cout << "Duzenlenecek Musterinin TC NO : ";
        cin >> sorgu_TC;

        int kontrol=0;
        while (!(DosyaOku.eof())){

            DosyaOku >> tc >> ad >> soyadi >> borc >> alacak >> bakiye;

            if (sorgu_TC == tc){
                cout << "========== Musteri Bilgileri ==========" << "\n";

                cout << "TC :" << tc << endl;
                cout << "AD :" << ad << endl;
                cout << "SOYAD :" << soyadi << endl;
                cout << "BORC :" << borc << endl;
                cout << "ALACAK :" << alacak << endl;
                cout << "BAKIYE :" << bakiye << endl << endl;
                cout << "Musteri Bilgilerini Yenileyiniz..." << endl << endl;

                //cout << "\nTC :"; cin >> sorgu_TC;
                cout << "AD :"; cin >> ad;
                cout << "SOYAD :"; cin >> soyadi;
                cout << "BORC :"; cin >> borc;
                cout << "ALACAK :"; cin >> alacak;
                bakiye=borc-alacak;
                cout << "YENI BAKIYE :"<<bakiye<<endl;
                cout << "Musteri Bilgileri Güncellendi." << endl;

                DosyaYaz << sorgu_TC << " " << ad << " " << soyadi << " " << borc << " " << alacak << " " << bakiye<<"\n";
                kontrol=1;
            }
            else {
                DosyaYaz << tc << " " << ad << " " << soyadi << " " << borc << " " << alacak << " " << bakiye << "\n";
            }
        }
        if(kontrol==0)
            cout << "Bulunamadi" << endl;

        DosyaOku.close();
        DosyaYaz.close();
        remove("hesap.txt");
        rename("gecici.tmp", "hesap.txt");
    }

    void toplamBakiye(){ // tum musterilerin bakiyeleri toplamini donduren metod
        float toplambakiye=0;
        int sayac=0;

        ifstream DosyaOku("hesap.txt");
        while (!(DosyaOku.eof())) {
            sayac++;
            DosyaOku >> tc >> ad >> soyadi >> borc >> alacak >> bakiye;
            for (int i = 0; i < sayac; ) {
                toplambakiye=toplambakiye+bakiye;
                break;
            }
        }
        cout << toplambakiye << endl;
    }

    void sirala(){ // tum musterilerin bakiyelerini buyukten kucuge ve kucukten buyuge dogru siralayan metod
        int i=0;
        float dizi[15];
        ifstream DosyaOku("hesap.txt");
        while (!(DosyaOku.eof())) {
            i++;
            DosyaOku >> tc >> ad >> soyadi >> borc >> alacak >> bakiye;
            dizi[i]=bakiye;
        }
        float temp;
        for(int h=1;h<=i;h++)
            for(int j=1;j<=i-1;j++)
            {
                if(dizi[j]>dizi[j+1])
                {
                    temp=dizi[j];
                    dizi[j]=dizi[j+1];
                    dizi[j+1]=temp;
                }
            }
        cout << "Kucukten buyuge bakiye siralamasi" << endl;
        for (int k=1;k<=i;k++)
        {
            cout<<dizi[k]<<endl;
        }
        cout << "-----------------------" << endl;
        for(int h=1;h<=i;h++)
            for(int j=1;j<=i-1;j++)
            {
                if(dizi[j]<dizi[j+1])
                {
                    temp=dizi[j];
                    dizi[j]=dizi[j+1];
                    dizi[j+1]=temp;
                }
            }
        cout << "Buyukten kucuge bakiye siralamasi" << endl;
        for (int k=1;k<=i;k++)
        {
            cout<<dizi[k]<<endl;
        }
    }


}; //class bitis

int main() {

    Musteri m1;
    int secim;
    cout << "---------------------------\n|       HOSGELDINIZ       |\n---------------------------\n| [1]  MUSTERI LISTESI    |\n| [2]  MUSTERI EKLE       |\n| [3]  MUSTERI SIL        |\n| [4]  MUSTERI GUNCELLE   |\n| [5]  MUSTERI ARA        |\n| [6]  TOPLAM BAKIYE      |\n| [7]  BAKIYE SIRALAMA    |\n---------------------------\nSECIM == ";
    cin >> secim;
    cout << "============================" << endl;

    if (secim==1) {
        cout << "Musteri Listesi\n____________________________" << endl;
        m1.listele();
        cout << "____________________________"<< endl;
    }
    else if (secim==2) {
        cout << "Musteri EKLE\n____________________________" << endl;
        m1.ekle();
        cout << "____________________________"<< endl;
    }
    else if (secim==3) {
        cout << "Musteri SIL\n____________________________" << endl;
        m1.sil();
        cout << "____________________________" << endl;
    }
    else if (secim==4) {
        cout << "Musteri GUNCELLE\n____________________________" << endl;
        m1.guncelle();
        cout << "____________________________" << endl;
    }
    else if (secim==5) {
        cout << "Musteri ARA\n____________________________" << endl;
        m1.ara();
        cout << "____________________________" << endl;
    }
    else if (secim==6) {
        cout << "Toplam Bakiye\n____________________________" << endl;
        m1.toplamBakiye();
        cout << "____________________________" << endl;
    }
    else if (secim==7) {
        cout << "Bakiye SIRALAMA\n____________________________" << endl;
        m1.sirala();
        cout << "____________________________" << endl;
    }

    return 0;
}