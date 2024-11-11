import 'package:flutter/material.dart';

import '../../utils/constants.dart';

Widget buildDropdown(context,String? value, ValueChanged<String?> onChanged) {
  return DropdownButton<String>(
    value: value,
    elevation: 16,
    style: TextStyle(color:Theme.of(context).focusColor ),
    underline: Container(
      height: 3,
      color: Theme.of(context).focusColor,
    ),
    onChanged: onChanged,//passes a callback function
    items: languages.keys.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}