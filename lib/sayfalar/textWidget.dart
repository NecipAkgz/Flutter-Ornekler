import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Widgeti")),
      //widgetlerimiz ekrana sığmayacak kadar büyür ise aşşağı sürüklenme özelliği vericek.
      body: SingleChildScrollView(
        child: Column(
          // İçerisindeki widgetleri bağlangıç noktalarına yani sola dayıyacak
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Özellikleri oynanmamış widget"),
            Text(
              "TextStyle ile özelleştirme",
              style: TextStyle(
                // Textimizin rengi
                color: Colors.amberAccent,
                // Font Büyüklüğü
                fontSize: 22,
                // arkaPlan rengi verir
                backgroundColor: Colors.black87,
                // tutacağı yerin yüksekliği (font büyüklüğü ile çarpılır)
                height: 1.2,
                // Kelimeler arasındaki boşluk
                wordSpacing: 10,
                // harfler arasındaki boşluk
                letterSpacing: 5,
              ),
            ),
            Text(
              "Text Foreground Özelleştirme",
              style: TextStyle(
                fontSize: 30,
                foreground: Paint()
                  ..color = Colors.red
                  // boyama stilini boşluklu şekilde yapar
                  ..style = PaintingStyle.stroke
                  // stroke uygularken aralardaki boşluk
                  ..strokeWidth = 0.8,
              ),
            ),
            Text(
              "TextStyle FontWeight 700",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
            Text(
              "TextStyle FontStyle italic",
              style: TextStyle(
                fontSize: 26,
                color: Colors.pink,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "TextStyle Tekli Shadow",
              style: TextStyle(
                fontSize: 26,
                color: Colors.black87,
                shadows: [
                  Shadow(
                    // Gölgenin rengi
                    color: Colors.black,
                    // ilk parametre yatay başlangıç noktası 2. dikey
                    offset: Offset(2, 2),
                    // sıçrama genişliği
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            Text(
              "TextStyle Birden Çok Shadow",
              style: TextStyle(
                fontSize: 26,
                color: Colors.deepPurple,
                shadows: [
                  Shadow(
                    // Gölgenin rengi
                    color: Colors.black,
                    // ilk parametre yatay başlangıç noktası 2. dikey
                    offset: Offset(2, 2),
                    // sıçrama genişliği
                    blurRadius: 2,
                  ),
                  Shadow(
                    // Gölgenin rengi
                    color: Colors.blueAccent,
                    // ilk parametre yatay başlangıç noktası 2. dikey
                    offset: Offset(3, 6),
                    // sıçrama genişliği
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            Text(
              "TextStyle decoration underline",
              style: TextStyle(
                fontSize: 26,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            Text(
              "TextStyle decoration lineThrough",
              style: TextStyle(
                fontSize: 26,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.blue,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            Text(
              "Özel Font Kullanımı",
              style: TextStyle(
                fontSize: 26,
                // pupspec.yaml'da family adı olarak verdiğim ismi yazdım
                fontFamily: "SigmarOne",
              ),
            ),
            // Gösterebilmek için 300 e 30 bir kutu
            Container(
              constraints: BoxConstraints.expand(width: 300, height: 30),
              color: Colors.amberAccent,
              child: Text(
                "TextAlign.end",
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: 5),
            Container(
              constraints: BoxConstraints.expand(width: 300, height: 30),
              color: Colors.greenAccent,
              child: Text(
                "Buradaki yazı sağdan sola olacak şekilde düzenlendi",
                textDirection: TextDirection.rtl,
              ),
            ),
            // softwarp açık
            Container(
              color: Colors.red,
              constraints: BoxConstraints.expand(height: 40, width: 200),
              child: Text("Buradaki text ekrana sığmaz ise alt satıra geçer",
                  softWrap: true),
            ),
            // softwarp kapalı
            Container(
              color: Colors.blue,
              constraints: BoxConstraints.expand(height: 40, width: 200),
              child: Text(
                "Buradaki  girilen text ekrana sığmaz ise görünmeyecek",
                softWrap: false,
              ),
            ),
            Container(
              color: Colors.lightGreen,
              constraints: BoxConstraints.expand(height: 40, width: 200),
              child: Text(
                "Ekrana sığmayan text'in nasıl görünmesini istersiniz",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
