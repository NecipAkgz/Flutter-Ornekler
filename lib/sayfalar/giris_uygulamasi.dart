import 'package:flutter/material.dart';

class BasitUygulama extends StatelessWidget {

  static const String routeName = '/basit_uygulama';

  @override
  Widget build(BuildContext context) {
    // Scaffold'a uygulamamızın zemini diyebiliriz
    // Birçok önceden tanımlı yapıyı kullanmamıza olanak verir örn: (AppBar,Drawer,Fab)
    return Scaffold(
      // Uygulamamızın üst tarafında görünen bar
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      // Scaffold'un bize sağladığı alanın orta kısmı
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
