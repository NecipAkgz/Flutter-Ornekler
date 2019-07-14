import 'package:flutter/material.dart';

class WrapVeChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap ve Chip'),
      ),
      body: Column(
        children: <Widget>[
          _wrapKullanmadan(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Divider(height: 4, color: Colors.black54),
          ),
          _wrapKullanarak()
        ],
      ),
    );
  }

  Column _wrapKullanmadan() {
    return Column(
      children: <Widget>[
        Text(
          'Wrap Kullanmadan Row ile',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 8),
          child: Text(
            "Wrap kullanmadan Row içine içerine sığmayan elemanları eklediğimizde hata vericektir",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: <Widget>[
            ..._seriChipGetir(adet: 10),
          ],
        ),
      ],
    );
  }

  Column _wrapKullanarak() {
    return Column(
      children: <Widget>[
        Text(
          "Wrap Kullanarak",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 8),
          child: Text(
            "Wrap ile Kullandığımızda ise sığmayanlar bir alt satırdan devam edicektir",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Wrap(
          // hizalama biçimi
          alignment: WrapAlignment.spaceBetween,
          // ne tarafa doğru sıralanacağı : veritical(dikey) yada horizontal(yatay)
          direction: Axis.horizontal,
          // sütünlar arasındaki boşluk
          spacing: 20,
          // Satırlar arasında boşluk
          runSpacing: 10,
          children: <Widget>[
            ..._seriChipGetir(adet: 10),
          ],
        ),
      ],
    );
  }

  /// Liste şeklinde istediğimiz sayıda chip widgeti dönücek
  List<Chip> _seriChipGetir({int adet}) {
    return List.generate(adet, (index) {
      return Chip(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // gelen index bölü(/) 2 eşitse 0'a redAccent değilse amber rengi
        backgroundColor: index % 2 == 0 ? Colors.redAccent : Colors.amber,
        // yerden yükseliği
        elevation: 5,
        // Üzerindeki yazı
        label: Text("$index. Etiket"),
      );
    }).toList();
  }
}
