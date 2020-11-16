import 'package:flutter/material.dart';
import 'package:ecommunity/src/view/principal.dart';
import 'package:ecommunity/src/view/otrapantalla.dart';
import 'package:ecommunity/src/widgets/botones.dart';
import 'package:ecommunity/src/view/registro.dart';

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
      home: Registro(),
    );
  }
} 