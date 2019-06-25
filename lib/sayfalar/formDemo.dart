import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  // Formuzun durumunu kontrol yönetebilmek için key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form İle Login Paneli")),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          // autovalidate true yaparsak form ögelerini anlık kontrol eder
          // autovalidate: true,
          // Oluşturduğumuz Keyi Atadık
          key: _formKey,
          child: formOgeleri(),
        ),
      ),
    );
  }

  LoginBilgileri login = LoginBilgileri();

  Column formOgeleri() {
    return Column(
      children: <Widget>[
        TextFormField(
          // dogrulama yapacak methodlar atandı
          validator: _emailDogrula,
          onSaved: (email) => login.email = email,
          // keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com', labelText: 'E-mail Address'),
        ),
        TextFormField(
          // dogrulama yapacak methodlar atandı
          validator: _sifreDogrula,
          onSaved: (sifre) => login.sifre = sifre,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password', labelText: 'Şifrenizi Giriniz'),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Temizle"),
              onPressed: _btnTemizle,
            ),
            RaisedButton(
              child: Text("Gönder"),
              onPressed: _btnGonder,
            ),
          ],
        )
      ],
    );
  }

  /// Temizle butonu için ekranı temizleme methodu
  void _btnTemizle() {
    _formKey.currentState.reset();
  }

  /// Gönder butonuna basınca belirttiğimiz formKey üzerinden ilk önce
  /// doğrulama işlemi tamam mı diye bakıcak, eğer doğru ise onSaved methodlarını tetikleyecek
  /// ve kaydedilen değerleri yazdıracak
  void _btnGonder() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(login.toString());
    }
  }

  /// Girilen mail adresinin e-mail standartlarında olup olmadığını kontrol edecek
  String _emailDogrula(gelenMail) {
    if (!isEmail(gelenMail)) {
      return "Hatalı Mail adresi";
    }
    return null;
  }

  /// Şifre uzunluğu 4 den küçük 8 den büyük olamaz
  String _sifreDogrula(gelenSifre) {
    if (!isLength(gelenSifre, 4, 8)) {
      return "Şifre uzunluğu 4 den küçük 8 den büyük olamaz";
    }
    return null;
  }
}

class LoginBilgileri {
  String email;
  String sifre;

  @override
  String toString() {
    return "Mail Adresi : $email \n Şifre : $sifre";
  }
}
