import 'package:flutter/material.dart';

class ResimEkleme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resim Ekleme")),
      body: Center(
        child: FittedBox(
          child: Column(
            children: <Widget>[
              YerelResim(),
              SizedBox(height: 10),
              InternetResim(),
            ],
          ),
        ),
      ),
    );
  }
}

class YerelResim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.amber,
          height: 300,
          width: 300,
          child: Image.asset(
            "assets/resimler/poster.jpg",
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}

class InternetResim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        height: 300,
        width: 300,
        child: Image.network(
          "https://picsum.photos/id/605/400/600.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
