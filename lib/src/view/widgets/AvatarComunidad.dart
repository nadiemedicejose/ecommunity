import 'package:flutter/material.dart';

class AvatarComunidad extends StatelessWidget {
  final Color color;
  const AvatarComunidad({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
