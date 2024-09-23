import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_cubit.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_states.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../dependency_injection/locator.dart';
import '../../pages/speech_to_text.dart';

class SpeechView extends StatelessWidget {
  const SpeechView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>locator.get<SpeechCubit>(),
        child: buildScaffold()
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(

        body: BlocConsumer<SpeechCubit, SpeechStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is InitState) {
                locator.get<SpeechCubit>().checkMic();
                return SpeechtoText("TAP TO MIC TO START SPEAKING");
              }
              else if (state is SpeechResult) {
                debugPrint("RESPONSE STATE");
                return SpeechtoText(state.recognizedWords);
              }
              else if (state is MicNotAvailableState) {
                debugPrint("RESPONSE STATE");
                return const SpeechtoText("PERMISSION NOT GRANTED. TAP AGAIN");
              }
              else {
                final error = state as ErrorState;
                return buildError(error);
              }

            }));
  }

  Center buildError(ErrorState error) {
    return Center(
      child: Text(error.message),
    );
  }
}
