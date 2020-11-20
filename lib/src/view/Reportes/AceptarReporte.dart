import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'reporte.dart';

class AceptarReporte extends StatefulWidget {
  @override
  _AceptarReporteState createState() => _AceptarReporteState();
}

class _AceptarReporteState extends State<AceptarReporte> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Detalles de reporte"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'Opciones',
            onPressed: () => print("Opciones"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Aqui las fotokis que ya se subieron estado: false,
              TituloTextField(
                estado: false,
              ),
              UbicacionTextField(
                estado: false,
              ),
              DenuncianteTextField(
                estado: false,
              ),
              DescripcionTextField(
                estado: false,
              ),
              Boton(
                texto: "Dar Seguimiento",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
