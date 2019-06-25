import 'package:flutter/material.dart';

class TextFieldOrnek extends StatefulWidget {
  @override
  TextFieldOrnekState createState() => TextFieldOrnekState();
}

class TextFieldOrnekState extends State<TextFieldOrnek> {
  // Girilen verileri tutucak değişkenimiz
  String sonuc = "";
  // TextField üzerinden bazı işlemleri yapmamıza olanak sağşayacak controllerimiz
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field Örnek")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                // TextFied'ımıza controllerimizi atadık
                controller: controller,
                // decoration ile bir kaç özelleştirme yaptık
                decoration: InputDecoration(
                    hintText: "Bir şeyler yazın...",
                    prefixIcon: Icon(
                      Icons.wb_sunny,
                      size: 40,
                    )),
                // Birşeyler girince girilen veriyi alıp değişkenimize atayıp
                // setState yardımıyla girilen verileri görmek için widgetimizi tekrar çizdirdik
                onChanged: (girilenVeri) {
                  setState(() {
                    sonuc = girilenVeri;
                  });
                },
              ),
              // Araya boşluk vermek için basit bir widget
              SizedBox(height: 10),
              // Girilen verileri ekranda görmek için Text Widgeti
              Text(sonuc),
              // controller kullanımına örnek vermek için FlatButton icon ekleyip
              // basıldığında verileri temizlenip setState yapılmasını istedik
              FlatButton.icon(
                icon: Icon(Icons.delete, color: Colors.red),
                label: Text("Temizle"),
                onPressed: () {
                  setState(() {
                    // controllerin bağlı olduğu widgetin içeriğini temizle
                    controller.clear();
                    // sonuc değişkenini temizle
                    sonuc = "";
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
