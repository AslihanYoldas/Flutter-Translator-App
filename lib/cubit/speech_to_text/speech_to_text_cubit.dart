import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechCubit extends Cubit<SpeechStates> {
  final SpeechToText _speechToText = locator.get<SpeechToText>();

  SpeechCubit() : super(SpeechInitialState());


  void initialize() async {
    try {
      bool available = await _speechToText.initialize(
          onStatus: (status) => _onStatusChanged(status),
          onError: (error) => emit(SpeechErrorState('Error: $error')),
      );

      if (available) {
        emit(MicAvailableState());
      } else {
        emit(MicNotAvailableState());
      }
    } catch (e) {
      emit(SpeechErrorState('Speech initialization failed : ${e.toString()}'));
    }
  }

  void startListening() async {
    try {
      emit(SpeechListeningState());
      await _speechToText.listen(onResult: (result) {
        emit(SpeechResult(result.recognizedWords));
      });
    } catch (e) {
      emit(SpeechErrorState('Speech Listening failed : ${e.toString()}'));
    }
  }
  void stopListening() async {
    try {
      await _speechToText.stop();
      emit(SpeechListeningStopped());
    } catch (e) {
      emit(SpeechErrorState('Failed to stop listening: ${e.toString()}'));
    }
  }

  void _onStatusChanged(String status) {
    if (status == "notListening") {
      emit(SpeechListeningStopped());
    } else if (status == "listening") {
      emit(SpeechListeningState());
    }
  }
  bool getIsListening(){
    return _speechToText.isListening;
  }
}
