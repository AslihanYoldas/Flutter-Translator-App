import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/base_cubit/base_states.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_cubit.dart';
import 'package:flutter_translator_app/cubit/translator/translator_cubit.dart';
import 'package:flutter_translator_app/cubit/translator/translator_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/pages/translator_page.dart';
import 'package:flutter_translator_app/widgets/bottom_sheet_widget.dart';
import '../../widgets/loading_widget.dart';
import '../speech_to_text/speech_to_text_states.dart';
import '../theme/theme_cubit.dart';

class TranslatorView extends StatelessWidget {
  const TranslatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TranslatorCubit>(
          create: (context) => locator.get<TranslatorCubit>(),
        ),
        BlocProvider<SpeechCubit>(create: (context) {
          final cubit = locator.get<SpeechCubit>();
          cubit.initialize(); // Initialize directly when cubit is created
          return cubit;
        }),
        BlocProvider<ThemeCubit>(
          create: (context) => locator.get<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: buildScaffold(context),
          );
        },
      ),
    );
  }

  Scaffold buildScaffold(context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.translate_outlined),
        title: const Text('Translator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.light_mode_sharp),
            onPressed: () {
              locator.get<ThemeCubit>().toggleTheme();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          BlocConsumer<TranslatorCubit, TranslatorStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TranslatorInitialState) {
                  return TranslatorPage(
                      null,
                      null,
                      locator.get<TranslatorCubit>().sourceLanguage,
                      locator.get<TranslatorCubit>().targetLanguage);
                } else if (state is LoadingState) {
                  return buildLoading(context);
                } else if (state is ResponseState) {
                  debugPrint("RESPONSE STATE");
                  debugPrint("${state.sourceLan},${state.targetLan}");
                  return TranslatorPage(state.inputData, state.outputData,
                      state.sourceLan, state.targetLan);
                }

                return const Center(child: Text(''));
              }),
          BlocConsumer<SpeechCubit, SpeechStates>(listener: (context, state) {
            if (state is SpeechInitialState) {
              debugPrint('Speech initial state');
            } else if (state is SpeechResult) {
              debugPrint("RESPONSE STATE");
              if (state.recognizedWords.isNotEmpty) {
                Navigator.pop(context);
                speechBottomSheet(context, state.recognizedWords);
              }
            } else if (state is SpeechListeningState) {
              debugPrint("SpeechListeningState");
              speechBottomSheet(context, "Listening");
            }
          }, builder: (context, state) {
            if (state is MicAvailableState) {
              debugPrint("Mic Available");
            } else if (state is MicNotAvailableState) {
              debugPrint("MIC NOT AVAILABLE");
            }
            return const Text("");
          })
        ]),
      ),
    );
  }
}
