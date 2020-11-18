import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'reporte.dart';

class CrearReporte extends StatefulWidget {
  @override
  _CrearReporteState createState() => _CrearReporteState();
}

class _CrearReporteState extends State<CrearReporte> {
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
        title: Text("Crear reporte"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'Opciones',
            onPressed: () {},
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
              //Aqui se deben agregar las fotos estado: true,
              TituloTextField(
                estado: true,
              ),
              UbicacionTextField(
                estado: true,
              ),
              DenuncianteTextField(
                estado: true,
              ),
              DescripcionTextField(
                estado: true,
              ),
              Boton(
                texto: "Guardar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
