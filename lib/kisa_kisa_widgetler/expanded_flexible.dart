import 'package:flutter/material.dart';

class ExpandedVeFlexible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _expandedOlmadan(),
          SizedBox(height: 10),
          _expandedIle(),
          SizedBox(height: 10),
          _expandedFlex(),
          SizedBox(height: 10),
          _flexible()
        ],
      ),
    );
  }

  Widget _expandedOlmadan() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 100,
          width: 200,
          child: Text("Expanded Olmadan 1"),
        ),
        Container(
          color: Colors.green,
          height: 100,
          width: 150,
          child: Text("Expanded Olmadan 2"),
        ),
        Container(
          color: Colors.amberAccent,
          height: 100,
          width: 100,
          child: Text("Expanded Olmadan 3"),
        ),
      ],
    );
  }

  Widget _expandedIle() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
            height: 100,
            width: 200,
            child: Text("Expanded İle 1"),
          ),
        ),
        Container(
          color: Colors.green,
          height: 100,
          width: 150,
          child: Text("Expanded İle 2"),
        ),
        Container(
          color: Colors.amberAccent,
          height: 100,
          width: 100,
          child: Text("Expanded İle 3"),
        ),
      ],
    );
  }

  Widget _expandedFlex() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
            height: 100,
            child: Text("Flex 2"),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.green,
            height: 100,
            child: Text("Flex 4"),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.amberAccent,
            height: 100,
            child: Text("Flex 3"),
          ),
        ),
      ],
    );
  }

  // Flexfit.loose olarak ayarladığımız kısım, içindeki child'ın gerektirdiği
  // kadar yer kaplayacak, geri kalan kendine ayrılan alanı kullanmayacak
  Widget _flexible() {
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            color: Colors.red,
            height: 100,
            child: Text("FlexFit.loose"),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            color: Colors.green,
            height: 100,
            child: Text("FlexFit.tight"),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            color: Colors.amber,
            height: 100,
            child: Text("FlexFit.tight"),
          ),
        ),
      ],
    );
  }
}
