import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_cubit.dart';
import 'package:flutter_translator_app/cubit/translator/translator_cubit.dart';
import 'package:flutter_translator_app/cubit/translator/translator_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/pages/translator_page.dart';
import 'package:flutter_translator_app/widgets/bottom_sheet_widget.dart';
import '../speech_to_text/speech_to_text_states.dart';

class TranslatorView extends StatelessWidget {
  const TranslatorView({super.key});


  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers:[
          BlocProvider<TranslatorCubit>(
            create: (context) => locator.get<TranslatorCubit>(),
          ),
          BlocProvider<SpeechCubit>(
          create: (context){
          final cubit = locator.get<SpeechCubit>();
          cubit.initialize(); // Initialize directly when cubit is created
          return cubit;
          }
          ),

        ],
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.translate_outlined),
            title: const Text('Translator'),
            backgroundColor: Colors.green.shade200),
        body: Column(
          children: [
            BlocConsumer<TranslatorCubit, TranslatorStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is InitState) {
                    return const TranslatorPage(null,null,null,null);

                  }
                  else if (state is LoadingState) {
                    return buildLoading();
                  }
                  else if (state is ResponseState) {
                    debugPrint("RESPONSE STATE");
                    return TranslatorPage(
                        state.data.text,
                        state.result.data?.translations?[0].translatedText,
                        state.data.sourceLan,
                        state.data.targetLan);
                  }
                  else if(state is SpeechResultState){
                    return TranslatorPage(state.inputData, null, locator.get<TranslatorCubit>().sourceLanguage, locator.get<TranslatorCubit>().sourceLanguage);
                  }
                  else {
                    final error = state as TranslatorErrorState;
                    return Text(error.message);
                  }
                }),

        BlocConsumer<SpeechCubit, SpeechStates>(
            listener: (context, state) {
              if (state is InitialState) {
                debugPrint('Speech initial state');
                //locator.get<SpeechCubit>().initialize();

              }
              else if (state is SpeechResult) {
                debugPrint("RESPONSE STATE");
                if (state.recognizedWords.isNotEmpty) {
                  Navigator.pop(context);
                  speechBottomSheet(context, state.recognizedWords);
                }
              }
              else if(state is SpeechListeningState){
                debugPrint("SpeechListeningState");
                speechBottomSheet(context, "Listening");
              }

            },
            builder: (context, state) {

               if (state is MicAvailableState) {
                debugPrint("Mic Available");

              }
              else if (state is MicNotAvailableState) {
                debugPrint("MIC NOT AVAILABLE");

              }

              /*else if(state is SpeechListeningStoppedState){
                debugPrint("SpeechListeningStoppedState");
              }*/


              return const Center(child: Text(''));



            })
          ]
        ),

    );
  }
  Center buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }


}
