import 'package:flutter/material.dart';
import '../widgets/Boton.dart';
import '../widgets/InputTextField.dart';
import '../widgets/InputTextFieldIcon.dart';
import '../widgets/InputTextFieldMultiline.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CrearComunidad extends StatefulWidget {
  @override
  _CrearComunidadState createState() => _CrearComunidadState();
}

class _CrearComunidadState extends State<CrearComunidad> {
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
        title: Text("Crear Comunidad"),
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
              InputTextField(
                label: "Nombre",
                estado: true,
              ),
              InputTextFieldIcon(
                label: "Fecha de antigüedad",
                icon: Icon(Icons.calendar_today),
                estado: true,
              ),
              InputTextFieldMultiline(
                label: "Descripción",
                lineas: 8,
                estado: true,
              ),
              Boton(
                texto: "Crear",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
