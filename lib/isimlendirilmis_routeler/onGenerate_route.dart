import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Açılış Sayfamız
      home: AnaSayfa(),
      // Gelen route bilgilerine göre kontrol edip gerekli yönlendirmeleri yapıyoruz.
      // RouteSettings uygulamanın genel route bilgilerini içinde tutar
      // gerekli bilgileri alıp istediğimiz şekilde kullanabiliriz.
      onGenerateRoute: (RouteSettings settings) {
        // Eğer yakalanan route ismi "/hedefSayfa" ise
        if (settings.name == "/hedefSayfa") {
          // ilgili routenin argument bilgilerini
          // mesaj sınıfına dönüştürdükten sonra al ve değişgene ata
          final Mesaj args = settings.arguments;

          // Daha sonra bu bilgiyi ilgili sayfamıza MaterialPage route ile pasliyoruz.
          return MaterialPageRoute(builder: (BuildContext context) {
            return HedefSayfa(
              baslik: args.baslik,
              mesaj: args.mesaj,
            );
          });
        }
        // Bu kısmı switch veya if ile istediğimiz kadar sayfa için kullanabiliriz.
      },
    );
  }
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OnGenerateRoute Kullanımı")),
      body: Center(
        // Button'a basılınca hedef sayfaya verimizi gönderecek
        child: RaisedButton(
          child: Text("OnGenerateRoute ile bilgileri pasla"),
          onPressed: () {
            // Kullanıcı buton'a basınca pushNamed fonksiyonumuzun arguement özelliği
            // sayesinde, verilen parametreleri hesefSayfaya iletecek
            Navigator.pushNamed(
              context,
              "/hedefSayfa",
              // arguments kısmına gönderilecek verileri girdik
              arguments: Mesaj(
                baslik: " OnGenerate Mesaj Başlığı",
                mesaj: "OnGenerate  Mesaj İçeriği",
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
  final String baslik;
  final String mesaj;

  HedefSayfa({Key key, this.baslik, this.mesaj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnGenerate Route Kullanımı"),
      ),
      body: Center(
        // gelen bilgileri kullanıyoruz
        child: Text("$baslik \n $mesaj"),
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

/* ---------- Sınıf oluşturup onGenerateRoute Kısmında çağırabilriz --------- */

// Alternatif olarak Sınıf oluşturup onGenerateRoute Kısmında çağırabilriz
// Örnek : onGenerateRoute : RouteOlusturucu.routeOlustur

class RouteOlusturucu {
  static Route<dynamic> routeOlustur(RouteSettings settings) {
    final routeName = settings.name;
    final routeArguments = settings.arguments;

    switch (routeName) {
      case "/hedefSayfa":
        final Mesaj mesajArgs = routeArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => HedefSayfa(
                  baslik: mesajArgs.baslik,
                  mesaj: mesajArgs.mesaj,
                ));
        break;
      default:
        // Tanımlı sayfa bulamaz ise buraya gider
        return MaterialPageRoute(builder: (BuildContext context) => AnaSayfa());
    }
  }
}
