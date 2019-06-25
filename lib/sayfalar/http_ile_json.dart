import 'package:flutter/material.dart';
// json decode etmek için gerekli olan kütüphane
import 'dart:convert';
// http kütüphanesini http adı ile al
import 'package:http/http.dart' as http;

// Statefull widget yarattık
class OnlineJson extends StatefulWidget {
  @override
  OnlineJsonState createState() => OnlineJsonState();
}

// Statefull widgetimizin State'i
class OnlineJsonState extends State<OnlineJson> {
  // Json'umuzun url'si
  final String url = "https://jsonplaceholder.typicode.com/todos";
  // Jsondan gelicek verileri atacağımızın global değişken
  List data;

  // internetten datamızı çekmesi için bir fonksiyon yazıyoruz.
  Future<void> getJSONData() async {
    // http kütüphanesine URL linkimizi verip gelen cevabı bir değişkene atadık
    var response = await http.get(url);

    setState(() {
      // gelen cevaptan gerekli olan bölümü decode edip global Liste değişkenimize atıyoruz
      data = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    // Widget ekrana gelmeden verilerimizi çekmesi için initState içerisinde
    // datamızı listemize dolduracak fonksiyonumuzu çağırıyoruz.
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http ile Json Verisi"),
      ),
      // Listview.builder ile gelen verileri ekranda gösterelim
      body: ListView.builder(
        // listemizin uzunluğunu belirtiyoruz. (data boş ise 0 değilse uzunluğu kadar)
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          // gelen datayı parçalara bölüp widgetlere atadık
          return Card(
            // Widgetimizin rengi json'dan gelen boolen kısmın cevabına göre rengini belirledik
            color:
                data[index]["completed"] ? Colors.green[200] : Colors.red[200],
            child: ListTile(
              title: Text(data[index]["title"]),
              leading: CircleAvatar(
                child: Text(data[index]["id"].toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
