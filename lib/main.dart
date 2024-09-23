import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_view.dart';
import 'package:flutter_translator_app/cubit/translator/translator_view.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/pages/speech_to_text.dart';

void main() {
 DependencyInjection();
 runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home:SpeechView()
 ));
}

