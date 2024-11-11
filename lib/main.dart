import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/translator/translator_view.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/utils/theme.dart';

void main() {
 DependencyInjection();
 runApp(const TranslatorView()
 );
}

