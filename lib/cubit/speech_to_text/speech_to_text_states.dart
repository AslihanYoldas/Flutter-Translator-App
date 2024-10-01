abstract class SpeechStates{}

class InitialState extends SpeechStates{

}

class MicAvailableState extends SpeechStates{

}

class MicNotAvailableState extends SpeechStates{

}
class SpeechListeningState extends SpeechStates{


}

/*class SpeechListeningStoppedState extends SpeechStates{

}*/
class SpeechErrorState extends SpeechStates{
  final String message;
  SpeechErrorState(this.message);
}

class SpeechResult extends SpeechStates{
  String recognizedWords;

  SpeechResult(this.recognizedWords);
}