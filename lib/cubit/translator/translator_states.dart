import 'package:flutter_translator_app/cubit/base_cubit/base_states.dart';

abstract class TranslatorStates extends BaseStates {}

class TranslatorInitialState extends TranslatorStates {}

class ResponseState extends TranslatorStates {
  final String? inputData;
  final String? outputData;
  final String? sourceLan;
  final String? targetLan;

  ResponseState(
      this.inputData, this.outputData, this.sourceLan, this.targetLan);
}
