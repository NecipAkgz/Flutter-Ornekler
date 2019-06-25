import 'package:flutter/material.dart';

class RowVeColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row & Column"),
      ),
      body: Column(
        children: <Widget>[
          Text("Row", style: TextStyle(fontSize: 24)),
          _rowOlustur(),
          Text("Column", style: TextStyle(fontSize: 24)),
          _columnOlustur(),
        ],
      ),
    );
  }

  Widget _columnOlustur() {
    return Container(
      height: 300,
      width: 500,
      color: Colors.grey,
      child: Column(
        // Column - Yatay Hizalama
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Column - Dikey Hizalama
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: Colors.cyanAccent,
            width: 80.0,
            height: 80.0,
          ),
          Container(
            color: Colors.blueAccent,
            width: 80.0,
            height: 80.0,
          ),
          Container(
            color: Colors.orangeAccent,
            width: 80.0,
            height: 80.0,
          ),
        ],
      ),
    );
  }

  Widget _rowOlustur() {
    return Container(
      color: Colors.grey,
      height: 200,
      child: Row(
        // Row - Dikey Hizalama
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Row - Yatay Hizalama
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.cyanAccent,
            width: 80.0,
            height: 80.0,
          ),
          Container(
            color: Colors.blueAccent,
            width: 80.0,
            height: 80.0,
          ),
          Container(
            color: Colors.orangeAccent,
            width: 80.0,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
