import 'package:yasam_beklentisi/userData.dart';

class Hesapla {
  UserData _userData;

  Hesapla(this._userData);

  double hesapla() {
    double sonuc;
    sonuc = 70 + _userData.haftalikSpor - _userData.icilenSigara;
    sonuc = sonuc + ((_userData.kullaniciBoy * _userData.kullaniciKilo) / 100);
    _userData.seciliCinsiyet == "Kadın"
        ? sonuc = sonuc / 3
        : sonuc = sonuc / 4 + 3;
    return sonuc;
  }
}
