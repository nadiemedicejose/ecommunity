import 'package:ECOmmunity/src/view/widgets/InputDatePicker.dart';
import 'package:flutter/material.dart';
import '../widgets/Boton.dart';
import '../widgets/InputTextField.dart';
import '../widgets/InputTextFieldMultiline.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CrearComunidad extends StatefulWidget {
  @override
  _CrearComunidadState createState() => _CrearComunidadState();
}

class _CrearComunidadState extends State<CrearComunidad> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Boton botonAccion = new Boton();

  fHola() {
    // Perfecta para hacer validaciones
    print("Comunidad Ok");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Crear Comunidad"),
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
              InputDatePicker(),
              InputTextFieldMultiline(
                label: "Descripción",
                lineas: 8,
                estado: true,
              ),
              botonAccion.botonAccion("Crear", accion: () => {fHola()}),
            ],
          ),
        ),
      ),
    );
  }
}
