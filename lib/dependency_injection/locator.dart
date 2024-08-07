import 'package:dio/dio.dart';
import 'package:flutter_translator_app/cubit/translator_cubit.dart';
import 'package:flutter_translator_app/repository/repository.dart';
import 'package:flutter_translator_app/utils/constants.dart';
import 'package:get_it/get_it.dart';

import '../api/translator_api.dart';

final locator= GetIt.instance;

class DependencyInjection {
  DependencyInjection() {
    provideApi();
    provideRepositories();
    provideViewModels();
  }

  void provideApi() {
    locator.registerLazySingleton<RestClient>(() =>
        RestClient(Dio(
            BaseOptions(
                contentType: 'application/json',
                headers: {
                  'x-rapidapi-key': KEY,
                  'x-rapidapi-host': "google-translator9.p.rapidapi.com",
                }
            )))
    );
  }

  void provideRepositories() {
    locator.registerLazySingleton<Repository>(() => Repository());
  }

  void provideViewModels() {
    locator.registerLazySingleton<TranslatorCubit>(() => TranslatorCubit());
  }

}