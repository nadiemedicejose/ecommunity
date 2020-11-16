import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
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
                nombre: "Calabaza",
                avatarUrl: 'https://i.imgur.com/oYzgWwQ.jpg',
              ),
              NombreTextField(
                nombre: "Calabaza",
              ),
              EmailTextField(
                email: "calabaza@miau.com",
              ),
              TelefonoTextField(
                telefono: "6428888888",
              ),
              ResidenciaTextField(
                residencia: "Hermosillo",
              ),
              ContrasenaTextField(
                contrasena: "M1auuu!",
              ),
            ],
          ),
        )
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final String nombre;

  const Avatar({
    Key key,
    this.avatarUrl,
    this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(
              avatarUrl,
              height: 200.0,
              width: 200.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Text(
              nombre,
              style: TextStyle(
                fontFamily: 'DM Sans', // No reconocida
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NombreTextField extends StatelessWidget {
  final String nombre;

  const NombreTextField({
    Key key,
    this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        child: TextFormField(
          initialValue: nombre,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nombre",
          ),
        ));
  }
}

class EmailTextField extends StatelessWidget {
  final String email;

  const EmailTextField({
    Key key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        initialValue: email,
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
  final String telefono;

  const TelefonoTextField({
    Key key,
    this.telefono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        initialValue: telefono,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Teléfono",
        ),
      ),
    );
  }
}

class ResidenciaTextField extends StatelessWidget {
  final String residencia;

  const ResidenciaTextField({
    Key key,
    this.residencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        initialValue: residencia,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Residencia",
        ),
      ),
    );
  }
}

class ContrasenaTextField extends StatelessWidget {
  final String contrasena;

  const ContrasenaTextField({
    Key key,
    this.contrasena,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        initialValue: contrasena,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Contraseña",
        ),
      ),
    );
  }
}
