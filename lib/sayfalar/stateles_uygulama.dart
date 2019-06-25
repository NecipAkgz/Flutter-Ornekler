import 'package:flutter/material.dart';

class StatelesUygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Uygulama içerisinde kolaylık sağlaması için bir kaç sabit ekleyelim
    // böylece her seferinde tek tek yazmamız  gerekmeyecek
    final double myTextSize = 30.0;
    final double myIconSize = 40.0;
    final TextStyle myTextStyle = TextStyle(
      color: Colors.grey,
      fontSize: myTextSize,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless Widget"),
      ),
      body: Container(
        child: Center(
          // SingleChildScrollView = Eğer  içerisine verdiğimiz widgetler
          // ekrana sığmaz ise aşşağıya kaydırma özelliği ekleyecek
          child: SingleChildScrollView(
              child: Column(
            // Column içerisindeki OzelCardlarımız yatay olarak
            // genişleyebildiği kadar genişlemesini belirttik
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Ve Özel olarak oluşturduğumuz widgeti kullanarak elemanlarımızı ekliyoruz
              OzelCard(
                  title: Text("Favorite", style: myTextStyle),
                  icon: Icon(Icons.favorite,
                      size: myIconSize, color: Colors.red)),
              OzelCard(
                  title: Text("Alarm", style: myTextStyle),
                  icon:
                      Icon(Icons.alarm, size: myIconSize, color: Colors.blue)),
              OzelCard(
                  title: Text("Airport Shuttle", style: myTextStyle),
                  icon: Icon(Icons.airport_shuttle,
                      size: myIconSize, color: Colors.amber)),
              OzelCard(
                  title: Text("Done", style: myTextStyle),
                  icon:
                      Icon(Icons.done, size: myIconSize, color: Colors.green)),
            ],
          )),
        ),
      ),
    );
  }
}

// Uygulamamızın başka yerlerinde kullanabileceğimiz bir widget oluşturduk
class OzelCard extends StatelessWidget {
  final Widget icon;
  final Widget title;

  // Kurucu Methodumuz.
  OzelCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // Card Widgetimiz oluşturulurken verilen bilgileri kullandık
            children: <Widget>[
              this.title,
              this.icon,
            ],
          ),
        ),
      ),
    );
  }
}
