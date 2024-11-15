import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/base_cubit/base_states.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechCubit extends Cubit<SpeechStates> {
  final SpeechToText _speechToText = locator.get<SpeechToText>();
  bool isListening = false;

  SpeechCubit() : super(SpeechInitialState());

  void initialize() async {
    try {
      bool available = await _speechToText.initialize();
      if (available) {
        emit(MicAvailableState());
      } else {
        emit(MicNotAvailableState());
      }
    } catch (e) {
      emit(ErrorState('Speech initialization failed : ${e.toString()}')
          as SpeechStates);
    }
  }

  void startListening() async {
    try {
      isListening = true;
      emit(SpeechListeningState());
      await _speechToText.listen(onResult: (result) {
        emit(SpeechResult(result.recognizedWords));
        isListening = false;
      });
    } catch (e) {
      emit(ErrorState('Speech Listening failed : ${e.toString()}')
          as SpeechStates);
    }
  }
}
