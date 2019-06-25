import 'package:flutter_ornekler/yardimci_siniflar/rasgele_renk.dart';
import 'package:flutter_ornekler/yardimci_siniflar/sayfalar.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    // textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  // leading: Icon(Icons.ac_unit),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// trailing: OutlineButton.icon(
//   icon: Icon(Icons.arrow_right),
//   label: Text("Konu Anlatım"),
//   onPressed: () {},
// ),
