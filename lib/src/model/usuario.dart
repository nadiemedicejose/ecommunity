import 'DatabaseHelper.dart';
import 'UsuarioInfo.dart';

class Usuario {
  static Future<List<UsuarioInfo>> obtenerTodosUsuarios() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.tblUsuarios}''';
    final data = await db.rawQuery(sql);
    List<UsuarioInfo> usuarios = List();

    for (final node in data) {
      final usuario = UsuarioInfo.fromJson(node);
      usuarios.add(usuario);
    }
    return usuarios;
  }

  static Future<UsuarioInfo> getUsuarioLogin(
      String email, String contrasena) async {
    final sql = '''
      SELECT * FROM ${DatabaseCreator.tblUsuarios}
      WHERE ${DatabaseCreator.colEmail} == ? AND
      ${DatabaseCreator.colContrasena} == ?
    ''';

    List<dynamic> params = [email, contrasena];
    final data = await db.rawQuery(sql, params);

    final usuario = UsuarioInfo.fromJson(data.first);
    return usuario;
  }

  static Future<void> insertarUsuario(UsuarioInfo usuarioInfo) async {
    final sql = '''INSERT INTO ${DatabaseCreator.tblUsuarios}
    (
      ${DatabaseCreator.colIdUsuario},
      ${DatabaseCreator.colNombreUsuario},
      ${DatabaseCreator.colTelefono},
      ${DatabaseCreator.colEmail},
      ${DatabaseCreator.colResidencia},
      ${DatabaseCreator.colContrasena},
      ${DatabaseCreator.colTipoPerfil},
      ${DatabaseCreator.colfrUsuario},
      ${DatabaseCreator.colFotoUsuario}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [
      usuarioInfo.idUsuario,
      usuarioInfo.nombre,
      usuarioInfo.telefono,
      usuarioInfo.email,
      usuarioInfo.residencia,
      usuarioInfo.contrasena,
      usuarioInfo.fechaRegistro,
      usuarioInfo.tipoPerfil,
      usuarioInfo.foto,
    ];

    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> actualizarUsuario(UsuarioInfo usuarioInfo) async {
    final sql = '''UPDATE ${DatabaseCreator.tblUsuarios}
    SET ${DatabaseCreator.colNombreUsuario} = ?,
    ${DatabaseCreator.colTelefono} = ?,
    ${DatabaseCreator.colEmail} = ?,
    ${DatabaseCreator.colResidencia} = ?,
    ${DatabaseCreator.colContrasena} = ?,
    ${DatabaseCreator.colFotoUsuario} = ?,
    WHERE ${DatabaseCreator.colIdUsuario} = ?
    ''';

    List<dynamic> params = [usuarioInfo.nombre, usuarioInfo.telefono, usuarioInfo.email, usuarioInfo.residencia, usuarioInfo.contrasena, usuarioInfo.foto, usuarioInfo.idUsuario];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update todo', sql, null, result, params);
  }

  static Future<int> totalUsuarios() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.tblUsuarios}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }

}
