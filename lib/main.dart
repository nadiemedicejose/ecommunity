import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Este widget es la raíz de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECOmmunity',
      theme: ThemeData(
        // Define el tema de la aplicación
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PrimeraPantalla(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // Pantalla principal de la aplicación. Se maneja por estados. Tiene un objeto State (definido abajo), que contiene campos que afectan la apariencia.

  // Clase de configuración para el estado. Guarda valores (título) provistos por el padre (en este caso App Widget) que son usados por el método build del State. Los campos en una subclase Widget son siempre marcados como "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta llamada al método setState indica al framework que algo ha cambiado. Permite volver a correr el método build para que la pantalla pueda mostrar los valores actualizados.

      // Si cambias _counter sin haber llamado al método setState(), el build no será llamado de nuevo y puede parecer que nada está sucediendo.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método vuelve a arrancar en cada llamada a setState.

    // El framework ha sido optimizado para volver a arrancar los métodos build de forma rápida, para que puedas reconstruir culaquier cosa que necesita ser actualizada sin tener que cambiar las instancias de manera individual para cada widget.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 4.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        // Center es un widget de diseño. Toma un child individual y lo ubica en el centro de su contenedor (parent).
        child: Column(
          // Column es un widget de diseño. Toma una lista de children y los organiza verticalmente. Por default, ajusta hijos horizontalmente e intenta ser tan grande como su contenedor.

          // Invoca "debug painting" (presiona "p" en la consola, escoge la acción "Toggle Debug Paint" desde Flutter Inspector en Android Studio, o el comando "Toggle Debug Paint" en VS Code) para ver el wireframe de cada widget.

          // Column posee propiedades para ajustar su tamaño y cómo posiciona a sus children. Por ejemplo, aquí se usa mainAxisAlignment para centrar children verticalmente; el eje principal es vertical.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Has tocado el botón estas veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // La coma hace que el autoformato se más eficiente.
    );
  }
}

class PrimeraPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera Pantalla"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Abre la segunda pantalla"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (contexto) => SegundaPantalla(),
            ));
          },
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda Pantalla")),
      body: Center(
        child: RaisedButton(
          child: Text("Volver"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
