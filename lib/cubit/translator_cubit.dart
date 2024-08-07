import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/translator_states.dart';
import 'package:flutter_translator_app/model/translator_result.dart';

import '../dependency_injection/locator.dart';
import '../model/translator_data.dart';
import '../repository/repository.dart';

class TranslatorCubit extends Cubit<TranslatorStates>{
  final _repository = locator.get<Repository>();
  TranslatorCubit():super(InitState());

  Future<void>fetchTranslatorPage(TranslatorData? data) async{
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
}