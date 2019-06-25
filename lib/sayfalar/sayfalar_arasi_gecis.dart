import 'package:flutter/material.dart';

class Asayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfalar Arası Geçiş")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("A Sayfası", style: TextStyle(fontSize: 30)),
          Center(
            child: RaisedButton(
              child: Text("B Sayfasına Git"),
              onPressed: () {
                // push ile bir sonraki sayfaya geçiş yapıyoruz.
                // ilk parametre olarak sayfamızın context'i
                // ikinci parametre olarak, sayfa geçiş animasyonlarını vb. sağlayan MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Bsayfasi(),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ButtonC(),
          ),
        ],
      ),
    );
  }
}

class ButtonC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _cSayfasinaGitVeDegerBekle(context);
      },
      child: Text("C Sayfasına Veri Taşı"),
    );
  }

  _cSayfasinaGitVeDegerBekle(BuildContext context) async {
    // Navigator.push Navigator.pop'dan gelen bilgiyi Future olarak geri döndürür.
    // Navigator.pop gerçekleştiğinde gelen değeri sonuc değişgenine atayacak
    final sonuc = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Csayfasi(soru: "Şuan Hava Karanlık mı ?"),
      ),
    );

    // Gelen değeri bize göstermesi için, uygulamanın alt kısmında görünecek kısım
    Scaffold.of(context)
      // O an ekranda snackbar var ise kaldır ve yenisini göster
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$sonuc")));
  }
}

class Bsayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("B Sayfası")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("B SAYFASI", style: TextStyle(fontSize: 30)),
          Center(
              child: RaisedButton(
            child: Text("A Sayfasına Geri Dön"),
            // Navigator.pop ile bir önceki sayfaya dönücek
            onPressed: () => Navigator.pop(context),
          )),
        ],
      ),
    );
  }
}

class Csayfasi extends StatelessWidget {
  final String soru;

  // İstediğimiz veri türünü Kurucu method ile belirtiyoruz.
  Csayfasi({this.soru});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("C Sayfası")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Diğer sayfadan gelecek veriyi Text widgetimizde gösterdik
          Text("$soru", style: TextStyle(fontSize: 30)),
          Center(
              child: RaisedButton(
            child: Text("Hayır"),
            // Navigator.pop ile bir önceki sayfaya dönücek
            // İkinci Parametre olarak geri dönüş değerimizi girdik
            onPressed: () => Navigator.pop(context, "Hayır"),
          )),
          Center(
              child: RaisedButton(
            child: Text("Evet"),
            // Navigator.pop ile bir önceki sayfaya dönücek
            // İkinci Parametre olarak geri dönüş değerimizi girdik
            onPressed: () => Navigator.pop(context, "Evet"),
          )),
        ],
      ),
    );
  }
}

