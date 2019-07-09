import 'package:flutter/material.dart';
import 'package:flutter_ornekler/yardimci_siniflar/rasgele_renk.dart';
import 'package:flutter_ornekler/yardimci_siniflar/sayfalar.dart';

class AramaYapDelegete extends SearchDelegate {
  // Yapmak istediğimiz ekstra actionlar, sağ taraftaki buton
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          close(context, null);
        },
      )
    ];
  }

  // Sol taraftaki buton
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  // Sonuç Ekranı
  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 2) {
      return Center(
        child: Text("2 Harf veya daha fazla olmalı"),
      );
    } else {
      return AramaEkrani(query: query.toLowerCase().trim());
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

/* ------------------------------ AramaEkranı Widgeti ----------------------------- */

class AramaEkrani extends StatelessWidget {
  final String query;

  AramaEkrani({Key key, this.query}) : super(key: key);

  // Verilen Query'e göre yeni bir liste oluşturup onu dönecek
  List _bulunanSonuclar() {
    var temelListesi = FLUTTER_TEMEL.map((f) => f["baslik"]).toList();

    var kisaKisaListesi = KISA_KISA_WIDGETLER.map((f) => f["baslik"]).toList();
    temelListesi.addAll(kisaKisaListesi);

    var sonuc =
        temelListesi.where((eleman) => eleman.toLowerCase().contains(query));

    return sonuc.toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_bulunanSonuclar().length > 0) {
      return _sonucBulundu();
    } else {
      return _sonucBulunamadi();
    }
  }

  // Query Sonucuna göre Liste dönücek
  Container _sonucBulundu() {
    return Container(
      child: ListView.builder(
        itemCount: _bulunanSonuclar().length,
        itemBuilder: (context, index) {
          return Card(
            color: RasgeleRenk.renkUret(minBrightness: 80),
            child: ListTile(
              leading: Icon(Icons.arrow_downward),
              onTap: () =>
                  Navigator.pushNamed(context, _bulunanSonuclar()[index]),
              title: Text(
                _bulunanSonuclar()[index],
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }

  // Query sonuçsuz kalırsa dönücek
  Container _sonucBulunamadi() {
    return Container(
      child: Center(
        child: Text("Sonuç Bulunamadı"),
      ),
    );
  }
}
