import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SafeArea kullandığımız işletim sistemine arayüzünü koruyacak
    // sağüst köşedeki saat,wifi gibi kısımları gösteren yer
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _sliverAppBar(),
            _sliverList(),
            _normalWidget(),
            _sliverListBuilder(),
            _sliverGrid()
          ],
        ),
      ),
    );
  }
}

SliverAppBar _sliverAppBar() {
  return SliverAppBar(
    // Kullanıcı appBar'a doğru sürükleme yaptığında hemen appBar görünür olsunmu ?
    floating: false,
    // pinned true yaparsak appBar tamamen hiç bir zaman kaybolmaz
    pinned: true,
    // Başlığı ortalar
    centerTitle: true,
    // Başlıkdan önce görünecek Widget
    leading: Icon(Icons.arrow_downward),
    // Genişlemiş boyutunun ne kadar olacağı
    expandedHeight: 200,
    flexibleSpace: FlexibleSpaceBar(
      // Arkaplana herşey koyabiliriz, örnekte internet üzerinden resim eklendi
      background: Image.network(
        "https://picsum.photos/id/91/400/200",
        fit: BoxFit.fill,
      ),
      title: Text("Sliver App Bar"),
    ),
  );
}

// Elemanları Tek tek ekleyebileceğimiz List
SliverList _sliverList() {
  return SliverList(
    // 30 adet Dummy Widget oluşturup Tek tek widget eklemiş gibi simule ettik
    delegate: SliverChildListDelegate(List.generate(20, (index) {
      return Container(
        color: RasgeleRenk.renkUret(),
        height: 100,
      );
    })),
  );
}

// Slivers olarak herhangi bir widget eklemek istersek yararlanacağımız Widget
SliverToBoxAdapter _normalWidget() {
  return SliverToBoxAdapter(
    child: Container(
      height: 100,
      child: Center(child: Text("Ben Normal bir Widgetim")),
    ),
  );
}

// Builder Yardımı ile Liste elemanı oluşturma
SliverList _sliverListBuilder() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 50,
          color: RasgeleRenk.renkUret(),
          child: Text("$index. Eleman", textAlign: TextAlign.center),
        );
      },
      childCount: 20,
    ),
  );
}

SliverGrid _sliverGrid() {
  return SliverGrid(
    gridDelegate:
        SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50),
    delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        color: RasgeleRenk.renkUret(),
      );
    }, childCount: 108),
  );
}

/// Rasgele renk üretmeye Yarayan Sınıf
class RasgeleRenk {
  static final random = Random();

  /// Verilen minimum parlaklık derecesinde rasgele renk döner
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
