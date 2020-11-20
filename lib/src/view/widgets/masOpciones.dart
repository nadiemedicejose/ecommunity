import 'package:flutter/material.dart';

enum MenuOption { Editar, Eliminar }

class MasOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      onSelected: (MenuOption option) {
        print(option.toString());
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Icons.edit, color: Colors.black),
                SizedBox(width: 10),
                Text('Editar'),
              ],
            ),
            value: MenuOption.Editar,
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Icons.delete, color: Colors.black),
                SizedBox(width: 10),
                Text('Eliminar'),
              ],
            ),
            value: MenuOption.Eliminar,
          )
        ];
      },
    );
  }
}
