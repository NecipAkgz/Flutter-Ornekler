import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("GridView Çeşitleri"),
        bottom: getTabBar(),
      ),
      body: getTabBarView(),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      isScrollable: true,
      indicator: BoxDecoration(
        // border: Border.all(width: 1),
        color: Colors.green,
      ),
      controller: tabController,
      tabs: <Widget>[
        Tab(text: "GridView.count"),
        Tab(text: "GridView.extend"),
        Tab(text: "GridView.builder"),
        Tab(text: "GridView.custom"),
      ],
    );
  }

  TabBarView getTabBarView() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        _gridViewCount(),
        _gridViewExtend(),
        _gridViewBuilder(),
        _gridViewCustom(),
      ],
    );
  }

  GridView _gridViewCustom() {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      childrenDelegate: SliverChildListDelegate(
        List.generate(50, (index) {
          return Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(10),
            color: Colors.orangeAccent,
            // Standart GridView işlemlerimiz için kullanabileceğimiz bir Widget
            // üst kısım(header) alt kısım(footer) orta kısım(child) diye bölümlendirilmiş
            child: GridTile(
              header: Text(
                'Başlık $index',
                textAlign: TextAlign.center,
              ),
              footer: Text(
                'Alt taraf $index',
                textAlign: TextAlign.center,
              ),
              child:
                  Icon(Icons.account_circle, size: 40.0, color: Colors.white),
            ),
          );
        }),
      ),
    );
  }

  GridView _gridViewBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        // gerektiği kadar yükleme özelliğini görmek için
        // index numararasına göre bize rasgele resim sağlayn bir siteden
        // yararlanıp her bir elemana resim koyduk
        return Image.network(
          "https://picsum.photos/id/$index/300/300",
          fit: BoxFit.fill,
        );
      },
    );
  }

  GridView _gridViewExtend() {
    return GridView.extent(
      // Maximum eleman boyutu
      maxCrossAxisExtent: 100,
      // çaprazlama olarak elemanları arasında boşluk verir
      crossAxisSpacing: 5,
      // yukardan aşşağı boşluk verir
      mainAxisSpacing: 5,
      padding: EdgeInsets.all(5),
      children: List.generate(50, (index) {
        return Container(
          color: Colors.amber,
          child: Center(child: Text("$index. Eleman")),
        );
      }),
    );
  }

  GridView _gridViewCount() {
    return GridView.count(
      // çaprazlamasına kaç tane eleman olucak ?
      // 3 Column'lu GridView üreticek
      // scrollDirection horizontal olursa 3 Row olarak üretir
      crossAxisCount: 3,
      // çaprazlama olarak elemanları arasında boşluk verir
      crossAxisSpacing: 5,
      // yukardan aşşağı boşluk verir
      mainAxisSpacing: 5,
      // genel olarak GridViewimizin kenarlarından boşluk verir
      padding: EdgeInsets.all(5),
      // Sürüklenme tarafını terse döndürür
      reverse: true,
      // default olarak Axis.veritical(aşşağı yukarı) olan sürüklenme tarafını değiştirmemize olanak sağlar
      scrollDirection: Axis.horizontal,
      // child widgetleri en boy oranını belirtebilmemizi sağlar default(1)
      childAspectRatio: 0.8,
      // GridView dolu görünmesini simule etmek için 50 elemanlık list
      // oluşturup, her elemanda ne yapması gerektiğini söyledik
      children: List.generate(50, (index) {
        return Container(
          color: Colors.amber,
          child: Center(child: Text("$index. Eleman")),
        );
      }),
    );
  }
}
