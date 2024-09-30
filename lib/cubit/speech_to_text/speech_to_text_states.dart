abstract class SpeechStates{}

class InitialState extends SpeechStates{

}

class MicAvailableState extends SpeechStates{

}

class MicNotAvailableState extends SpeechStates{

}
class SpeechListeningState extends SpeechStates{
  String? sourceLan;
  String? targetLan;
  SpeechListeningState(this.sourceLan,this.targetLan);

}

/*class SpeechListeningStoppedState extends SpeechStates{

}*/
class SpeechErrorState extends SpeechStates{
  final String message;
  SpeechErrorState(this.message);
}

class SpeechResult extends SpeechStates{
  String recognizedWords;
  String? sourceLan;
  String? targetLan;
  SpeechResult(this.recognizedWords,this.sourceLan,this.targetLan);
}