import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  @override
  _DigerFormElemanlariState createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diğer form elemanlari")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            buildCheckboxListTile(),
            buildRadioListTile(),
            buildSwitchListTile(),
            buildSlider(),
            buildDropdownButton(),
          ],
        ),
      ),
    );
  }

  // bir initial value vermek için ve değişimi tutmak için bir değişken oluşturduk
  bool checkBoxState = false;

  CheckboxListTile buildCheckboxListTile() {
    return CheckboxListTile(
      // Başlık kısmı
      title: Text("Checkbox Baslık"),
      // başlangıçdaki değeri (initial state) oluşturduğumuz değişkenden aldık
      value: checkBoxState,
      // Değiştirildiğinde (tıklandığında) ne olsun ?
      // tıklandığında gelen değeri değişkenimize atadık ve
      // değişikliği ekranda görebilmek için set State içerisine aldık
      onChanged: (bool value) {
        setState(() {
          checkBoxState = value;
        });
      },
      // Seçili olduğundaki rengi
      activeColor: Colors.green,
      // alt başlık
      subtitle: Text("CheckBox AltBaşlık"),
      // başlığın sol tarafına gelen kısım için widget
      secondary: Icon(Icons.account_box),
    );
  }

  // Seçilen şehri tutması için bir değişken
  String sehir = "";

  Widget buildRadioListTile() {
    return Column(
      children: <Widget>[
        RadioListTile(
          // RadioButon'umuzun tuttuğu değer
          value: "ADANA",
          // RadioButton grubumuzun değeri, bir den çok radio button kullanıyorsak
          // groupValue değerleri aynı olmalıdır, yoksa aralarındaki bağı bilemezler
          groupValue: sehir,
          // RadioButonumuzun tam karşı tarafında görünecek widget
          secondary: Icon(Icons.wb_sunny),
          // RadioButton'umuzun Ön yüzünde görünen Değeri
          title: Text("ADANA"),
          // Seçildiğinde seçilen değeri alıp sehir değişkenine atayacak
          onChanged: (String value) {
            setState(() {
              sehir = value;
            });
          },
        ),
        RadioListTile(
          value: "Ankara",
          groupValue: sehir,
          secondary: Icon(Icons.cloud),
          title: Text("ANKARA"),
          onChanged: (String value) {
            setState(() {
              sehir = value;
            });
          },
        ),
        RadioListTile(
          value: "Mersin",
          groupValue: sehir,
          secondary: Icon(Icons.wallpaper),
          title: Text("MERSİN"),
          onChanged: (String value) {
            setState(() {
              sehir = value;
            });
          },
        ),
      ],
    );
  }

  // initial state için ve değişimi tutması için değişkenimiz
  bool switchState = false;

  SwitchListTile buildSwitchListTile() {
    return SwitchListTile(
      // Aktif olduğundaki topun rengi
      activeTrackColor: Colors.greenAccent,
      // Aktif olduğundaki rengi
      activeColor: Colors.green,
      // o anki değeri
      value: switchState,
      // Görünen başlık kısmı
      title: Text("Wifi"),
      // alt başlık
      subtitle: Text("Wifiyi açar kapatır"),
      // Switch widgetinin tam tersi tarafta bulunan widgetimiz
      secondary: Icon(Icons.signal_wifi_4_bar),
      // Değişim olduğunda, değişen değeri değişkenimizi ata ve ekranda değişimi göster
      onChanged: (bool value) {
        setState(() {
          switchState = value;
        });
      },
    );
  }

  // Gelen Değeri tutması için değişkenimiz
  double sliderDeger = 0;

  Slider buildSlider() {
    return Slider(
      // Arka rengi
      inactiveColor: Colors.red,
      // Ön rengi
      activeColor: Colors.green,
      // O anki değer
      value: sliderDeger,
      // Minimum seçilebilen değer
      min: 0,
      // Maximum seçilebilen değer
      max: 100,
      // maximum değer kaça bölünerek seçim yapılabilsin
      // mesela max değer 100 ve biz 100 yazarsak 100'ü 100'e bölecek ve 1'er 1'er seçebilcez
      divisions: 100,
      // her değişim olduğunda görünecek değer
      label: "Yaşım : ${sliderDeger.round()}",
      // Değişim olduğunda değişen değeri değişkenimize at ve set State yap
      onChanged: (double value) {
        setState(() {
          sliderDeger = value;
        });
      },
    );
  }

  // Rengimizi tutması için değişkenimiz
  String secilenRenk;

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      // Bulunduğu bölgeyi yatay olarak kaplasın mı ?
      isExpanded: true,
      // içerisindeki yazıların stili
      style: TextStyle(fontWeight: FontWeight.bold),
      // ne ile ilgili olduğuyla alakalı kullanıcıyı bilgilendirebiliriz
      hint: Text("Renk Seçiniz"),
      // o anki değeri
      value: secilenRenk,
      items: [
        // Ve içerisindeki seçenekler
        DropdownMenuItem<String>(
          child: Text("Kırmızı", style: TextStyle(color: Colors.red)),
          value: "Kırmızı",
        ),
        DropdownMenuItem<String>(
          child: Text("Mavi", style: TextStyle(color: Colors.blue)),
          value: "Mavi",
        ),
        DropdownMenuItem<String>(
          child: Text("Yeşil", style: TextStyle(color: Colors.green)),
          value: "Yeşil",
        ),
      ],
      // Değişim olduğunda seçilen değeri değişkenimizi atamasını ve
      // ekranda görünmesi için setState
      onChanged: (String value) {
        setState(() {
          secilenRenk = value;
        });
      },
    );
  }
}
