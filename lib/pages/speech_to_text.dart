import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_cubit.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechtoText extends StatefulWidget {
  final String textSpeech;
  const SpeechtoText(this.textSpeech,{super.key});

  @override
  State<SpeechtoText> createState() => _SpeechtoTextState(textSpeech);
}

class _SpeechtoTextState extends State<SpeechtoText> {

  _SpeechtoTextState(String textSpeech);

  Future<bool> checkMic() async {
    bool available = await locator.get<SpeechToText>().initialize();
    return available;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child:SingleChildScrollView(
          child:Column(
            children:[
              Text(widget.textSpeech),
              GestureDetector(
                onTap: () async{
                  locator.get<SpeechCubit>().startListening();
                },
                child: CircleAvatar(
                  child:  true? Icon(Icons.record_voice_over):Icon(Icons.mic)
                ),
              )
              ]
          )
        )
        );
      }


}

