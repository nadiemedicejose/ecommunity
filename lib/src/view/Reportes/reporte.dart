import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../perfil.dart';

class ReportePage extends StatefulWidget {
  @override
  _ReportePageState createState() => _ReportePageState();
}

class _ReportePageState extends State<ReportePage> {
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
              TituloTextField(estado: true),
              UbicacionTextField(
                estado: true,
              ),
              DenuncianteTextField(
                estado: true,
              ),
              DescripcionTextField(
                estado: true,
              ),
              Boton(
                texto: "Denunciar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TituloTextField extends StatelessWidget {
  final bool estado;
  const TituloTextField({
    Key key,
    this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        enabled: estado,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Título",
        ),
      ),
    );
  }
}

class UbicacionTextField extends StatelessWidget {
  final bool estado;
  const UbicacionTextField({
    Key key,
    this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        enabled: estado,
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
  final bool estado;
  const DenuncianteTextField({
    Key key,
    this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        enabled: estado,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Denunciante",
        ),
      ),
    );
  }
}

class DescripcionTextField extends StatelessWidget {
  final bool estado;
  const DescripcionTextField({
    Key key,
    this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        enabled: estado,
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

class Boton extends StatelessWidget {
  final String texto;

  const Boton({
    Key key,
    this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(texto),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        shape: StadiumBorder(),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }
}
