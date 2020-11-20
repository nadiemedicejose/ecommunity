import 'widgets/InputTextField.dart';
import 'package:flutter/material.dart';
import 'package:ECOmmunity/src/model/funcionesBD.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'widgets/avatarUsuario.dart';
import 'widgets/masOpciones.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (contexto) => Perfil(),
      ));
    } else {
      print("No validado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Perfil"),
        actions: [
          MasOpciones(),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Avatar(
                  nombre: "Chris Evans",
                  avatarUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Chris_Evans_in_2019.jpg/1200px-Chris_Evans_in_2019.jpg',
                ),
                InputTextField(
                  label: "Nombre",
                  value: "$logNombre",
                  estado: false,
                ),
                InputTextField(
                  label: "Email",
                  value: "$logEmail",
                  estado: false,
                ),
                InputTextField(
                  label: "Teléfono",
                  value: "$logTelefono",
                  estado: false,
                ),
                InputTextField(
                  label: "Residencia",
                  value: "$logResidencia",
                  estado: false,
                ),
                InputTextField(
                  label: "Contraseña",
                  value: "$logContrasena",
                  estado: false,
                ),
              ],
            ),
          )),
    );
  }
}
