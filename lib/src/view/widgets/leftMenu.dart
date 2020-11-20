import 'package:flutter/material.dart';
import 'package:ECOmmunity/src/model/funcionesBD.dart';
import '../iniciar.dart';
import '../perfil.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("$logNombre"),
            accountEmail: Text("$logEmail"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              // Update the state of the app
              Navigator.of(context).push(MaterialPageRoute(
                builder: (contexto) => Perfil(),
              ));
              // Then close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Mi Comunidad'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () {
              // Update the state of the app
              Navigator.of(context).push(MaterialPageRoute(
                builder: (contexto) => IniciarSesion(),
              ));
            },
          ),
        ],
      ),
    );
  }
}