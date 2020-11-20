import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'InputTextFieldIcon.dart';

class InputDatePicker extends StatefulWidget {
  @override
  _InputDatePickerState createState() => _InputDatePickerState();
}

class _InputDatePickerState extends State<InputDatePicker> {
  DateTime hoy = DateTime.now();
  TextEditingController _fecha = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime seleccion = await showDatePicker(
      context: context,
      initialDate: hoy,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime.now(),
    );
    if (seleccion != null && seleccion != hoy)
      setState(() {
        hoy = seleccion;
        _fecha.value =
            TextEditingValue(text: DateFormat.yMMMd().format(seleccion));
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: InputTextFieldIcon(
            label: "Fecha de antigüedad",
            controlador: _fecha,
            icon: Icon(Icons.calendar_today),
            estado: true,
          ),
        ));
  }
}
