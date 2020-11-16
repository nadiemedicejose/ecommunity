import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Muestrario de Botones")),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 4/3,
        children: <Widget>[
          Boton(
            child: RaisedButton(
              child: Text("Raised Button"),
              onPressed: () {
                print("Raised Button");
              },
            ),
            text: "RaisedButton Clásico",
          ),
          Boton(
            child: ElevatedButton(
              child: Text("Elevated Button"),
              onPressed: () {
                print("ElevatedButton");
              },
            ),
            text: "RaisedButton v2 (ElevatedButton)",
          ),
          Boton(
            // ignore: missing_required_param
            child: ElevatedButton(
              child: Text("Desactivado"),
            ),
            text: "ElevatedButton desactivado",
          ),
          Boton(
            child: TextButton(
              child: Text("Text Button"),
              onPressed: () {
                print("TextButton clásico");
              },
            ),
            text: "Botón de texto plano",
          ),
          Boton(
            child: FlatButton(
              child: Text("Flat Button"),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                print("Red Flat Button");
              },
            ),
            text: "Botón plano con color de fondo",
          ),
          Boton(
            child: OutlineButton(
              child: Text("Outline"),
              onPressed: () {
                print("Outline Button");
              },
            ),
            text: "Botón con borde",
          ),
          Boton(
            child: OutlineButton(
              child: Text("Outline"),
              shape: StadiumBorder(),
              onPressed: () {
                print("Outline con StadiumBorder");
              },
            ),
            text: "Outline con Shape border",
          ),
          Boton(
            child: OutlineButton.icon(
              icon: Icon(Icons.add_circle),
              label: Text("Add Circle"),
              shape: StadiumBorder(),
              onPressed: () {
                print("Tocaste al Elevated Button!");
              },
            ),
            text: "Elevated Button con Ícono",
          ),
          Boton(
            child: OutlineButton.icon(
              icon: Icon(Icons.add_circle),
              label: Text("Add Circle"),
              shape: StadiumBorder(),
              highlightColor: Colors.green,
              onPressed: () {
                print("Tocaste al Elevated Button!");
              },
            ),
            text: "Elevated Button con Ícono",
          ),
          Boton(
            child: IconButton(
              icon: Icon(Icons.panorama),
              tooltip: "Esto es un panorama",
              onPressed: () {
                print("Tocaste al Elevated Button!");
              },
            ),
            text: "IconButton con tooltip (longpress)",
          ),
          Boton(
            child: BackButton(
              onPressed: () {
                print("Back Button");
              },
            ),
            text: "Back Button",
          ),
          Boton(
            child: CloseButton(
              onPressed: () {
                print("Close Button");
              },
            ),
            text: "Close Button",
          ),
          Boton(
            text: "Botón de Acción Flotante",
            child: FloatingActionButton(
              child: Icon(Icons.time_to_leave),
              onPressed: () {
                print("Floating Action Button");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Boton extends StatelessWidget {
  final Widget child;
  final String text;

  const Boton({
    Key key,
    @required this.child,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            this.child,
            SizedBox(height: 10),
            Text(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
