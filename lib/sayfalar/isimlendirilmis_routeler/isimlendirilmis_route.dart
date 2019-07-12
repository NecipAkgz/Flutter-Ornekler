import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Uygulamanın başlayacağı açılış Sayfası
      initialRoute: "/",
      routes: {
        // "/" isimli route'a gitmek istersek bizi BirinciEkrana Götürecek
        "/": (context) => BirinciEkran(),
        // "/Bsayfasi" isimli route'a gitmek istersek bizi ikinci ekrana götürecek
        "/Bsayfasi": (context) => IkinciEkran(),
      },
    );
  }
}

class BirinciEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birinci Ekran'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('İkinci Ekrana Git'),
          onPressed: () {
            // pushNamed kullanacak routes içerisinde tanımladığımız ismi girerek
            // ilgili sayfaya gidebiliriz.
            Navigator.pushNamed(context, "/Bsayfasi");
          },
        ),
      ),
    );
  }
}

class IkinciEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Ekran"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Stackden bulunduğumuz ekranı çıkrarak bir önceyi sayfaya dön
            Navigator.pop(context);
          },
          child: Text('Geri Dön!'),
        ),
      ),
    );
  }
}
