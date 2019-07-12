import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // "/" Uygulamanın Başlangıç sayfasını temsil ediyor
        "/": (context) => ModelRouteDemo(),
        // "/hedefSayfa" isimli route'a gitmek istersek bizi Hedef ekrana götürecek
        "/hedefSayfa": (context) => HedefSayfa(),
      },
    );
  }
}

class ModelRouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modal Route İle Veri Aktarma")),
      body: Center(
        // Button'a basılınca hedef sayfaya verimizi gönderecek
        child: RaisedButton(
          child: Text("Arguments ile hedef sayfaya bilgi gönder"),
          onPressed: () {
            // Kullanıcı buton'a basınca pushNamed fonksiyonumuzun arguement özelliği
            // sayesinde, verilen parametreleri hesefSayfaya iletecek
            Navigator.pushNamed(
              context,
              "/hedefSayfa",
              // arguments kısmına gönderilecek verileri girdik
              arguments: Mesaj(
                baslik: "Mesaj Başlığı",
                mesaj: "Mesaj İçeriği",
              ),
            );
          },
        ),
      ),
    );
  }
}

// ModalRoute Kullanarak Gelen bilgileri alacak Sayfamız
class HedefSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // route bilgilerine erişip daha sonra kullanmak için bir değişgene atadık
    final Mesaj args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        // gelen bilgileri kullanıyoruz
        title: Text(args.baslik),
      ),
      body: Center(
        // gelen bilgileri kullanıyoruz
        child: Text(args.mesaj),
      ),
    );
  }
}

/* ------------------ Göndermek istediğimiz verinin modeli ------------------ */

// Hedef sayfaya göndereceğimiz veri basitce bir sayi, yazi vb. olacağı gibi tabiki bir nesnede olabilir.
// Diğer sayfaya göndermek için temsili bir sınıf modeli yazalım.

// Parametre olarak baslik ve mesaj alan örnek bir Sınıf
class Mesaj {
  final String baslik;
  final String mesaj;

  Mesaj({this.baslik, this.mesaj});
}
