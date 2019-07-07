import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Uygulamaları',
      home: BottonBarDemo(),
    );
  }
}

class BottonBarDemo extends StatefulWidget {
  @override
  BottonBarDemoState createState() => BottonBarDemoState();
}

// Tabbar'ın kullanılacağı clasımıza SingleTickerProvider ekliyoruz.
// bu bize geçiş animasyolarını yapmamız için gerekli
class BottonBarDemoState extends State<BottonBarDemo>
    with SingleTickerProviderStateMixin {
  // Tabbar üzerinde gerekli kontroleri yapmamıza olanak vericek contollerimiz
  TabController controller;

  // Clasımızın initState'i içerisinde contollerimizi tanımlıyoruz.
  // initState = Widget oluşmadan içerisinde verilen işlemleri yapar
  @override
  void initState() {
    super.initState();

    // contolleri tanımlarken tabbar'da kaç öğe olucağını(bu örnek için 3)
    // ve SingleTickerProvider'ın bize sağladı animasyon için gerekli olan
    // vsync özelliğinin bu controll üzerinde gerçekleşeceğini sözlüyoruz.
    controller = TabController(length: 3, vsync: this);
  }

  // işimiz bitince gereksiz kaynak harcamaması için contollerimizi kapatıyoruz
  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Bottom Navigation Bar"),
      ),
      // Butonlarımıza tıklanınca hangi sayfalar görünecek onlar belirtiyoruz
      // controller aynı olduğu için kendisi sayfa karşılığını otomatik bulucaktır
      body: TabBarView(
        // Sayfalarımızı belirtiyoruz
        children: <Widget>[Birinci(), Ikinci(), Ucuncu()],
        // controllerimizi atadık
        controller: controller,
      ),
      // bottom Navigation Barımızı oluşturuyoruz
      bottomNavigationBar: Material(
        color: Colors.black87,
        // navigation bar için tab butonlarını oluşturuyoruz.
        child: TabBar(
          // conrollerimizi atadık
          controller: controller,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.adb)),
            Tab(icon: Icon(Icons.airport_shuttle)),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------- Sayfalar -------------------------------- */
/* ---- Basit olsun diye aynı dart dosyasında, normalde ayrı oluşturulur. --- */

//Sayfalar Örnek olsun diye içerisinde sadece icon var ama istebilen her şey eklenebilir.
class Birinci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.android, size: 160.0, color: Colors.white),
            Text("Birinci Sayfa", style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}

class Ikinci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.thumb_up, size: 160.0, color: Colors.white),
            Text("İkinci Sayfa", style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}

class Ucuncu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.wb_sunny, size: 160.0, color: Colors.black87),
            Text("Üçüncü Sayfa", style: TextStyle(color: Colors.black87))
          ],
        ),
      ),
    );
  }
}
