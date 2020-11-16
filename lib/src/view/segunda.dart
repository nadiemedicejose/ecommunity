import 'package:flutter/material.dart';

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda Pantalla")),
      body: Center(
        child: RaisedButton(
          child: Text("Volver"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}