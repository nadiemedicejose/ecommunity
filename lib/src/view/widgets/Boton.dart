import 'package:flutter/material.dart';

class Boton {
  Padding botonAccion(String texto, {Function accion}) {
    var aBoton = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: () => accion(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(texto),
        ),
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
    return aBoton;
  }
}

class oldButton extends StatelessWidget {
  final String texto;

  const oldButton({
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
        onPressed: () {
          Navigator.of(context).pop();
        },
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }
}
