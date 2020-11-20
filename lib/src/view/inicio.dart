import 'package:ECOmmunity/src/view/Comunidades/CrearComunidad.dart';
import 'package:ECOmmunity/src/view/detalleReporte.dart';
import 'package:ECOmmunity/src/view/iniciar.dart';
import 'package:ECOmmunity/src/view/Reportes/reporte.dart';
import 'package:ECOmmunity/src/view/widgets/atendidos.dart';
import 'package:ECOmmunity/src/view/widgets/recientes.dart';
import 'package:ECOmmunity/src/view/widgets/tituloInicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import './widgets/ReporteTarjeta.dart';
import './widgets/AvatarComunidad.dart';
import 'perfil.dart';
import 'package:ECOmmunity/src/model/funcionesBD.dart';

import 'widgets/crearOpciones.dart';
import 'widgets/leftMenu.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.menu),
          onTap: () => print("Menu"),
        ),
        title: Text("Inicio"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                LeftMenu();
              },
              child: Icon(
                Icons.notifications,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Titulo(titulo: "Comunidades"),
            Comunidades(),
            SizedBox(height: 10),
            Titulo(titulo: "Atendidos"),
            ReportesAtendidos(),
            SizedBox(height: 10),
            Titulo(titulo: "Recientes"),
            ReportesRecientes(),
          ],
        ),
      ),
      floatingActionButton: Nuevo(),
      drawer: LeftMenu(),
    );
  }
}

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
