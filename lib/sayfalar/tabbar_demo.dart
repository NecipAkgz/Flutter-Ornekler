import 'package:flutter/material.dart';

/* -------------------------------- 1.öntem ------------------------------- */

class TabbarDemo extends StatefulWidget {
  @override
  TabbarDemoState createState() => TabbarDemoState();
}

// Tabbar'ın kullanılacağı clasımıza SingleTickerProvider ekliyoruz.
// bu bize geçiş animasyolarını yapmamız için gerekli
class TabbarDemoState extends State<TabbarDemo>
    with SingleTickerProviderStateMixin {
/* ----------------------- Tab Bar Oluşturma Başlanğıç ---------------------- */

  // Tabbar üzerinde gerekli kontroleri yapmamıza olanak vericek contollerimiz
  TabController controller;

  // Clasımızın initState'i içerisinde contollerimizi tanımlıyoruz.
  // initState = Widget oluştuğu anda içerisinde verilen işlemleri yapar
  @override
  void initState() {
    super.initState();

    // contolleri tanımlarken tabbar'da kaç öğe olucağını(bu örnek için 3)
    // ve SingleTickerProvider'ın bize sağladı animasyon için gerekli olan
    // vsync özelliğinin bu controll üzerinde gerçekleşeceğini sözlüyoruz.
    controller = TabController(length: 3, vsync: this);
  }

  // dispose = classla işimiz bittiğinde olucak olanlar
  // gereksiz kaynak harcamaması için contollerimizi kapatıyoruz
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Tab Barımızı daha sonra kullanmak için oluşturuyoruz
  // Bu önek için 3 tane içerisinde sadece icon olan Tabbar
  TabBar getTabBar() {
    return TabBar(
      // contollerimizi atadık
      controller: controller,
      tabs: <Tab>[
        Tab(icon: Icon(Icons.favorite)),
        Tab(icon: Icon(Icons.adb)),
        Tab(icon: Icon(Icons.airport_shuttle)),
      ],
    );
  }

  // Scaffold'umuzun gövde kısmı için Tabbar'ın sayfaları için gerekli olan
  // TabBarView oluşturuyoruz, Scaffold body kısmında kullanılacak
  TabBarView getTabBarView(var sayfalar) {
    return TabBarView(
      // methodumuz kullanılırken parametre olarak verilen sayfaları
      // TbbarView'imize atıyoruz
      children: sayfalar,
      // Aynı Tabbar controlünü senkron çalışmasını için bunada atıyoruz
      controller: controller,
    );
  }
  /* ----------------------- Tab Bar Oluşturma Bitiş ---------------------- */

/* --------------- Oluşturulan Tabbar Ve TabbarView kullanımı --------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tabbar Kullanım"),
          // AppBar'ın bottom özelliğine yukarıda oluşturduğumuz tabbarı ekliyoruz
          bottom: getTabBar(),
        ),
        // Set the TabBar view as the body of the Scaffold
        // Scaffold Boddy kısmına ise yine yukarıda oluşturduğumuz
        // TabbarView'imizi çağırıp parametre olarak sayfalarımızı veriyoruz
        body: getTabBarView([
          Birinci(),
          Ikinci(),
          Ucuncu(),
        ]));
  }
}

/* -------------------------------- 2.Yöntem ------------------------------- */
class TabbarYontemiki extends StatefulWidget {
  @override
  _TabbarYontemikiState createState() => _TabbarYontemikiState();
}

class _TabbarYontemikiState extends State<TabbarYontemiki> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Tabbar'ımızın kaç elemanı olucak ?
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbar 2. Yöntem"),
          // elemanlarımızın iconları isimleri vb.
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
              ),
              Tab(
                icon: Icon(Icons.star),
              ),
            ],
          ),
        ),
        // TabBarView içerisine Tabbar içerisindeki elemanlarla
        // eşleşicek sayfaları ekliyoruz
        body: TabBarView(
          children: <Widget>[
            Birinci(),
            Ikinci(),
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
        child:
            Center(child: Icon(Icons.android, size: 150.0, color: Colors.red)));
  }
}

class Ikinci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Icon(Icons.headset, size: 150.0, color: Colors.green)));
  }
}

class Ucuncu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child:
                Icon(Icons.phone_android, size: 150.0, color: Colors.black)));
  }
}
