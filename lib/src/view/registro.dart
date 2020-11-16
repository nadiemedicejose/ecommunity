import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Registro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    
                  ),
                  labelText: "Nombre",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      
                    ),
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      
                    ),
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
                    border: OutlineInputBorder(
                      
                    ),
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
                    border: OutlineInputBorder(
                      
                    ),
                    labelText: "Contraseña",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      
                    ),
                    labelText: "Confirmar contraseña",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: ElevatedButton(
                  child: Text("Registrarme"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
