import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechtoText extends StatefulWidget {
  const SpeechtoText({super.key});

  @override
  State<SpeechtoText> createState() => _SpeechtoTextState();
}

class _SpeechtoTextState extends State<SpeechtoText> {

  // Creating instance of speechtoteext package
  SpeechToText speechToText =SpeechToText();
  //flag for mic
  var isListening = false;
  bool micAvailable = false;
  String textSpeech= "Click on mic to record";

  // asks the user to access to mic
  //Invoke the mic
  void checkMic() async {
     micAvailable = await speechToText.initialize();
    //premission granted
    if(micAvailable){
      print("Microphone available");
    }
    //premission not granted
    else
      print("User Denied the use of microphone");
  }

  @override
  void initState() {
  super.initState();
  checkMic();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:SingleChildScrollView(
          child:Column(
            children:[
              Text(textSpeech),
              GestureDetector(
                onTap: () async{
                  if(!isListening){
                    // If not recording start recording
                    //asking permission again
                    micAvailable = await speechToText.initialize();

                    if(micAvailable){
                      setState(() {
                        isListening = true;
                      });
                      // start audio recording
                      speechToText.listen(
                        //listen for 20 seconds and stop
                        listenFor: Duration(seconds: 5),
                        onResult: (result){
                          setState(() {
                            textSpeech = result.recognizedWords;
                            isListening= false;

                          });
                        }

                    );

                    }
                    else{
                      setState(() {
                        isListening= false;
                        speechToText.stop();
                      });


                    }

                  }

                },
                child: CircleAvatar(
                  child:isListening? Icon(Icons.record_voice_over):Icon(Icons.mic)
                ),
              )
              ]
          )
        )
        )
      );
      }


}

