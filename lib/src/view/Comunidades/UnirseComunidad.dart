import 'package:flutter/material.dart';
import '../widgets/Boton.dart';
import '../widgets/InputTextField.dart';
import '../widgets/InputTextFieldIcon.dart';
import '../widgets/InputTextFieldMultiline.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UnirseComunidad extends StatefulWidget {
  @override
  _UnirseComunidadState createState() => _UnirseComunidadState();
}

class _UnirseComunidadState extends State<UnirseComunidad> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Boton botonAccion = new Boton();

  fHola() {
    print("Te uniste a esta comunidad");
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
        title: Text("Comunidad"),
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
              botonAccion.botonAccion("Unirme", accion: () => {fHola()}),
            ],
          ),
        ),
      ),
    );
  }
}
