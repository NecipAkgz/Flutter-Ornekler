import 'package:flutter_ornekler/yardimci_siniflar/rasgele_renk.dart';
import 'package:flutter_ornekler/yardimci_siniflar/sayfalar.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text("Flutter Örnekler"),
        actions: [
          aramaButonu(context),
        ],
      ),
      body: buildWidgetler(),
    );
  }

  IconButton aramaButonu(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(
          context: context,
          delegate: AramaYapDelegete(),
        );
      },
    );
  }

  Container buildWidgetler() {
    return Container(
      child: ListView.builder(
        itemCount: Sayfalar.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black54),
            ),
            color: RasgeleRenk.renkUret(minBrightness: 80),
            child: ListTile(
              leading: Icon(Icons.arrow_downward),
              onTap: () =>
                  Navigator.pushNamed(context, Sayfalar[index]["sayfaAdi"]),
              title: Text(
                "${index + 1} - ${Sayfalar[index]["baslik"]}",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ----------------- Aramaİşlemleri için gerekli olan class ----------------- */

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
      return AramaEkrani(query: query.toLowerCase());
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

/* ------------------------------ Arama Widgeti ----------------------------- */

class AramaEkrani extends StatelessWidget {
  final String query;

  AramaEkrani({Key key, this.query}) : super(key: key);

  // Verilen Query'e göre yeni bir liste oluşturup onu dönecek
  List bulunanSonuc() {
    Iterable<String> iterable = Sayfalar.map((f) => f["baslik"]).toList();
    var sonuc =
        iterable.where((eleman) => eleman.toLowerCase().contains(query));
    return sonuc.toList();
  }

  @override
  Widget build(BuildContext context) {
    if (bulunanSonuc().length > 0) {
      return sonucBulundu();
    } else {
      return sonucBulunamadi();
    }
  }

  Container sonucBulundu() {
    return Container(
      child: ListView.builder(
        itemCount: bulunanSonuc().length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black54),
            ),
            color: RasgeleRenk.renkUret(minBrightness: 80),
            child: ListTile(
              leading: Icon(Icons.arrow_downward),
              onTap: () => Navigator.pushNamed(context, bulunanSonuc()[index]),
              title: Text(
                bulunanSonuc()[index],
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }

  Container sonucBulunamadi() {
    return Container(
      child: Center(
        child: Text("Sonuç Bulunamadı"),
      ),
    );
  }
}

// trailing: OutlineButton.icon(
//   icon: Icon(Icons.arrow_right),
//   label: Text("Konu Anlatım"),
//   onPressed: () {},
// ),
