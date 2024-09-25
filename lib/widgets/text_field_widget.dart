import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(TextEditingController controller, {bool readOnly = false}) {
  return TextField(
    controller: controller,
    readOnly: readOnly,
    style: const TextStyle(fontSize: 18.0, height: 1.0, color: Colors.black),
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    maxLines: null,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintText: readOnly ? null : 'Enter text',
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple.shade100, width: 2.0),
      ),
    ),
  );
}