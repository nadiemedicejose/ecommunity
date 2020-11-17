import 'package:flutter/material.dart';
import 'package:ECOmmunity/src/view/perfil.dart';

Color _color = Colors.green;

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text("Inicio"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Titulo(
              titulo: "Comunidades",
            ),
            Comunidades(),
            SizedBox(height: 10),
            Titulo(
              titulo: "Atendidos",
            ),
            ReportesAtendidos(),
            SizedBox(height: 10),
            Titulo(
              titulo: "Recientes",
            ),
            ReportesRecientes(),
          ],
        ),
      ),
    );
  }
}

class Comunidades extends StatelessWidget {
  const Comunidades({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ComunidadImagen(
            color: Colors.red,
          ),
          SizedBox(width: 5),
          ComunidadImagen(
            color: Colors.blue,
          ),
          SizedBox(width: 5),
          ComunidadImagen(
            color: Colors.green,
          ),
          SizedBox(width: 5),
          ComunidadImagen(
            color: Colors.yellow,
          ),
          SizedBox(width: 5),
          ComunidadImagen(
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class ReportesAtendidos extends StatelessWidget {
  final Color atendidos = const Color.fromRGBO(82, 210, 71, 1);
  const ReportesAtendidos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Reporte(
            color: atendidos,
          ),
          SizedBox(width: 5),
          Reporte(
            color: atendidos,
          ),
          SizedBox(width: 5),
          Reporte(
            color: atendidos,
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}

class ReportesRecientes extends StatelessWidget {
  final Color recientes = const Color.fromRGBO(185, 164, 92, 1);
  const ReportesRecientes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Reporte(
              color: recientes,
            ),
            SizedBox(height: 5),
            Reporte(
              color: recientes,
            ),
            SizedBox(height: 5),
            Reporte(
              color: recientes,
            ),
            SizedBox(height: 5),
            Reporte(
              color: recientes,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  final String titulo;

  const Titulo({
    Key key,
    this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ComunidadImagen extends StatelessWidget {
  final Color color;
  const ComunidadImagen({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      color: color,
    );
  }
}

class Reporte extends StatelessWidget {
  final Color color;

  const Reporte({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      child: SizedBox(
        width: 350,
        height: 200,
        child: Stack(
          children: <Widget>[
            Container(
              width: 290,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      "Titulo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    child: Text(
                      "Descripción " * 10,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 150,
              alignment: FractionalOffset.centerRight,
              child: Image.network(
                  'https://i.pinimg.com/564x/67/6f/ac/676fac5f97a5c76fb26b91e58addf57d.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
