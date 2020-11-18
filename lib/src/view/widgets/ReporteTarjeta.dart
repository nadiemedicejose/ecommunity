import 'package:flutter/material.dart';

class ReporteTarjeta extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String foto;
  final Color color;

  const ReporteTarjeta({
    Key key,
    this.titulo,
    this.descripcion,
    this.foto,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          print('Card tapped.');
        },
        child: Container(
          width: 350,
          height: 200,
          child: Stack(
            children: [
              Positioned(
                  right: 10,
                  bottom: 10,
                  top: 10,
                  child: Image.network(
                    foto,
                    height: 200,
                    width: 120,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 220,
                height: 200,
                //mainAxisAlignment: MainAxisAlignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          titulo,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 20,
                      ),
                      child: Text(
                        descripcion,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
