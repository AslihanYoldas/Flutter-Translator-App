import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/translator_result.dart';
part 'translator_api.g.dart';

@RestApi(baseUrl: 'https://google-translator9.p.rapidapi.com')
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) =_RestClient;
  @POST("/v2")
  Future<TranslatorResult>getTranslateResult(@Query('q') String text,@Query('source') String source_lan, @Query('target') String target_lan,@Query('format') String format);

}