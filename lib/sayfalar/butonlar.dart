import 'package:flutter/material.dart';

class Butonlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text("Raised Button"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _raisedButon(),
            _shapeButton(),
            _digerButonlar(),
          ],
        ),
      ),
    );
  }

  Widget _raisedButon() {
    // İçerisinde bulunan widgetleri hizalamamıza sağlayan widget
    // Buttonları ortalamak için center parametresi ile kullanıldı
    return Align(
      alignment: Alignment.center,
      // Butonlara eşit boyut vermek için container kullandım
      child: Container(
        // yatay uzunluğu en fazla 200 olsun
        constraints: BoxConstraints.tightFor(width: 200),
        // Alt alta buttonlar eklemek için Column
        child: Column(
          // Parent widget'in yatay uzunkuğu kadar uzasın
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // onClick özelliğini kullanmazsak button Pasif olarak görünecektir
            RaisedButton(
              child: Text("Pasif"),
            ),
            RaisedButton(
              // İçersindeki Yazı
              child: Text("Aktif"),
              // rengi
              color: Colors.green,
              // yerden yüksekliği
              elevation: 10,
              // İçten boşluk
              padding: EdgeInsets.all(20),
              // Basıldığında oluşan dalga efektinin rengi
              splashColor: Colors.redAccent,
              // içerisindeki yazının rengi
              textColor: Colors.yellow,
              onPressed: () => print("Raised Buton'a tıklandı"),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.thumb_up),
              label: Text("İconlu Raised Button"),
              color: Colors.amber,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _shapeButton() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            color: Colors.blue,
            child: Text(
              "StadiumBorder",
              style: TextStyle(fontSize: 40),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            shape: StadiumBorder(
              side: BorderSide(color: Colors.amber, width: 1),
            ),
          ),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: () {},
            color: Colors.redAccent,
            child: Text(
              "RoundedRectangleBorder",
              style: TextStyle(fontSize: 30),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 4),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: () {},
            color: Colors.pink,
            child: Text(
              "BeveledRectangleBorder",
              style: TextStyle(fontSize: 20),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape: BeveledRectangleBorder(
                side: BorderSide(color: Colors.green, width: 4),
                borderRadius: BorderRadius.circular(50)),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                color: Colors.white,
                child: Text(
                  "Border",
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.all(30),
                shape: Border(
                  top: BorderSide(color: Colors.redAccent, width: 10),
                  bottom: BorderSide(color: Colors.pink, width: 10),
                  left: BorderSide(color: Colors.blue, width: 20),
                  right: BorderSide(color: Colors.green, width: 20),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text(
                    "Circle\nBorder",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.all(40),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.green, width: 4),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.white,
                child: Text(
                  "Border\nDirectional",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(20),
                shape: BorderDirectional(
                  top: BorderSide(color: Colors.redAccent, width: 10),
                  bottom: BorderSide(color: Colors.pink, width: 10),
                  start: BorderSide(color: Colors.blue, width: 20),
                  end: BorderSide(color: Colors.green, width: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                color: Colors.white,
                child: Text(
                  "Outline\nInputBorder",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(20),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 10),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.redAccent,
                child: Text(
                  "Underline\nInputBorder",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(20),
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 10),
                ),
              ),
            ],
          )
        ],
      );

  Widget _digerButonlar() {
    return Center(
      child: Column(
        children: <Widget>[
          // Default halinde arkaplanı olmayan buton
          FlatButton(
            child: Text("Flat Buton"),
            onPressed: () {},
            textColor: Colors.indigo,
          ),
          // İconlu hâli
          FlatButton.icon(
            icon: Icon(Icons.flag),
            label: Text("İcon ile Flat Buton"),
            onPressed: () {},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.outlined_flag),
            label: Text("OutlineButton.icon"),
            onPressed: () {},
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () {},
          ),
          // Genelde Scaffold un floating action özelliği ile kullandığımız
          // Uygulamanın sağ alt kısmına gelen Buton
          FloatingActionButton(
            child: Icon(Icons.add),
            // üzerine basılı tutunca kullanıcıya yardımcı amaçlı çıkacak yazı
            tooltip: "Floating action Button",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.new_releases),
            iconSize: 50,
            // üzerine basılı tutunca kullanıcıya yardımcı amaçlı çıkacak yazı
            tooltip: "İcon Button",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
