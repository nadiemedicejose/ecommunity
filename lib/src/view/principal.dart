import 'package:flutter/material.dart';
import 'package:ecommunity/src/view/segunda.dart';

class PrimeraPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera Pantalla"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Ir a la segunda pantalla"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (contexto) => SegundaPantalla(),
            ));
          },
        ),
      ),
    );
  }
}