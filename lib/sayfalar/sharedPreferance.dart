import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceDemo extends StatefulWidget {
  @override
  _SharedPreferanceDemoState createState() => _SharedPreferanceDemoState();
}

class _SharedPreferanceDemoState extends State<SharedPreferanceDemo> {
  // Temabilgimizi tutucak değişkene giriş değeri atatık
  bool temaDegeri = false;

  /// sharedPreferenceyi kontrol edip gelen değere göre,
  /// temaDegerimi güncelleyecek method, değer boş dönerse false atayacak
  preferanceVeriOku() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      temaDegeri = prefs.getBool("temaDegeri") ?? false;
    });
  }

  // switch widgetinden gelen değere göre sharedPreferancemizi güncelleyecek
  temaDegistir(value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("temaDegeri", value);
  }

  // Uygulama başlangıç da temaDegerini alıp yüklemesini istedik
  @override
  void initState() {
    super.initState();
    preferanceVeriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // tema datası temadeğeri true ise dark değilse light olacak
      data: temaDegeri ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(title: Text("Shared Preferances")),
        body: Center(
          child: Switch(
            value: temaDegeri,
            // Switch widgetinin değeri değişince gerekli fonksiyonları çalıştıracak
            onChanged: (value) {
              setState(() {
                temaDegistir(value);
                preferanceVeriOku();
              });
            },
          ),
        ),
      ),
    );
  }
}
