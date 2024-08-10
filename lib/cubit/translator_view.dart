import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator_app/cubit/translator_cubit.dart';
import 'package:flutter_translator_app/cubit/translator_states.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/pages/translator_page.dart';

import '../model/translator_result.dart';

class TranslatorView extends StatelessWidget {
  const TranslatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>locator.get<TranslatorCubit>(),
        child: buildScaffold()
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.translate_outlined),
            title: const Text('Translator'),
            backgroundColor: Colors.green.shade200),
        body: BlocConsumer<TranslatorCubit, TranslatorStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is InitState) {
                return const TranslatorPage(null,null);

              }
              else if (state is LoadingState) {
                return buildLoading();
              }
              else if (state is ResponseState) {
                debugPrint("RESPONSE STATE");
                return TranslatorPage(state.result,state.data);
              }
              else {
                final error = state as ErrorState;
                return buildError(error);
              }
            }));
  }
  Center buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildError(ErrorState error) {
    return Center(
      child: Text(error.message),
    );
  }
}
