import 'package:flutter_ornekler/anaEkran/arama_islemleri.dart';
import 'package:flutter_ornekler/yardimci_siniflar/rasgele_renk.dart';
import 'package:flutter_ornekler/yardimci_siniflar/sayfalar.dart';
import 'package:flutter/material.dart';

const _gradientColor = LinearGradient(colors: [
  Color(0xFF3c1053),
  Color(0xFFad5389),
]);

const _textStyle = TextStyle(fontWeight: FontWeight.w600);

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF24243e),
        centerTitle: true,
        title: Text("Flutter Örnekler"),
        actions: [_aramaButonu(context)],
      ),
      body: sayfagetir(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  /// bottomNavigationBarımızı çağırır
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF24243e),
      fixedColor: Colors.amberAccent,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      onTap: (sayfa) {
        setState(() => index = sayfa);
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text("Flutter Temel"),
          icon: Icon(Icons.widgets),
        ),
        BottomNavigationBarItem(
          title: Text("Kısa Kısa Widgetler"),
          icon: Icon(Icons.show_chart),
        ),
      ],
    );
  }

  /// İndex Numarasına göre ilgili sayayı getirir
  sayfagetir() {
    switch (index) {
      case 0:
        return _flutterTemel();
      case 1:
        return _kisaKisaWidgetler();
    }
  }

  /// arama yapmak için oluşturduğumuz buton
  IconButton _aramaButonu(BuildContext context) {
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

  Widget _flutterTemel() {
    return Container(
      decoration: BoxDecoration(
        gradient: _gradientColor,
      ),
      child: ListView.builder(
        itemCount: FLUTTER_TEMEL.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Container(
              decoration: _boxDecoration(),
              child: ListTile(
                leading: Icon(Icons.arrow_downward),
                onTap: () => Navigator.pushNamed(
                  context,
                  FLUTTER_TEMEL[index]["sayfaAdi"],
                ),
                title: Text(
                  "${index + 1} - ${FLUTTER_TEMEL[index]["baslik"]}",
                  style: _textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _kisaKisaWidgetler() {
    return Container(
      decoration: BoxDecoration(
        gradient: _gradientColor,
      ),
      child: ListView.builder(
        itemCount: KISA_KISA_WIDGETLER.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Container(
              decoration: _boxDecoration(),
              child: ListTile(
                leading: Icon(Icons.arrow_downward),
                onTap: () => Navigator.pushNamed(
                  context,
                  KISA_KISA_WIDGETLER[index]["sayfaAdi"],
                ),
                title: Text(
                  "${index + 1} - ${KISA_KISA_WIDGETLER[index]["baslik"]}",
                  style: _textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          RasgeleRenk.renkUret(minBrightness: 100),
          RasgeleRenk.renkUret(minBrightness: 100),
        ],
      ),
    );
  }
}
