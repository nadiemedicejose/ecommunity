import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String texto;

  const Boton({
    Key key,
    this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(texto),
        ),
        onPressed: () {},
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }
}
