import 'package:ECOmmunity/src/view/detalleReporte.dart';
import 'package:ECOmmunity/src/view/registro.dart';
import 'package:flutter/material.dart';
import 'view/iniciar.dart';

class ECOmmunity extends StatelessWidget {
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