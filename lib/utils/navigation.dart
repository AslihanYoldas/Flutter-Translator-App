import 'package:flutter/material.dart';

import '../pages/translator_page.dart';

void navigateToTranslator(BuildContext context, String recognizedText, String? sourceLan, String? targetLan) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => TranslatorPage(
      recognizedText,
      null,
      sourceLan,
      targetLan,
    ),
  ));
}
