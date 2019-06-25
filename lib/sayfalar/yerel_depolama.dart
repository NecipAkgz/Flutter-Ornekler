import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class YerelDepolama extends StatefulWidget {
  @override
  _YerelDepolamaState createState() => _YerelDepolamaState();
}

class _YerelDepolamaState extends State<YerelDepolama> {
  // veri girişinden gelen verileri almak için controller
  TextEditingController textEditingController = TextEditingController();
  // Depo Sınıfımızdan nesne ürettik
  final Depo depom = Depo();
  // gelen veriyi tutması için değişken
  String dosyaicerigi = "";

  // Uygulama Açıldığında yerel dosyadaki veriyi okuyup
  // veriyi tutması için oluşturduğumuz değişgene atadık
  @override
  void initState() {
    super.initState();
    depom.dosyadanOku().then((veri) => dosyaicerigi = veri);
  }

  /// Yazdır Butonuna tıklanınca çalışacak TextField'daki veriyi yerel dosyamıza yacazak
  void _dosyamaYaz() {
    depom.dosyayaYaz(textEditingController.text.toString());
    // Yazdırdıktan sonra TextField'i temizlemesi için
    textEditingController.clear();
  }

  /// Oku Butonuna Tıklanınca Çalışacak yerel dosyadaki veriyi okuyup "dosyaicerigi"
  /// degisgenine atayacak
  void _dosyamdanOku() async {
    var gelenVeri = await depom.dosyadanOku();
    setState(() {
      dosyaicerigi = gelenVeri;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yerel Dosyaya Depolama")),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textEditingController,
            maxLines: 2,
            decoration:
                InputDecoration(hintText: "Kaydedilecek text'i giriniz"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Dosyaya Yaz"),
                onPressed: _dosyamaYaz,
              ),
              RaisedButton(
                child: Text("Dosyadan Oku"),
                onPressed: _dosyamdanOku,
              ),
            ],
          ),
          // Gelen veriyi ekranada göstermesi için text
          Text(dosyaicerigi)
        ],
      ),
    );
  }
}

/* --------------------- Dosya İşlemleri için sınıfımız --------------------- */

class Depo {
  // Oluşturacağımız dosyanın klasör yolunu bulucak
  // Uygulama ios'da çalışırsa ios için android ise android için
  Future<String> get _klasorYolu async {
    Directory klasor = await getApplicationDocumentsDirectory();
    return klasor.path;
  }

  // Dosyamızı oluşturacak ve her çağırdığımızda o dosyayı dönecek
  Future<File> get _dosya async {
    var yol = await _klasorYolu;
    return File("$yol/dosya.txt");
  }

  /// parametre olarak verilen veriyi String olarak dosyamıza yazıcak
  Future<File> dosyayaYaz(yazilacakVeri) async {
    var dosyam = await _dosya;
    // FileMode.append şeklinde mod belirtirsek eknenen her veride eskiyi silmek
    // yerine sonuna ekleyerek devam edecektir.
    // return dosyam.writeAsString(yazilacakVeri, mode: FileMode.append);
    return dosyam.writeAsString(yazilacakVeri);
  }

  /// Verdiğimiz dosya'yı String olaracak okuyacak ve  geri dönderecek
  /// Hatalı yakalarsa da onu dönderecek
  Future<String> dosyadanOku() async {
    try {
      var dosya = await _dosya;
      String dosyaicerigi = await dosya.readAsString();
      return dosyaicerigi;
    } catch (e) {
      return "Dosya Boş veya Hatalı";
    }
  }
}
