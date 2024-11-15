import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_translator_app/model/translator_data.dart';
import 'package:flutter_translator_app/utils/constants.dart';

import '../api/translator_api.dart';
import '../dependency_injection/locator.dart';
import '../model/translator_result.dart';

class Repository {
  final _api = locator.get<RestClient>();

  Future <TranslatorResult?>fetchTranslateResult(TranslatorData data) async {
    try{
      debugPrint(data.targetLan);
      debugPrint(data.sourceLan);
      TranslatorResult response = await _api.getTranslateResult( languages[data.sourceLan] ?? 'en', languages[data.targetLan]??'tr',data.text ?? "");
      debugPrint("Repo = ${response.translation}");
      return response;
    }
    on DioException catch(e){
      if(e.type==DioExceptionType.connectionTimeout) {
        debugPrint('Connection Timeout Excption');
      } else if(e.type==DioExceptionType.receiveTimeout) {
        debugPrint('Receive Timeout Exception');
      }
      else if(e.type==DioExceptionType.badResponse) {
        debugPrint('Received Bad Response: ${e.response?.statusCode}');
      }
      else{
        debugPrint('Dio Error:${e.message}');
      }
    }catch(e){
      debugPrint('Repo Error:${e.toString()}');
    }
    return null;

  }
}