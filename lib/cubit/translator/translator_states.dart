import 'package:flutter_translator_app/model/translator_data.dart';

import '../../model/translator_result.dart';

abstract class TranslatorStates{}

class InitState extends TranslatorStates{

}

class LoadingState extends TranslatorStates{

}
class TranslatorErrorState extends TranslatorStates{
  final String message;
  TranslatorErrorState(this.message);
}

class ResponseState extends TranslatorStates{
  TranslatorData data;
  TranslatorResult result;
  ResponseState(this.result,this.data);
}
class LanguageSetState extends TranslatorStates{
  final String? sourceLanguage;
  final String? targetLanguage;
  LanguageSetState(this.sourceLanguage, this.targetLanguage);
}