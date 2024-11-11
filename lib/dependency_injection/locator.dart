import 'package:dio/dio.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_cubit.dart';
import 'package:flutter_translator_app/cubit/theme/theme_cubit.dart';
import 'package:flutter_translator_app/cubit/translator/translator_cubit.dart';
import 'package:flutter_translator_app/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../api/translator_api.dart';
import '../utils/key.dart';

final locator= GetIt.instance;

class DependencyInjection {
  DependencyInjection() {
    provideApi();
    provideRepositories();
    provideViewModels();
    provideSpeechToTextObject();
  }

  void provideApi() {
    locator.registerLazySingleton<RestClient>(() =>
        RestClient(Dio(
            BaseOptions(
                contentType: 'application/json',
                headers: {
                  'x-rapidapi-key': KEY,
                  'x-rapidapi-host':  "free-google-translator.p.rapidapi.com",
                },
            ),
        ))
    );
  }

  void provideRepositories() {
    locator.registerLazySingleton<Repository>(() => Repository());
  }

  void provideViewModels() {
    locator.registerLazySingleton<TranslatorCubit>(() => TranslatorCubit());
    locator.registerLazySingleton<SpeechCubit>(() => SpeechCubit());
    locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  }

  void provideSpeechToTextObject(){
    locator.registerLazySingleton<SpeechToText>(()=>SpeechToText());


  }

}