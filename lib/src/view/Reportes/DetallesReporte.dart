import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'reporte.dart';

class DetallesReporte extends StatefulWidget {
  @override
  _DetallesReporteState createState() => _DetallesReporteState();
}

class _DetallesReporteState extends State<DetallesReporte> {
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
              //Sin boton
            ],
          ),
        ),
      ),
    );
  }
}
