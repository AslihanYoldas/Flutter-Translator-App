import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/translator/translator_states.dart';
import '../../dependency_injection/locator.dart';
import '../../model/translator_data.dart';
import '../../repository/repository.dart';

class TranslatorCubit extends Cubit<TranslatorStates>{
  String? sourceLanguage;
  String? targetLanguage;
  final _repository = locator.get<Repository>();
  TranslatorCubit():super(InitState());

  Future<void>fetchResultTranslatorPage(TranslatorData? data) async{
    emit(LoadingState());
    try{
      final response = await _repository.fetchTranslateResult(data!);
      debugPrint('Response : $response');
      emit(ResponseState((response!),(data)));
    }
    catch(e){
      debugPrint('CUBIT ERROR : ${e.toString()}');
    }

  }
  void setLanguages(String? source, String? target) {
    sourceLanguage = source;
    targetLanguage = target;
    emit(LanguageSetState(sourceLanguage, targetLanguage));
  }

  void fetchTranslatorPageAfterSpeech(String? input) {

    emit(SpeechResultState(input));
  }


}