import 'package:ECOmmunity/src/view/Comunidades/CrearComunidad.dart';
import 'package:ECOmmunity/src/view/Comunidades/EditarComunidad.dart';
import 'package:ECOmmunity/src/view/Comunidades/UnirseComunidad.dart';
import 'package:ECOmmunity/src/view/Reportes/AceptarReporte.dart';
import 'package:ECOmmunity/src/view/Reportes/CrearReporte.dart';
import 'package:ECOmmunity/src/view/Reportes/DetallesReporte.dart';
import 'package:ECOmmunity/src/view/Reportes/FinalizarReporte.dart';
import 'package:ECOmmunity/src/view/detalleReporte.dart';
import 'package:ECOmmunity/src/view/iniciar.dart';
import 'package:ECOmmunity/src/view/inicio.dart';
import 'package:ECOmmunity/src/view/registro.dart';
import 'package:ECOmmunity/src/view/widgets/WidgetTest.dart';
import 'package:flutter/material.dart';

import 'view/Comunidades/DetalleComunidad.dart';

class Testing extends StatelessWidget {
  // Este widget es la raíz de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECOmmunity',
      theme: ThemeData(
        // Define el tema de la aplicación
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IniciarSesion(),
    );
  }
}
