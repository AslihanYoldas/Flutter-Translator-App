import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechCubit extends Cubit<SpeechStates>{
  SpeechCubit():super(InitState());

  Future<bool> checkMic() async {
    bool available = await locator.get<SpeechToText>().initialize();
    return available;
  }

  void startListening() async {
    if(await checkMic()){
      await locator.get<SpeechToText>().listen(onResult: (result) {
        emit(SpeechResult(result.recognizedWords));
      });}
    else{
      emit(MicNotAvailableState());
    }
    }


  void stopListening() async {
    await locator.get<SpeechToText>().stop();
    emit(SpeechListeningStopedState());
  }


}