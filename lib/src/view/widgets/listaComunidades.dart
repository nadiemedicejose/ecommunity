import 'package:flutter/material.dart';
import 'AvatarComunidad.dart';

List<Widget> _communities() {
  List<Widget> comunidades = [];
  final int total = 5;
  for (int i = 0; i < total; i++) {
    if (i < total - 1) {
      comunidades.add(AvatarComunidad());
      comunidades.add(SizedBox(width: 5));
    } else {
      comunidades.add(AvatarComunidad());
    }
  }
  return comunidades;
}

class Comunidades extends StatelessWidget {
  const Comunidades({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _communities(),
      ),
    );
  }
}