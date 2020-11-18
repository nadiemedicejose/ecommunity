import 'package:ECOmmunity/src/model/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import './modeloBD.dart';
import './modeloComunidad.dart';
import 'dart:io';
import 'dart:async';

String logIdUsuario,
    logNombre,
    logTelefono,
    logEmail,
    logResidencia,
    logContrasena,
    logFechaRegistro,
    logFoto;
int logTipoPerfil;

class FuncionesBD {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path,
        "D:\\Eco1\\ecommunity\\ecommunityMasreciente1\\Data\\BaseDatos1.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE IF NOT EXISTS Usuarios(
          idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          telefono TEXT,
          email TEXT,
          residencia TEXT,
          contrasena TEXT,
          fechaRegistro TEXT,
          tipoPerfil INTEGER,
          foto TEXT);

          CREATE TABLE IF NOT EXISTS Comunidades(
          idComunidad INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          foto TEXT,
          fechaRegistro TEXT);
          
          CREATE TABLE IF NOT EXISTS ReporteDetalles(
          idReporteDetalle INTEGER PRIMARY KEY AUTOINCREMENT,
          fechaReporet TEXT,
          estatus TEXT,
          direccion TEXT,
          localizacion TEXT,
          denunciante TEXT,
          descripcion TEXT,
          atComunidad TEXT,
          fotos TEXT);

          CREATE TABLE IF NOT EXISTS ComunidadDetalles(
          idComunidadDetalle INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          foto TEXT,
          fechaRegistro TEXT);

          CREATE TABLE IF NOT EXISTS Reportes(
          idReporte INTEGER PRIMARY KEY AUTOINCREMENT,
          idReporteDetalle INTEGER,
          idUsuario INTEGER,
          idComunidadDetalle INTEGER);
          """);
    });
  }

  //insert de los usuarios
  Future<int> addItem(ModeloBD item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "Usuarios", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  //query normal que regresa todos los datos de un usuario
  Future<List<ModeloBD>> listaUsuario() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db
        .query("Usuarios"); //query all the rows in a table as an array of maps
    var uwu;
    return uwu = new List.generate(maps.length, (i) {
      //create a list of memos
      return ModeloBD(
        idUsuario: maps[i]['idUsuario'],
        nombre: maps[i]['nombre'],
        telefono: maps[i]['telefono'],
        email: maps[i]['email'],
        residencia: maps[i]['residencia'],
        contrasena: maps[i]['contrasena'],
        fechaRegistro: maps[i]['fechaRegistro'],
        tipoPerfil: maps[i]['tipoPerfil'],
        foto: maps[i]['foto'],
      );
    });
  }

  //borrar usuario
  Future<int> borrarUsuario(int idUsuario) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("Usuarios", //table name
        where: "idUsuario = ?",
        whereArgs: [idUsuario] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<List> getLoginUsuario(String email, String password) async {
    final db = await init();
    /*
    List<Map> result = await db.query("Usuarios",
      columns: ["idUsuario", "email", "contrasena"],
      where: 'email = ?',
      whereArgs: [email]);*/
    email = email.trim();
    List<Map> result = await db.rawQuery(
        "SELECT * FROM Usuarios WHERE contrasena ='$password' AND email LIKE '$email';");
    /* WHERE email = '" +
          email +
            "' and contrasena = '" +
            password +
            "'");
            
    //print(result.contains("$password")+"asdas");
    //return result;*/
    //print(result[0]['email']);
    logNombre = result[0]['nombre'];
    logTelefono = result[0]['telefono'];
    logEmail = result[0]['email'];
    logResidencia = result[0]['residencia'];
    logContrasena = result[0]['contrasena'];
    logFechaRegistro = result[0]['fechaRegistro'];
    logTipoPerfil = result[0]['tipoPerfil'];
    logFoto = result[0]['foto'];

    print(result.toString() + "aa$email $password");

    return result.toList();
  }

  //Actualizar usuarios
  Future<int> updateMemo(int idUsuario, ModeloBD item) async {
    // returns the number of rows updated

    final db = await init();

    int result = await db.update("Usuarios", item.toMap(),
        where: "idUsuario = ?", whereArgs: [idUsuario]);
    return result;
  }

  //querys comunidades

  //insert de la comunidad
  Future<int> addComunidad(ModeloComunidad item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "Comunidades", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }
}
