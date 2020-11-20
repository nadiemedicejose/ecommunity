import 'package:flutter/material.dart';
import 'ReporteTarjeta.dart';

Color color = const Color.fromRGBO(185, 164, 92, 1);

List<Widget> _recientes() {
  List<Widget> recientes = [];
  final int total = 10;
  for (int i = 0; i < total; i++) {
    if (i < total - 1) {
      recientes.add(ReporteTarjeta(
            titulo: "Reporte No. " + (i+1).toString(),
            descripcion:
                "Padres de familia del preescolar Nueva Creación, ubicado en la colonia Quintas del Sol, hacen un esfuerzo para limpiar el ...",
            foto:
                'https://www.lajornadanet.com/diario/archivo/2013/enero/8/11.jpg',
            color: color,
          )
          );
      recientes.add(SizedBox(height: 5));
    } else {
      recientes.add(ReporteTarjeta(
            titulo: "Reporte No. " + (i+1).toString(),
            descripcion:
                "Padres de familia del preescolar Nueva Creación, ubicado en la colonia Quintas del Sol, hacen un esfuerzo para limpiar el ...",
            foto:
                'https://www.lajornadanet.com/diario/archivo/2013/enero/8/11.jpg',
            color: color,
          ));
    }
  }
  return recientes;
}

class ReportesRecientes extends StatelessWidget {
  const ReportesRecientes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: _recientes()
        ),
      ),
    );
  }
}
