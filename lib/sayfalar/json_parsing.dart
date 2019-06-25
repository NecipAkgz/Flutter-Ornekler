import 'package:flutter/material.dart';
// json decode etmek için gerekli olan kütüphane
import 'dart:convert';
// http istekleri yapmamızı sağlayan http kütüphanesini http adı ile al
import 'package:http/http.dart' as http;

class JsonParsing extends StatefulWidget {
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  // Apimizden verileri alıp istediğimiz türde List yapıp onu döndürecek
  Future<List<Gonderi>> _gonderiGetir() async {
    // api mizin url'i
    // Uri.encodeFull (!#$&'()*+,-./:;=?@_~) gibi karakterlerin sorun yaratmasını ortadan kaldırıcak
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      // Bu özellik ile ise sadece json verileri kabul et diyoruz
      headers: {"Accept": "application/json"},
    );
    // Model Sınıfımızın içerisinde bulunan sitenin bizim için oluşturduğu fonksiyon ile
    // apimizden gelen json'u Liste<Gonderi> olucak şekilde geri dönderiyoruz.
    return gonderiFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing"),
      ),
      // FutureBuilder ile decode edip listeye çevirdiğimiz veriyi uygulamamıza göre
      // şekillendiriyoruz.
      body: FutureBuilder(
        // veriyi kaynağı
        future: _gonderiGetir(),
        // FutureBuilder'in builder özelliği snapshot parametresi ile verdiğimiz
        // veri kaynağını alt widgetlere ileticek
        builder: (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot) {
          // Veri kaynağımızda data var ise bunları yap
          if (snapshot.hasData) {
            return ListView.builder(
              // veri kaynağımız uzunluğu
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                // Futurebuilder'ın snapshot ile veri kaynağımızdan bize sağladığı
                // veriyi ListView.builder tarafından gelen index no ile temsili olarak
                // Widgetlere atıroyuruz.
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                    leading: CircleAvatar(
                        child: Text(snapshot.data[index].id.toString())),
                  ),
                );
              },
            );
            // Veri yok ise ekran ortasında CircularProgressIndicator Göster.
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

/* ------------------------ Json için Model Sınıfımız ----------------------- */

// Veridiğimiz Json'u sınıfımıza göre decode edip Verileri list şeklinde geri
// dönecek yardımcı methodumuz
// Sınıfın dışında tanımlanmasının avantajı, nesne oluşturmadan kullanabilmek
List<Gonderi> gonderiFromJson(String str) =>
    List<Gonderi>.from(json.decode(str).map((x) => Gonderi.fromJson(x)));

// verdiğimiz Gonderi listesini Json'a dönüştürmek istersek yaralanaceğımız method
String gonderiToJson(List<Gonderi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gonderi {
  int userId;
  int id;
  String title;
  String body;

  Gonderi({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  // Gelen json verisini bizim sınıfımıza göre Map'e çevirecek isimlendirilmiş kurucumuz
  factory Gonderi.fromJson(Map<String, dynamic> json) => Gonderi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
  // Map verisini json'a çevirmek istersek bunu kullanabiliriz.
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
