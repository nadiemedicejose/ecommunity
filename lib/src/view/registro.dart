import 'package:ECOmmunity/src/view/iniciar.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'perfil.dart';
import 'package:ECOmmunity/src/model/funcionesBD.dart';
import 'package:ECOmmunity/src/model/modeloBD.dart';

FuncionesBD objBD = FuncionesBD();

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
TextEditingController contNombre = new TextEditingController();
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
        leading: BackButton(),
        title: Text("Registro"),
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
      ),
    );
  }
}

class RegistrarmeButton extends StatelessWidget {
  final datosUs = ModeloBD(
    
    nombre: nombreController.text,
    telefono: telefonoController.text,
    email: emailController.text.toString(),
    residencia: residenciaController.text,
    contrasena: contrasenaController.text,
    fechaRegistro: DateTime.now().toString(),
    tipoPerfil: 0,
    foto: 'foto',
  );
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
        onPressed: () async {
          //insert de nuevo usuario
          await objBD.addItem(datosUs);
          var usuarios = await objBD.listaUsuario();
          print("olo"+usuarios[usuarios.length-1].nombre); //Title 1
          /*
          print(nombreController.text);
          print(emailController.text);
          print(telefonoController.text);
          print(residenciaController.text);
          print(contrasenaController.text);
          print(confContrasenaController.text);
          */
          Navigator.of(context).push(MaterialPageRoute(
            builder: (contexto) => IniciarSesion(),
          ));
        },
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }
}
