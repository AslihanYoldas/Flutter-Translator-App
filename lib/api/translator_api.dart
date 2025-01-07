import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/translator_result.dart';
part 'translator_api.g.dart';

@RestApi(baseUrl: 'https://text-translator2.p.rapidapi.com')
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) =_RestClient;
  @POST("/translate")
  @MultiPart()
  Future<TranslatorResult>getTranslateResult(@Part(name:'source_language') String sourceLan,@Part(name:'target_language') String targetLan, @Part(name:'text') String text);

}