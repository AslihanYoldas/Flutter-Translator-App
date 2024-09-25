import 'package:flutter/material.dart';

import '../../utils/constants.dart';

Widget buildDropdown(String? value, ValueChanged<String?> onChanged) {
  return DropdownButton<String>(
    value: value,
    elevation: 16,
    dropdownColor: Colors.brown.shade50,
    style: const TextStyle(color: Colors.black),
    underline: Container(
      height: 3,
      color: Colors.deepPurple.shade100,
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