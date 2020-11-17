import 'package:sqflite/sqflite.dart'; 
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import './modeloBD.dart';
import 'dart:io';
import 'dart:async';



class FuncionesBD{
    
Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path,"basedatos.db"); //create path to database

      return await openDatabase( //open the database or create a database if there isn't any
        path,
        version: 1,
        onCreate: (Database db,int version) async{
          await db.execute("""
          CREATE TABLE Usuarios(
          idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          telefono TEXT,
          email TEXT,
          residencia TEXT,
          contrasena TEXT,
          fechaRegistro TEXT,
          tipoPerfil INTEGER,
          foto TEXT)"""
      );
    });
  }


  //insert de los usuarios
  Future<int> addItem(ModeloBD item) async{ //returns number of items inserted as an integer
    
    final db = await init(); //open database
    
    return db.insert("Usuarios", item.toMap(), //toMap() function from MemoModel
    conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
 }


  //query normal que regresa todos los datos de un usuario
  Future<List<ModeloBD>> listaUsuario() async{ //returns the memos as a list (array)
    
    final db = await init();
    final maps = await db.query("Usuarios"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) { //create a list of memos
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
  Future<int> borrarUsuario(int idUsuario) async{ //returns number of items deleted
    final db = await init();
  
    int result = await db.delete(
      "Usuarios", //table name
      where: "idUsuario = ?",
      whereArgs: [idUsuario] // use whereArgs to avoid SQL injection
    );

    return result;
  }


  //Actualizar usuarios
  Future<int> updateMemo(int idUsuario, ModeloBD item) async{ // returns the number of rows updated
  
    final db = await init();
  
    int result = await db.update(
      "Usuarios", 
      item.toMap(),
      where: "idUsuario = ?",
      whereArgs: [idUsuario]
      );
      return result;
 }


}

