import 'package:flutter/material.dart';
import '../widgets/Boton.dart';
import '../widgets/InputTextField.dart';
import '../widgets/InputTextFieldIcon.dart';
import '../widgets/InputTextFieldMultiline.dart';
import 'package:form_field_validator/form_field_validator.dart';

class DetalleComunidad extends StatefulWidget {
  @override
  _DetalleComunidadState createState() => _DetalleComunidadState();
}

class _DetalleComunidadState extends State<DetalleComunidad> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Detalle de Comunidad"),
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
                estado: false,
              ),
              InputTextFieldIcon(
                label: "Fecha de antigüedad",
                icon: Icon(Icons.calendar_today),
                estado: false,
              ),
              InputTextFieldMultiline(
                label: "Descripción",
                lineas: 8,
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
