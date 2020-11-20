import 'package:flutter/material.dart';
import '../widgets/Boton.dart';
import '../widgets/InputTextField.dart';
import '../widgets/InputTextFieldIcon.dart';
import '../widgets/InputTextFieldMultiline.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EditarComunidad extends StatefulWidget {
  @override
  _EditarComunidadState createState() => _EditarComunidadState();
}

class _EditarComunidadState extends State<EditarComunidad> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Boton botonAccion = new Boton();

  fHola() {
    print("Comunidad editada exitosamente");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Editar Comunidad"),
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
                estado: false,
              ),
              InputTextFieldMultiline(
                label: "Descripción",
                lineas: 8,
                estado: true,
              ),
              botonAccion.botonAccion("Guardar", accion: () => {fHola()}),
            ],
          ),
        ),
      ),
    );
  }
}
