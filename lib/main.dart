import 'package:flutter_ornekler/rotalar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: rotalar,
      // home: GirisSayfasi(),
    );
  }
}
