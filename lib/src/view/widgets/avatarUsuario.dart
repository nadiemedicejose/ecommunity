import 'package:flutter/material.dart';

/* class AvatarUsuario extends StatefulWidget {
  final String avatarUrl;
  final String nombre;
  final bool editar;

  AvatarUsuario(
    this.nombre,
    this.avatarUrl,
    this.editar
  )

  @override
  _AvatarUsuarioState createState() => _AvatarUsuarioState(editar);
}

class _AvatarUsuarioState extends State<AvatarUsuario> {
  final bool editar;
  _AvatarUsuarioState(this.editar);

  List<Widget> _avatar() {
    List<Widget> elementos = [];
    if (editar == true) {
      elementos.add(EditarAvatar(avatarUrl: widget.avatarUrl));
    } else {
      elementos.add(ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Image.network(
          widget.avatarUrl,
          height: 200.0,
          width: 200.0,
        ),
      ));
      elementos.add(SizedBox(
        height: 10.0,
      ));
    }
    elementos.add(SizedBox(
        height: 10.0,
      ));
      elementos.add(Padding(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Text(
          widget.nombre,
          style: TextStyle(
            fontFamily: 'DM Sans', // No reconocida
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ));
    return elementos;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        children: _avatar(),
      ),
    );
  }
}

class EditarAvatar extends StatelessWidget {
  const EditarAvatar({
    Key key,
    @required this.avatarUrl,
  }) : super(key: key);

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Color.fromRGBO(0, 0, 0, 0.3)
            ),
          ),
        ),
        FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => print("Editar foto"),
        )
      ],
    );
  }
}
 */
class Avatar extends StatelessWidget {
  final String avatarUrl;
  final String nombre;

  const Avatar({
    Key key,
    this.avatarUrl,
    this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  avatarUrl,
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => print("Editar foto"),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Text(
              nombre,
              style: TextStyle(
                fontFamily: 'DM Sans', // No reconocida
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
