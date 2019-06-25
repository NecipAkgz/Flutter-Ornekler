import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      // İçerisindeki widgetler ekrana sığmayınca aşşağı kaydırma özelliği ekleyen Widget
      body: SingleChildScrollView(
          // Column : İçerisine yukardan aşağıya birden çok widget ekleyebileceğimiz Widget
          child: Column(
        // içerisine eklenen ögelerin start yani sol üstten başlamasını istedik
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.redAccent,
            child: Text("Hello world"),
          ),
          Container(
            color: Colors.yellow,
            padding:
                // child'ın etrafına boşluk ekler
                EdgeInsets.only(left: 10.0, right: 50.0, top: 10, bottom: 30),
            child: Container(
              color: Colors.green,
              child: Text("Padding"),
            ),
          ),
          Container(
            width: 200.0,
            height: 100.0,
            color: Colors.amber,
            child: Text("width = 200 , height = 100"),
          ),
          Container(
            color: Colors.red,
            child: Container(
              margin: EdgeInsets.all(25),
              color: Colors.green,
              child: Text("margin"),
            ),
          ),
          Container(
            color: Colors.black38,
            alignment: Alignment.bottomRight,
            height: 200,
            child: Text("alignment"),
          ),
          Container(
            color: Colors.teal,
            constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
            child: Text("BoxConstraints constraints"),
          ),
          Container(
            color: Colors.greenAccent,
            constraints: BoxConstraints.expand(height: 50),
            child: Text("BoxConstraints.expand: height : 50 ,width : sınırsız"),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 100.0),
            padding: EdgeInsets.all(10),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                color: Colors.redAccent),
            child: Text("decoration: ShapeDecoration"),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 200.0),
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.redAccent, Colors.yellow]),
                shape: BoxShape.circle),
            child: Text("decoration: BoxDecoration"),
          ),
        ],
      )),
    );
  }
}
