import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/translator/translator_states.dart';
import '../../dependency_injection/locator.dart';
import '../../model/translator_data.dart';
import '../../repository/repository.dart';

class TranslatorCubit extends Cubit<TranslatorStates> {
  String sourceLanguage = "Turkish";
  String targetLanguage = "English";
  final _repository = locator.get<Repository>();

  TranslatorCubit() : super(TranslatorInitialState());

  Future<void> fetchResultTranslatorPage(TranslatorData? data) async {
    emit(LoadingState());
    try {
      final response = await _repository.fetchTranslateResult(data!);
      debugPrint('Response : $response');
      emit(ResponseState(response?.query, response?.translation, data.sourceLan,
          data.targetLan));
    } catch (e) {
      emit(ErrorState('Translator Cubit Result Error : ${e.toString()}'));
    }
  }

  void fetchTranslatorPage(String inputData) {
    try {
      debugPrint('Speech Response in Cubit : $inputData');
      if(inputData =="Listening" || inputData =="Try again"){
        inputData="";
      }
      emit(ResponseState(inputData, null, sourceLanguage, targetLanguage));
    } catch (e) {
      emit(
          ErrorState('Translator Cubit Translator Page Error : ${e.toString()}'));
    }
  }

  void setLanguages(String source, String target) {
    sourceLanguage = source;
    targetLanguage = target;
  }

  void reverseLanguages(String input) {
    setLanguages(targetLanguage, sourceLanguage);
    fetchTranslatorPage(input);
  }
}
