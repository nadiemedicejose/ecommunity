
class ModeloComunidad{

  final int idComunidad;
  final String nombre;
  final String descricion;
  final String foto;
  final String fechaRegistro;


  ModeloComunidad({this.idComunidad,this.nombre,this.descricion, this.foto, this.fechaRegistro});

  Map<String,dynamic> toMap(){ // usado para insertar a la bd
    return <String,dynamic>{
      "nombre" : nombre,
      "descricion" : descricion,
      "foto" : foto,
      "fechaRegistro" : fechaRegistro,
    };
  }
}


