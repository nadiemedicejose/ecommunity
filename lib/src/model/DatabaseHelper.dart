import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

Database db;

class DatabaseCreator {
  // Tabla 1. Usuarios
  static const tblUsuarios = 'Usuarios';
  static const colIdUsuario = 'idUsuario';
  static const colNombreUsuario = 'nombre';
  static const colTelefono = 'telefono';
  static const colEmail = 'email';
  static const colResidencia = 'residencia';
  static const colContrasena = 'contrasena';
  static const colTipoPerfil = 'tipoPerfil';
  static const colfrUsuario = 'fechaRegistro';
  static const colFotoUsuario = 'foto';

  // Tabla 2. Comunidades
  static const tblComunidades = 'Comunidades';
  static const colIdComunidad = 'idComunidad';
  static const colNombreComunidad = 'nombreComunidad';
  static const colFotoComunidad = 'fotoComunidad';
  static const colfrComunidad = 'frComunidad';

  // Tabla 3. ReporteDetalles
  static const tblReportesDetalles = 'ReportesDetalles';
  static const colIdReporteDetalle = 'IdReporteDetalle';
  static const colfechaReporte = 'fechaReporte';
  static const colEstatusReporte = 'estatus';
  static const colDireccion = 'direccion';
  static const colLocalizacion = 'localizacion';
  static const colDenunciante = 'denunciante';
  static const colDescripcion = 'descripcion';
  static const colAtComunidad = 'atComunidad';
  static const colFotosReporte = 'fotos';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createUsuariosTable(Database db) async {
    final sql = '''
    create table $tblUsuarios (
      $colIdUsuario integer primary key autoincrement,
      $colNombreUsuario text,
      $colTelefono text,
      $colEmail text,
      $colResidencia text,
      $colContrasena text,
      $colTipoPerfil integer,
      $colfrUsuario datetime,
      $colFotoUsuario text
    )
    ''';

    await db.execute(sql);
  }

  Future<void> createComunidadesTable(Database db) async {
    final sql = '''
    create table $tblComunidades (
      $colIdComunidad integer primary key autoincrement,
      $colNombreComunidad text,
      $colFotoComunidad text,
      $colfrComunidad datetime
    )
    ''';

    await db.execute(sql);
  }

  Future<void> createReportesDetallesTable(Database db) async {
    final sql = '''
    create table $tblReportesDetalles (
      $colIdReporteDetalle integer primary key autoincrement,
      $colfechaReporte datetime,
      $colEstatusReporte int,
      $colDireccion text,
      $colLocalizacion text,
      $colDenunciante int,
      $colDescripcion text,
      $colAtComunidad int,
      $colFotosReporte text
    )
    ''';

    await db.execute(sql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('ecommunity');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createComunidadesTable(db);
    await createUsuariosTable(db);
    await createReportesDetallesTable(db);
  }
}
