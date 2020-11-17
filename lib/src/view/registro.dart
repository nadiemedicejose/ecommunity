import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'perfil.dart';

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
              LogoImage(
                logoUrl: 'https://i.imgur.com/6LHJMKO.png',
              ),
              NombreTextField(),
              EmailTextField(),
              TelefonoTextField(),
              ResidenciaTextField(),
              ContrasenaTextField(),
              ConfirmarContrasenaTextField(),
              RegistrarmeButton(),
            ],
          ),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Image.network(
        logoUrl,
        width: 200,
        height: 200,
      ),
    );
  }
}

class NombreTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Nombre",
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class TelefonoTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Teléfono",
        ),
      ),
    );
  }
}

class ResidenciaTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Residencia",
        ),
      ),
    );
  }
}

class ContrasenaTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Contraseña",
        ),
      ),
    );
  }
}

class ConfirmarContrasenaTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Confirmar contraseña",
        ),
      ),
    );
  }
}

class RegistrarmeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Registrarme"),
        ),
        onPressed: () {},
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }
}
