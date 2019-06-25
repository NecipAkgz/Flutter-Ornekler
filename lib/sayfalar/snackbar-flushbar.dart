import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

/* -------------------- Scaffold'a key atayarak Snackbar -------------------- */

class SnackBarDemo extends StatelessWidget {
  // Scaffold Durumunu tutan Keyimiz.
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Keyimizi atadık
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Snackbar Kullanımı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Varsayılan Snackbar"),
              onPressed: () => _scaffoldKeyileVarsayilan(),
            ),
            RaisedButton(
              child: Text("Basit FlushBar"),
              onPressed: () => showSimpleFlushbar(context),
            ),
            RaisedButton(
              child: Text("İnfo FlushBar"),
              onPressed: () => showInfoFlushbar(context),
            ),
            RaisedButton(
              child: Text("FlushBarHelper"),
              onPressed: () => showInfoFlushbarHelper(context),
            ),
          ],
        ),
      ),
    );
  }

  void showInfoFlushbarHelper(BuildContext context) {
    FlushbarHelper.createError(
      title: 'Hata',
      message: 'Hata Mesajı',
    ).show(context);
  }

  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      // icon yanıp yanıp sönsün mü ?
      shouldIconPulse: true,
      title: 'Uyarı!',
      message: 'Paranız gönderilmiştir',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue,
      ),
      // Sol tarafda görünen çubuk
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  // Basit FlushBar
  void showSimpleFlushbar(BuildContext context) {
    Flushbar(
      // Görünecek Mesajımız
      message: 'Hello from a Flushbar',
      // Görünmesini isdediğimiz özelleştirebileceğimiz butonumuz
      mainButton: FlatButton.icon(
        icon: Icon(Icons.account_balance),
        label: Text('Bana tıkla'),
        onPressed: () {},
      ),
      // Görüneceği süre
      duration: Duration(seconds: 3),
      // cascade operator ile değişken oluşturup, ona show demeden direk görünmesini istedik
    )..show(context);
  }

  void _scaffoldKeyileVarsayilan() {
    // scaffold keyimiz üzerinden snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("İÇERİK"),
        action: SnackBarAction(
          label: "Tıkla",
          onPressed: () {},
        ),
      ),
    );
  }
}

/* --------------------- Varsayılan Snackbar Uzun Yöntem -------------------- */

class SnackBarDemoVarsayilna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snackbar Kullanımı")),
      body: Center(
        child: SnackBarButton(),
      ),
    );
  }
}

// Snackbar İçin bir alt Widget
class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Varsayılan Snackbar"),
      onPressed: () => _varSayilanSnackbar(context),
    );
  }

  _varSayilanSnackbar(BuildContext context) {
    // Hangi Scaffold üzerinde görünecek ?
    // En yakınca Scaffold'umuzun intancesini alıyoruz.
    Scaffold.of(context).showSnackBar(
      SnackBar(
        // Snackbar İçerik olarka gösterilecek mesaj veya her hangi bir widget
        content: Text("Varsayılan Snackbar İçerik"),
        // Tıklama seçenekleri ekleme
        action: SnackBarAction(
          label: "Tıkla",
          // Tıklanınca Olucak Olanlar
          onPressed: () {},
        ),
      ),
    );
  }
}
