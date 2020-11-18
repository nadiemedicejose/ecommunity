import 'package:ECOmmunity/src/model/DatabaseHelper.dart';
import 'package:ECOmmunity/src/model/UsuarioInfo.dart';
import 'package:ECOmmunity/src/model/usuario.dart';
import 'package:ECOmmunity/src/view/iniciar.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// Controladores para obtener valor de TextFormFields
final nombreController = TextEditingController();
final emailController = TextEditingController();
final telefonoController = TextEditingController();
final residenciaController = TextEditingController();
final contrasenaController = TextEditingController();
final confContrasenaController = TextEditingController();

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

DateTime _fechaRegistro;

class _RegistroState extends State<Registro> {
  DatabaseCreator db = DatabaseCreator();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _fechaRegistro = DateTime.now();
    db.initDatabase().then((value) {
      print('-***-Base de datos inicializada-***-');
    });
    super.initState();
  }

  void validar() {
    if (formkey.currentState.validate()) {
      print("Validado");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (contexto) => IniciarSesion(),
      ));
    } else {
      print("No validado");
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
          autovalidateMode: AutovalidateMode.always,
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
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Registrarme"),
                  ),
                  onPressed: () async {
                    var usuarioInfo = UsuarioInfo(
                      nombre: nombreController.text,
                      telefono: telefonoController.text,
                      email: emailController.text,
                      residencia: residenciaController.text,
                      contrasena: contrasenaController.text,
                      fechaRegistro: _fechaRegistro,
                      tipoPerfil: 1,
                      foto: "foto",
                    );
                    Usuario.insertarUsuario(usuarioInfo);
                    validar();
                  },
                  shape: StadiumBorder(),
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ),
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nombreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nombreController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Nombre",
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        controller: emailController,
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    telefonoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        controller: telefonoController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Teléfono",
        ),
        validator: validacionTelefono,
      ),
    );
  }
}

class ResidenciaTextField extends StatelessWidget {
  void dispose() {
    // Clean up the controller when the widget is disposed.
    residenciaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        controller: residenciaController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Residencia",
        ),
      ),
    );
  }
}

class ContrasenaTextField extends StatelessWidget {
  void dispose() {
    // Clean up the controller when the widget is disposed.
    contrasenaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        controller: contrasenaController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Contraseña",
        ),
        obscureText: true,
        validator: validarContrasena,
      ),
    );
  }
}

class ConfirmarContrasenaTextField extends StatelessWidget {
  void dispose() {
    // Clean up the controller when the widget is disposed.
    confContrasenaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        controller: confContrasenaController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Confirmar contraseña",
        ),
        obscureText: true,
        validator: confirmarContrasena,
      ),
    );
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

String confirmarContrasena(value) {
  if (value != contrasenaController.text) {
    return "Contraseña no coincide";
  } else {
    return null;
  }
}

String validacionTelefono(value) {
  if (value.isEmpty) {
    return "Requerido";
  } else if (value.length < 10) {
    return "Longitud incorrecta";
  } else if (value.length > 10) {
    return "Longitud incorrecta";
  } else {
    return null;
  }
}
