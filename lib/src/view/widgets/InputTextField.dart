import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final bool estado;
  const InputTextField({
    Key key,
    this.label,
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
        ),
      ),
    );
  }
}
