import 'package:flutter/material.dart';

class StackVePositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack ve Positioned")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _enSadeHali(),
            SizedBox(height: 10),
            _alignOzelligi(),
            SizedBox(height: 10),
            _fitOzelligi(),
            SizedBox(height: 10),
            _overFlowVisible(),
            SizedBox(height: 10),
            _overFlowClip(),
            SizedBox(height: 10),
            _positioned(),
            SizedBox(height: 100),
            _stackOrnek(),
          ],
        ),
      ),
    );
  }

/* ------------------------------------ 1 ----------------------------------- */

  Widget _enSadeHali() {
    return Container(
      // Genişliği 160 olan bir kutu
      constraints: BoxConstraints.expand(height: 160),
      child: Stack(
        children: <Widget>[
          // Bir boy vs belirtmediğimiz için içinde bulunduğu containeri kaplıcak
          Container(color: Colors.amberAccent),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
            color: Colors.lightGreen,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 35, horizontal: 65),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

/* ------------------------------------ 2 ----------------------------------- */

  Widget _alignOzelligi() {
    return Container(
      constraints: BoxConstraints.expand(height: 160),
      color: Colors.indigo,
      child: Stack(
        // Stack içerisindeki Ögeleri Sağ Ortaya yasla.
        alignment: Alignment.centerRight,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 110, width: 110),
            color: Colors.amberAccent,
          ),
          Container(
            constraints: BoxConstraints.expand(height: 60, width: 60),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

/* ------------------------------------ 3 ----------------------------------- */

  Widget _fitOzelligi() {
    return Container(
      color: Colors.pink,
      margin: EdgeInsets.only(top: 10),
      constraints: BoxConstraints.expand(height: 220),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            constraints: BoxConstraints.expand(height: 60),
            color: Colors.amberAccent,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Container(
                  color: Colors.blueAccent,
                  child: Text(
                    "StackFit.loose",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            constraints: BoxConstraints.expand(height: 60),
            color: Colors.green,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  child: Text(
                    "StackFit.expand",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            constraints: BoxConstraints.expand(height: 60),
            color: Colors.redAccent,
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                  child: Text(
                    "StackFit.passthrough",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

/* ------------------------------------ 4 ----------------------------------- */

  Widget _overFlowVisible() {
    return Container(
      constraints: BoxConstraints.expand(height: 40),
      color: Colors.amberAccent,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: 15,
            child: Text(
              "içerisin de sığmayan kısım olsa bile görünecek,\npeki Zeki Müren de görebilecek mi ?",
            ),
          ),
        ],
      ),
    );
  }

/* ------------------------------------ 5 ----------------------------------- */

  Widget _overFlowClip() {
    return Container(
      constraints: BoxConstraints.expand(height: 40),
      color: Colors.pinkAccent,
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Positioned(
            top: 15,
            child: Text(
              "içerine sığmayan kısım kesilecek, \nBeni görebiliyormusunuz ?",
            ),
          ),
        ],
      ),
    );
  }

/* ------------------------------------ 6 ----------------------------------- */

  Widget _positioned() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.black87,
      constraints: BoxConstraints.expand(height: 100),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            top: 10,
            height: 60,
            width: 60,
            child: Container(color: Colors.redAccent),
          ),
          Positioned(
            right: 200,
            top: 30,
            height: 60,
            width: 60,
            child: Container(color: Colors.amberAccent),
          ),
          Positioned(
            right: 10,
            top: 10,
            height: 60,
            width: 60,
            child: Container(color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }

/* ------------------------------------ 7 ----------------------------------- */

  Widget _stackOrnek() {
    return Container(
      constraints: BoxConstraints.expand(width: 300, height: 200),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 80),
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.amberAccent,
            ),
          ),
          Positioned(
            top: 40,
            left: (150 - 40).toDouble(),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4sJrw1N2xdTpV05KS-6U59Le7cyQbBSrS7ff_oooEsMnq4KtA-A"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
