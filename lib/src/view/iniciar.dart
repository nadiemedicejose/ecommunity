import '../model/usuario.dart';
import '../model/UsuarioInfo.dart';
import '../model/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'inicio.dart';
import 'registro.dart';

final emailController = TextEditingController();
final contrasenaController = TextEditingController();

class IniciarSesion extends StatefulWidget {
  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  DatabaseCreator database = DatabaseCreator();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    database.initDatabase().then((value) {
      print('-***-Base de datos inicializada-***-');
    });
    super.initState();
  }

  void validar() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (contexto) => Inicio(),
      ));
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
      validar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              EmailTextField(),
              ContrasenaTextField(),
              Padding(
                //Boton de Iniciar Sesión
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Iniciar Sesión"),
                  ),
                  onPressed: () {
                    var login = Usuario.getUsuarioLogin(
                        emailController.text, contrasenaController.text);
                    validar();
                  },
                  shape: StadiumBorder(),
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ),
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

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
  }) : super(key: key);

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

class ContrasenaTextField extends StatelessWidget {
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
        validator: MinLengthValidator(6, errorText: "Contraseña inválida"),
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
      child: TextButton(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Crear una cuenta"),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (contexto) => Registro(),
          ));
        },
      ),
    );
  }
}
