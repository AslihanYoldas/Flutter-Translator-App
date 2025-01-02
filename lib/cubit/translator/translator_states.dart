
abstract class TranslatorStates {}

class TranslatorInitialState extends TranslatorStates {}

class ResponseState extends TranslatorStates {
  final String? inputData;
  final String? outputData;
  final String? sourceLan;
  final String? targetLan;

  ResponseState(
      this.inputData, this.outputData, this.sourceLan, this.targetLan);

}

class LoadingState extends TranslatorStates {}

class ErrorState extends TranslatorStates{
  String message;
  ErrorState(this.message) ;
}
