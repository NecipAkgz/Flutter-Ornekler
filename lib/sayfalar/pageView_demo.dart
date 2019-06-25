import 'dart:math';

import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageView")),
      body: pageViewController(),
    );
  }

/* -------------------------------- PageView -------------------------------- */

  PageView buildPageView() {
    return PageView(
      children: <Widget>[
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.cyan,
        ),
        Container(
          color: Colors.deepPurple,
        ),
      ],
    );
  }

/* ---------------------------- PageView.builder ---------------------------- */

  PageView buildPageViewBuilder() {
    // Page controller oluşturulması
    PageController controller = PageController(
      // sayfalar bulunduğu konumda ne kadar yer kaplasın default : 1
      // viewportFraction: 2,
      // Diğer bir sayfaya gidip gelindiğinde o anki bulunduğu sayfayı hatırlasın mı ?
      keepPage: true,
      // Başlangıç Sayfası
      initialPage: 2,
    );

    return PageView.builder(
      physics: BouncingScrollPhysics(),
      // conrollerimizi atadık
      controller: controller,
      // İtemCount boş geçilirse sınırsız sayıda sayfa üretecektir
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Card(
            // RasgelenRenk sınıfından rasgele renk üretmeye yarıyan method
            color: RasgeleRenk.renkUret(),
            child: Center(
              child: Text("$index. Sayfa"),
            ),
          ),
        );
      },
    );
  }

/* ------------------------ PageController Kullanımı ------------------------ */

  Widget pageViewController() {
    // Page controller oluşturulması
    PageController controller = PageController();

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text("Önceki"),
              // pageController methodlarından yararlanarak butonumuza önceki sayfata geçiş ve
              // animasyonun gerçekleşme süresini belirterek
              // flutterda ön tanımlı olarak gelen basit animasyonlardan birini atadık
              onPressed: () => controller.previousPage(
                  duration: Duration(seconds: 1), curve: Curves.easeInCubic),
            ),
            RaisedButton(
              child: Text("6. Sayfata git"),
              // Tıklanıldığında 6 sayfaya animasyon geçişi ile gidicek
              onPressed: () => controller.animateToPage(6,
                  duration: Duration(seconds: 1), curve: Curves.easeInCubic),
            ),
            RaisedButton(
              child: Text("Sonraki"),
              // Buradada aynı işlem ileri sayfaya git ile yapıldı
              onPressed: () => controller.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.ease),
            ),
          ],
        ),
        Expanded(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            // conrollerimizi atadık
            controller: controller,
            // İtemCount boş geçilirse sınırsız sayıda sayfa üretecektir
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  // RasgelenRenk sınıfından rasgele renk üretmeye yarıyan method
                  color: RasgeleRenk.renkUret(),
                  child: Center(
                    child: Text("$index. Sayfa"),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RasgeleRenk {
  static final random = Random();

  /// Verilen minimum parpaklık değeri ile rasgele renk olusturur
  static Color renkUret({int minBrightness = 50}) {
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }
}
