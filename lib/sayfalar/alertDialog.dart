import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  // AlertDialogdan gelecek değeri tutacak olan değişken
  var isim = "Gelen isim ile Değişecek";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertDialog Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // isim değişkenini içeriğini ekranda göstericek
            Text(isim),
            RaisedButton(
              child: Text("Değer Dönen Alertdialog"),
              // Buton'a basılınca çalışacak method
              onPressed: () => _alertDialogCalistir(context),
            ),
            RaisedButton(
              child: Text("Basit Alertdialog"),
              // Buton'a basılınca çalışacak method
              onPressed: () => _basitAlertDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  // Buton'a basıldığında
  Future _alertDialogCalistir(BuildContext context) async {
    // Git _bilgiAlanAlerTdialog methodunu çalıştır
    // ve geri gelen değeri, gelenisim adlı değişgene ata
    var gelenisim = await _bilgiAlanAlertDialog(context);
    // gelenisimi, isim adlı değişgene atana ve ekranda gönmesi için
    // setState yap
    setState(() {
      isim = gelenisim;
    });
  }

/* -------------------------- BilgiAlan AlertDialog ------------------------- */

  // String olarak geri değer döneceği için Future<String> olarak belirttik
  Future<String> _bilgiAlanAlertDialog(context) async {
    // TextFiled'e girilen isimi tutucak değişken
    String isim = "";

    return showDialog<String>(
      context: context,
      // Dialog Kapatılamasın
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          // Başlık etrafındaki boşluğu sildik
          titlePadding: EdgeInsets.all(0),
          // içeriğin etrafına özel boşluk
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          // Başlık kısmı içerisine Container ve onunda içerisine text ekleyip başlık girildi
          title: Container(
            height: 50,
            color: Colors.green[400],
            child: Center(child: Text("İsminizi Giriniz")),
          ),
          // content içerisini Textfield eklendi
          content: TextField(
            decoration: InputDecoration(hintText: "Adınızı Giriniz"),
            // TextField'e her değer girildiğinde, isim değişkenimizin içeriğini değiştikdik
            onChanged: (deger) => isim = deger,
          ),
          actions: <Widget>[
            // 1 adet Gönder butonu eklendi
            OutlineButton(
              child: Text("Gönder"),
              // Gönder butonuna basılınca textField'e girilen değeri Future olarak geri yolaldık
              onPressed: () => Navigator.pop(context, isim),
            )
          ],
        );
      },
    );
  }

/* ---------------------------- Basit AlertDialog --------------------------- */

  _basitAlertDialog(context) {
    // showDialog ile Alertdialog kullanacağımızı belirtiyoruz
    showDialog(
      // fonksiyonumuz aracılığı aldığımız, kullanacağımız widgetdeki contex'imizi veriyoruz
      context: context,
      // Pencere dışına veya geri tuşuna basıldığında kapatılabilsin mi ?
      barrierDismissible: true,
      // builder yardımı ile AlertDialog widgetimizi doldurup ekranda gösteriyoruz.
      builder: (BuildContext context) {
        // Flutter içerisinde gelen AlertDialog widgetimizi oluşturmasını istedik
        return AlertDialog(
          // Başlık Kısmı
          title: Text("AlertDialog Başlık"),
          // Başlık etrafındaki boşluk
          titlePadding: EdgeInsets.all(20),
          // İçerik kısmı
          content: Text("Alert Dialog İçeriği"),
          // İçeriğin etrafından boşluk
          contentPadding: EdgeInsets.only(left: 20),
          // Arkaplan rengi
          backgroundColor: Colors.grey[200],
          // Seçenekler gibi şeyleri belirttiğimiz kısım
          // Genelde buton tipi widgetler kullanılır
          actions: <Widget>[
            FlatButton(
              child: Text("Kapat"),
              // Tıklandığında AlertDialog kapanması için
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
