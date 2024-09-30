import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:speech_to_text/speech_to_text.dart';


class SpeechCubit extends Cubit<SpeechStates>{
  SpeechCubit():super(InitialState());
  final SpeechToText _speechToText=locator.get<SpeechToText>();
  void initialize() async {
    bool available = await _speechToText.initialize();
    if (available) {
      emit(MicAvailableState());
    }
    else{
      emit(MicNotAvailableState());
    }
  }
  /*void stopListening() async {
    await _speechToText.stop();
    emit(SpeechListeningStoppedState());
  }*/

  void startListening(String? sourceLan, String? targetLan) async {

      emit(SpeechListeningState(sourceLan,targetLan));
      await _speechToText.listen(
          onResult: (result) {
            emit(SpeechResult(result.recognizedWords,sourceLan,targetLan));
          }
      );

    }

  }

