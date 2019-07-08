import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeAreaDemo(),
    );
  }
}

class SafeAreaDemo extends StatefulWidget {
  @override
  _SafeAreaDemoState createState() => _SafeAreaDemoState();
}

class _SafeAreaDemoState extends State<SafeAreaDemo> {
  bool _acikmi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        // Sağ, Sol, Alt, Üst olarak belirtebileceğimiz gibi
        // belirtmediğimiz zaman hepsini kapsar
        top: _acikmi,
        bottom: _acikmi,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _ustTaraf(),
            _ortaTaraf(),
            _altTaraf(),
          ],
        ),
      ),
    );
  }

  Widget _ustTaraf() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text(
          "SafeArea Örnek",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.wb_cloudy),
      ),
    );
  }

  /// Switch durumuna göre safeAre'yı açıp kapayacak
  Widget _ortaTaraf() {
    return Card(
      child: SwitchListTile(
        secondary: Icon(Icons.all_inclusive),
        onChanged: (deger) {
          setState(() {
            _acikmi = deger;
          });
        },
        value: _acikmi,
        title: Text(
          "Aç - Kapa",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _altTaraf() {
    return Card(
      child: ListTile(
        onTap: () => Navigator.pop(context),
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Geri Git",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
