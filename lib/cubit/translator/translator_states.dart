import 'package:flutter_translator_app/model/translator_data.dart';

import '../../model/translator_result.dart';

abstract class TranslatorStates{}

class InitState extends TranslatorStates{

}

class LoadingState extends TranslatorStates{

}
class ErrorState extends TranslatorStates{
  final String message;
  ErrorState(this.message);
}

class ResponseState extends TranslatorStates{
  TranslatorData data;
  TranslatorResult result;
  ResponseState(this.result,this.data);
}