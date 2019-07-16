import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity"),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: <Widget>[
          _opacityOrnek(),
          _animatedOpacity(),
        ],
      ),
    );
  }

  // AnimatedOpacity Widgeti başlangıç değeri
  double animatedOpacityDeger = 1;

  Widget _animatedOpacity() {
    return Column(
      children: <Widget>[
        AnimatedOpacity(
          // Animasyon değeri nasıl azalıp artsın
          curve: Curves.easeInCubic,
          // animasyonun gerçekleşme süresi
          duration: Duration(seconds: 1),
          // opacity başlangıç değeri
          opacity: animatedOpacityDeger,
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.pink,
            child: Center(child: Text("Animated Opacity")),
          ),
        ),
        RaisedButton(
          child: Text("Tıkla Bana"),
          onPressed: () {
            setState(() {
              animatedOpacityDeger == 1.0
                  ? animatedOpacityDeger = 0.0
                  : animatedOpacityDeger = 1.0;
            });
          },
        ),
      ],
    );
  }

  // text'in Opacity widgeti için başlangıç değeri
  double textOpacity = 1;
  // FlutterLogonun Opacity widgeti için başlangıç değeri
  double logoOpacity = 1;

  Column _opacityOrnek() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.amberAccent,
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Opacity(
                opacity: textOpacity,
                child: Text(
                  "Opacity ile sarmaladığımız widgetlerin saydamlık değerleriyle oynayabiliriz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Opacity(
                opacity: logoOpacity,
                child: FlutterLogo(
                  size: 100,
                ),
              )
            ],
          ),
        ),
        Slider(
          divisions: 20,
          min: 0,
          max: 1,
          label: "Text $textOpacity",
          value: textOpacity,
          onChanged: (value) {
            setState(() {
              textOpacity = value;
            });
          },
        ),
        Slider(
          divisions: 20,
          min: 0,
          max: 1,
          label: "Logo $logoOpacity",
          value: logoOpacity,
          onChanged: (value) {
            setState(() {
              logoOpacity = value;
            });
          },
        ),
      ],
    );
  }
}
