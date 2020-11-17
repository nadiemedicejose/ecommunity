


class ModeloBD{
  final int idUsuario;
  final String nombre;
  final String telefono;
  final String email;
  final String residencia;
  final String contrasena;
  final String fechaRegistro;
  final String tipoPerfil;
  final String foto;

  ModeloBD({this.idUsuario,this.nombre,this.telefono, this.email, this.residencia, this. contrasena, this.fechaRegistro, this.tipoPerfil, this.foto});

  Map<String,dynamic> toMap(){ // usado para insertar a la bd
    return <String,dynamic>{
      "nombre" : nombre,
      "telefono" : telefono,
      "email" : email,
      "residencia" : residencia,
      "contrasena" : contrasena,
      "fechaRegistro" : fechaRegistro,
      "tipoPerfil" : tipoPerfil,
      "foto" : foto,
    };
  }
}