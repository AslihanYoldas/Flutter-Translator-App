abstract class SpeechStates{}

class InitState extends SpeechStates{

}

class MicAvailableState extends SpeechStates{

}

class MicNotAvailableState extends SpeechStates{

}
class SpeechListeningState extends SpeechStates{

}

class SpeechListeningStoppedState extends SpeechStates{

}
class ErrorState extends SpeechStates{
  final String message;
  ErrorState(this.message);
}

class SpeechResult extends SpeechStates{
  String recognizedWords;
  SpeechResult(this.recognizedWords);
}