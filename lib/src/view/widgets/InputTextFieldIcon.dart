import 'package:flutter/material.dart';

class InputTextFieldIcon extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool estado;
  final TextEditingController controlador;
  const InputTextFieldIcon({
    Key key,
    this.label,
    this.icon,
    this.estado,
    this.controlador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        enabled: estado,
        controller: controlador,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
