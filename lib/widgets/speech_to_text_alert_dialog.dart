import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/speech_to_text/speech_to_text_cubit.dart';
import '../dependency_injection/locator.dart';

class SpeechToTextAlertDialog extends StatefulWidget {
  final String textSpeech;
  final String? sourceLan;
  final String? targetLan;

  SpeechToTextAlertDialog(this.textSpeech,this.sourceLan,this.targetLan,{super.key});

  @override
  State<SpeechToTextAlertDialog> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToTextAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: const Text(
          'Speech to Text',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.brown),
        ),

        content:Center(
            child:SingleChildScrollView(
                child:Column(
                    children:[
                      Text(widget.textSpeech),

                    ]
                )
            )
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(),
            child: const Text('OK'),
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.mic,
              color: Colors.green,
              size: 30.0,
            ),
            label: const Text('Start Listening'),
            onPressed: () {
              locator.get<SpeechCubit>().startListening(widget.sourceLan,widget.targetLan);
            },
            style: ElevatedButton.styleFrom(),

          ),
        ]);
  }
}
