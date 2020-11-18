import 'package:flutter/material.dart';

class InputTextFieldMultiline extends StatelessWidget {
  final String label;
  final int lineas;
  final bool estado;
  const InputTextFieldMultiline({
    Key key,
    this.label,
    this.lineas,
    this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: TextFormField(
        enabled: estado,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          alignLabelWithHint: true,
        ),
        maxLines: lineas,
      ),
    );
  }
}
