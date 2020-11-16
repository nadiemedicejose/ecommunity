import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validado");
    } else {
      print("No validado");
    }
  }

  String validarContrasena(value) {
    if (value.isEmpty) {
      return "Especifica una contraseña";
    } else if (value.length < 6) {
      return "Al menos 6 caracteres";
    } else {
      return null;
    }
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
        title: Text("Registro"),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: LogoImage(
                    logoUrl: 'https://i.imgur.com/6LHJMKO.png',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Requerido"),
                      EmailValidator(errorText: "Correo no válido")
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Teléfono",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Residencia",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Contraseña",
                    ),
                    validator: validarContrasena,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirmar contraseña",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Registrarme"),
                    ),
                    onPressed: validate,
                    shape: StadiumBorder(),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class LogoImage extends StatelessWidget {
  final String logoUrl;
  const LogoImage({
    Key key,
    this.logoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      logoUrl,
      width: 200,
      height: 200,
    );
  }
}
