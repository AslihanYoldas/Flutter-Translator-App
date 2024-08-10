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
      TranslatorResult response = await _api.getTranslateResult(data.text ?? "", languages[data.sourceLan] ?? 'en', languages[data.targetLan]??'tr',data.format);
      debugPrint(response.data?.translations?[0].translatedText);
      return response;
    }
    catch(e){
      debugPrint('REPO ERROR:${e.toString()}');
      return null;
    }


  }
}