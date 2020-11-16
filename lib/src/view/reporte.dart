import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'perfil.dart';

class Reporte extends StatefulWidget {
  @override
  _ReporteState createState() => _ReporteState();
}

class _ReporteState extends State<Reporte> {
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
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Crear Reporte"),
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
              TituloTextField(),
              UbicacionTextField(),
              DenuncianteTextField(),
              DescripcionTextField(),
              GuardarButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class TituloTextField extends StatelessWidget {
  const TituloTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Título",
        ),
      ),
    );
  }
}

class UbicacionTextField extends StatelessWidget {
  const UbicacionTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Ubicación en el mapa",
          suffixIcon: Icon(Icons.location_on_rounded),
        ),
      ),
    );
  }
}

class DenuncianteTextField extends StatelessWidget {
  const DenuncianteTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Denunciante",
        ),
      ),
    );
  }
}

class DescripcionTextField extends StatelessWidget {
  const DescripcionTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Descripción",
          alignLabelWithHint: true,
        ),
        maxLines: 5,
      ),
    );
  }
}

class GuardarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Denunciar"),
        ),
        onPressed: () {},
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }
}
