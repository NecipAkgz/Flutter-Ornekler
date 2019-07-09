import 'package:flutter/material.dart';
import 'package:flutter_ornekler/rotalar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: rotalar,
      // home: SafeAreaDemo(),
    );
  }
}
