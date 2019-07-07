import 'package:flutter_ornekler/anaEkran/arama_islemleri.dart';
import 'package:flutter_ornekler/yardimci_siniflar/rasgele_renk.dart';
import 'package:flutter_ornekler/yardimci_siniflar/sayfalar.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
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
      body: flutterTemel(),
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

  Container flutterTemel() {
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

// trailing: OutlineButton.icon(
//   icon: Icon(Icons.arrow_right),
//   label: Text("Konu Anlatım"),
//   onPressed: () {},
// ),
