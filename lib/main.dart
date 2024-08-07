import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/translator_view.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';

void main() {
 DependencyInjection();
 runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home:TranslatorView()
 ));
}

