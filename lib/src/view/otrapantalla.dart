import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless vs Stateful"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PrimeraColumna(),
          SegundaColumna(),
        ],
      ),
    );
  }
}

class PrimeraColumna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Like This: "),
      ],
    );
  }
}

class SegundaColumna extends StatefulWidget {
  @override
  _SegundaColumnaState createState() => _SegundaColumnaState();
}

class _SegundaColumnaState extends State<SegundaColumna> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(liked ? Icons.star : Icons.star_border),
          onPressed: () {
            setState(() {
              liked = !liked;
            });
          },
        )
      ],
    );
  }
}
