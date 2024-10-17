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
  final String? inputData;
  final String? outputData;
  final String? sourceLan;
  final String? targetLan;
  ResponseState(this.inputData,this.outputData,this.sourceLan,this.targetLan);
}

