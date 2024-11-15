import 'package:flutter_translator_app/cubit/base_cubit/base_cubit.dart';

import '../base_cubit/base_states.dart';

abstract class SpeechStates extends BaseStates{}

class SpeechInitialState extends SpeechStates{

}

class MicAvailableState extends SpeechStates{

}

class MicNotAvailableState extends SpeechStates{

}
class SpeechListeningState extends SpeechStates{

}


class SpeechResult extends SpeechStates{
  String recognizedWords;

  SpeechResult(this.recognizedWords);
}