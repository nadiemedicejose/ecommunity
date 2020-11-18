import 'package:flutter/material.dart';
import 'ReporteTarjeta.dart';

class WidgetTest extends StatefulWidget {
  @override
  _WidgetTestState createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Crear Reporte"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'Opciones',
            onPressed: () {},
          ),
        ],
      ),
      body: ReporteTarjeta(
        titulo: "Kinder Nueva Creación",
        descripcion:
            "Padres de familia del preescolar Nueva Creación, ubicado en la colonia Quintas del Sol, hacen un esfuerzo para limpiar el ...",
        foto: 'https://www.lajornadanet.com/diario/archivo/2013/enero/8/11.jpg',
        color: Color.fromRGBO(185, 164, 92, 1),
      ),
    );
  }
}
