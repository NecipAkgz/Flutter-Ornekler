import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView"), backgroundColor: Colors.teal),
      body: _myListView(context),
    );
  }

  Widget _myListView(BuildContext context) {
    final titles = [
      'bike',
      'boat',
      'bus',
      'car',
      'railway',
    ];

    final icons = [
      Icons.directions_bike,
      Icons.directions_boat,
      Icons.directions_bus,
      Icons.directions_car,
      Icons.directions_railway,
    ];

    return ListView.builder(
      // Listemisin uzunluğu
      itemCount: titles.length,
      itemBuilder: (context, index) {
        // InkWell ile sarmaladık
        return InkWell(
          // InkWell onTap özelliği
          onTap: () => print(titles[index]),
          // InkWell'in özelliklerinden sadece bir tanesi olan splash
          // yani dokununca oluşan dalgalanmanın rengini değiştirme
          splashColor: Colors.green,
          child: Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(icons[index]),
              title: Text(titles[index]),
            ),
          ),
        );
      },
    );
  }
}
