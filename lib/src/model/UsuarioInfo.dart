class UsuarioInfo {
  UsuarioInfo({
    this.idUsuario,
    this.nombre,
    this.telefono,
    this.email,
    this.residencia,
    this.contrasena,
    this.fechaRegistro,
    this.tipoPerfil,
    this.foto,
  });

  int idUsuario;
  String nombre;
  String telefono;
  String email;
  String residencia;
  String contrasena;
  DateTime fechaRegistro;
  int tipoPerfil;
  String foto;

  factory UsuarioInfo.fromJson(Map<String, dynamic> json) => UsuarioInfo(
        idUsuario: json["idUsuario"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        email: json["email"],
        residencia: json["residencia"],
        contrasena: json["contrasena"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        tipoPerfil: json["tipoPerfil"],
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "nombre": nombre,
        "telefono": telefono,
        "email": email,
        "residencia": residencia,
        "contrasena": contrasena,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "tipoPerfil": tipoPerfil,
        "foto": foto,
      };
}
