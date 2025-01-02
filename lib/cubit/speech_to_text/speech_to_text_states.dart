

abstract class SpeechStates {}

class SpeechInitialState extends SpeechStates{

}

class MicAvailableState extends SpeechStates{

}

class MicNotAvailableState extends SpeechStates{

}
class SpeechListeningState extends SpeechStates{

}
class SpeechListeningStopped extends SpeechStates{

}


class SpeechResult extends SpeechStates{
  String recognizedWords;

  SpeechResult(this.recognizedWords);
}

class SpeechErrorState extends SpeechStates{
  String message;
  SpeechErrorState(this.message);
}