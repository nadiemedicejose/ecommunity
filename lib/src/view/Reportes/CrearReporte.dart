import 'package:ECOmmunity/src/view/widgets/Boton.dart';
import 'package:ECOmmunity/src/view/widgets/InputTextField.dart';
import 'package:ECOmmunity/src/view/widgets/InputTextFieldIcon.dart';
import 'package:ECOmmunity/src/view/widgets/InputTextFieldMultiline.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CrearReporte extends StatefulWidget {
  @override
  _CrearReporteState createState() => _CrearReporteState();
}

class _CrearReporteState extends State<CrearReporte> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Boton botonAccion = new Boton();

  fHola() {
    // Perfecta para hacer validaciones
    print("Denuncia OK");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Crear reporte"),
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
                label: "Titulo",
                estado: true,
              ),
              InputTextFieldIcon(
                label: "Ubicación en el mapa",
                estado: true,
                icon: Icon(Icons.location_on),
              ),
              InputTextField(
                label: "Denunciante",
                estado: true,
              ),
              InputTextFieldMultiline(
                label: "Descripción",
                lineas: 5,
                estado: true,
              ),
              botonAccion.botonAccion("Reportar", accion: () => {fHola()}),
            ],
          ),
        ),
      ),
    );
  }
}
