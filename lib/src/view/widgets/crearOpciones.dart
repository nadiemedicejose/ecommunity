import 'package:ECOmmunity/src/view/Comunidades/CrearComunidad.dart';
import 'package:ECOmmunity/src/view/Reportes/CrearReporte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Nuevo extends StatelessWidget {
  const Nuevo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_arrow,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      children: [
        SpeedDialChild(
          child: Icon(Icons.assignment),
          label: "Denuncia",
          backgroundColor: Color.fromRGBO(185, 164, 92, 1),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CrearReporte(),
            ));
          }
        ),
        SpeedDialChild(
          child: Icon(Icons.group_add),
          label: "Comunidad",
          backgroundColor: Color.fromRGBO(82, 210, 71, 1),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CrearComunidad(),
            ));
          }
        ),
      ],
    );
  }
}