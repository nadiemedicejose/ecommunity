import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'UsuarioInfo.dart';

final String tablaNombre = 'Usuarios';
final String colId = 'idUsuario';
final String colNombre = 'nombre';
final String colTelefono = 'telefono';
final String colEmail = 'email';
final String colResidencia = 'residencia';
final String colContrasena = 'contrasena';
final String colTipoPerfil = 'tipoPerfil';
final String colFechaRegistro = 'fechaRegistro';
final String colFoto = 'foto';

class ECOmmunityHelper {
  static Database _database;
  static ECOmmunityHelper _ecommunityHelper;

  ECOmmunityHelper._createInstance();
  factory ECOmmunityHelper() {
    if (_ecommunityHelper == null) {
      _ecommunityHelper = ECOmmunityHelper._createInstance();
    }
    return _ecommunityHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "ecommunity.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tablaNombre (
            $colId integer primary key autoincrement,
            $colNombre text,
            $colTelefono text,
            $colEmail text,
            $colResidencia text,
            $colContrasena text,
            $colTipoPerfil integer,
            $colFechaRegistro datetime,
            $colFoto text
          )
        ''');
      },
    );
    return database;
  }

  void insertarUsuario(UsuarioInfo usuarioInfo) async {
    var db = await this.database;
    int id = await db.insert(tablaNombre, usuarioInfo.toJson());
    print('Usuario insertado con idUsuario: $id');
  }
}
