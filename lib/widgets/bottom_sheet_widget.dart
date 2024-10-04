
import 'package:flutter/material.dart';
import '../cubit/speech_to_text/speech_to_text_cubit.dart';
import '../cubit/translator/translator_cubit.dart';
import '../dependency_injection/locator.dart';

  speechBottomSheet(BuildContext context,String text, ) {
    showModalBottomSheet(
       context: context,
       builder: (context) =>
           Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            color: Colors.white70,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        locator.get<TranslatorCubit>().fetchTranslatorPageAfterSpeech(text);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade200,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle:
                              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text('OK'),
                    ),
                const SizedBox(width: 50,),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade200,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                      const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  icon: Icon(
                    Icons.mic,
                    color: Colors.white70,
                    size: 30.0,
                  ),
                  label: const Text(''),
                  onPressed: () {
                    Navigator.pop(context);
                    locator.get<SpeechCubit>().startListening();
                  },
                ),
                  ],
                ),
              ],
            ),
          )));
}
