import 'package:flutter/material.dart';
import 'package:flutter_translator_app/animation/ripple_effect_animation.dart';
import '../cubit/speech_to_text/speech_to_text_cubit.dart';
import '../cubit/translator/translator_cubit.dart';
import '../dependency_injection/locator.dart';

speechBottomSheet(
    BuildContext context,
    String text,
    ) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        locator
                            .get<TranslatorCubit>()
                            .fetchTranslatorPage(text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Theme.of(context).focusColor,
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(vertical:24, horizontal: 24),
                          alignment: Alignment.center,

                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('OK'),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children:[
                        const RippleAnimation(),
                        ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Theme.of(context).focusColor,
                            elevation: 5,
                            padding: const EdgeInsets.only(left:20, top:20, right:14, bottom: 20),
                            textStyle: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                        icon:  const Icon(
                          Icons.mic,
                          size: 27.0,
                        ),
                        label: const Text(''),
                        onPressed: () {
                          Navigator.pop(context);
                          locator.get<SpeechCubit>().startListening();
                        },
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          )));
}