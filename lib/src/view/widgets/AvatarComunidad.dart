import 'package:ECOmmunity/src/view/Comunidades/DetalleComunidad.dart';
import 'package:flutter/material.dart';

class AvatarComunidad extends StatelessWidget {
  const AvatarComunidad({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetalleComunidad(),
            ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 100.0,
          child: Image.network(
            'https://www.lajornadanet.com/diario/archivo/2013/enero/8/11.jpg',
            height: 200,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
