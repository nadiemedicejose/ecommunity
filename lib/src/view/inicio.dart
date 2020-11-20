import 'package:flutter/material.dart';
import 'widgets/atendidos.dart';
import 'widgets/listaComunidades.dart';
import 'widgets/recientes.dart';
import 'widgets/tituloInicio.dart';
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
        title: Text("Inicio"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () => print("Notificaciones"),
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
