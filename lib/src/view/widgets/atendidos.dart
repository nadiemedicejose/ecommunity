import 'package:flutter/material.dart';
import 'ReporteTarjeta.dart';

Color color = const Color.fromRGBO(82, 210, 71, 1);

List<Widget> _atendidos() {
  List<Widget> atendidos = [];
  final int total = 2;
  for (int i = 0; i < total; i++) {
    if (i < total - 1) {
      atendidos.add(ReporteTarjeta(
            titulo: "Kinder Nueva Creación",
            descripcion:
                "Padres de familia del preescolar Nueva Creación, ubicado en la colonia Quintas del Sol, hacen un esfuerzo para limpiar el ...",
            foto:
                'https://www.lajornadanet.com/diario/archivo/2013/enero/8/11.jpg',
            color: color,
          )
          );
      atendidos.add(SizedBox(width: 5));
    } else {
      atendidos.add(ReporteTarjeta(
            titulo: "Kinder Nueva Creación",
            descripcion:
                "Padres de familia del preescolar Nueva Creación, ubicado en la colonia Quintas del Sol, hacen un esfuerzo para limpiar el ...",
            foto:
                'https://www.lajornadanet.com/diario/archivo/2013/enero/8/11.jpg',
            color: color,
          ));
    }
  }
  return atendidos;
}

class ReportesAtendidos extends StatelessWidget {
  const ReportesAtendidos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _atendidos(),
      ),
    );
  }
}
