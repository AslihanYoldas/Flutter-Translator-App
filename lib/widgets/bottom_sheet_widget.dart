import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/speech_to_text/speech_to_text_cubit.dart';
import '../cubit/translator/translator_cubit.dart';
import '../dependency_injection/locator.dart';
import '../utils/navigation.dart';
Widget speechBottomSheet(BuildContext context,String text,) {
      return Container(
        height: 100,
        color: Colors.black12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Text(text,
              style: const TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),

          ),

              ElevatedButton(
                child: const Text('OK'),
                onPressed: () => navigateToTranslator(context,text,locator.get<TranslatorCubit>().sourceLanguage,locator.get<TranslatorCubit>().targetLanguage)
              ),
              ElevatedButton.icon(
                icon:  Icon(
                  locator.get<SpeechCubit>().isListening?Icons.mic:Icons.mic_off,
                  color: Colors.grey,
                  size: 30.0,
                ),
                label: const Text(''),

                onPressed: () {
                  locator.get<SpeechCubit>().startListening();
                },

              ),
            ],
          ),
        ),
      );
    }



