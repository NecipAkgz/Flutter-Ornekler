import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navagation Drawer"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close),
          )
        ],
      ),
      // Scaffold'un drawer özelliğine Drawer oluşturması için yarattığımız
      // Methodu çağırdık
      drawer: _drawerOlustur(context),
      body: Center(
        child: Text("Merhaba", style: TextStyle(fontSize: 40)),
      ),
    );
  }

  Widget _drawerOlustur(context) {
    return Drawer(
      child: ListView(
        children: [
          // Drawerimizin üst kısmı
          UserAccountsDrawerHeader(
            // Arkaplan rengi
            decoration: BoxDecoration(color: Colors.black87),
            // Şuanki kullanıcının resmi
            currentAccountPicture: CircleAvatar(
                child: CircleAvatar(
              child: Text("N", style: TextStyle(fontSize: 40)),
            )),
            // Kullanıcı ismi
            accountName: Text("Necip Akgz"),
            // Kullanıcı Mail
            accountEmail: Text("necip.akgz@gmail.com"),
          ),
          // Ayarlar Seçeneği
          ListTile(
            title: Text("Ayarlar"),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward),
            // Menü kapanması için
            onTap: () => Navigator.of(context).pop(),
          ),
          // Mail Seçeneği
          ListTile(
            title: Text("Mail"),
            leading: Icon(Icons.mail),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
