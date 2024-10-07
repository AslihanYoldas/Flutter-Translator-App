import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/translator_result.dart';
part 'translator_api.g.dart';

@RestApi(baseUrl: 'https://free-google-translator.p.rapidapi.com/external-api/free-google-translator')
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) =_RestClient;
  @POST("")
  Future<TranslatorResult>getTranslateResult(@Query('from') String sourceLan,@Query('to') String targetLan, @Query('query') String text);

}