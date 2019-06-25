import 'package:flutter/material.dart';

// Statefull Widgetimiz
class StatefullUygulama extends StatefulWidget {
  @override
  StatefullUygulamaState createState() => StatefullUygulamaState();
}

// Statefull Widgediğimizin State'i
class StatefullUygulamaState extends State<StatefullUygulama> {
  int sayi = 0;

  // Azalt Butonuna tıklanıca sayimizi 5 azaltacak ve statemizi ekrana tekrardan çizecek
  void btnAzalt() {
    setState(() {
      sayi -= 5;
    });
  }

  // Azalt Butonuna tıklanıca sayimizi 5 artıracak ve statemizi ekrana tekrardan çizecek
  void btnArttir() {
    setState(() {
      sayi += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Widget!")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$sayi",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  // Sayi küçükse 0 dan kırmızı değilse rengi yeşil olucak
                  color: sayi < 0 ? Colors.red : Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Butonlarımızın onPress kısmına yani dokununca şunu yap
                // kısmına metodlarımızı belirtiyoruz
                RaisedButton(
                  color: Colors.red,
                  child: Text("Azalt - "),
                  onPressed: btnAzalt,
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text("Arttır + "),
                  onPressed: btnArttir,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
