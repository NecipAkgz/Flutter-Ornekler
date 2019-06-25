import 'dart:convert';
import 'package:flutter/material.dart';

class YerelJson extends StatefulWidget {
  @override
  _YerelJsonState createState() => _YerelJsonState();
}

class _YerelJsonState extends State<YerelJson> {
  // dosya yolumuzu tutan değişken
  String dosyaYolu = "assets/json_dosyalarim/starwars_data.json";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local(Yerel) Json Kullanımı")),
      body: Container(
        child: Center(
          // future builder sayesinde json dosyamızı DefaultAssetsBundle yardımıyla yüklüyoruz
          child: FutureBuilder(
            // future özelliğine kaynagımızı gösteriyoruz
            future: DefaultAssetBundle.of(context).loadString(dosyaYolu),
            builder: (context, snapshot) {
              // snapshot ile kaynaktan gelen ham verimizi decod edip kullanmak için bir değişkene attık
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                // Liste eleman sayısını belirtiyoruz
                // data null ise 0 değil ise data uzunluğumuz kadar olacağını söyledik
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  // ListView.builder ile decod olan json dosyamızı örnek olması amacıyla
                  // ilgili kısımları bir Widget'e listview tarafından gelen index ile atıyoruz.
                  // her bir veri için aşşağıdaki işlemleri yapıp ekranda göstericek
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("İsim: " + data[index]['name']),
                        Text("Boy: " + data[index]['height']),
                        Text("Ağıtlık: " + data[index]['mass']),
                        Text("Saç Rengi: " + data[index]['hair_color']),
                        Text("Deri Rengi: " + data[index]['skin_color']),
                        Text("Göz Rengi: " + data[index]['eye_color']),
                        Text("Doğum Tarihi: " + data[index]['birth_year']),
                        Text("Cinsiyet: " + data[index]['gender'])
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
