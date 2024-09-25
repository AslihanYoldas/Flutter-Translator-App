import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/translator/translator_cubit.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/model/translator_data.dart';
import '../model/translator_result.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/text_field_widget.dart';

class TranslatorPage extends StatefulWidget {
  final TranslatorResult? result;
  final TranslatorData? data;


  const TranslatorPage(this.result, this.data, {super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {


  late TextEditingController inputController;
  late TextEditingController outputController;
  String? selectedSource;
  String? selectedTarget;



  @override
  void initState() {
    super.initState();
    selectedSource = widget.data?.sourceLan ?? 'Turkish';
    selectedTarget = widget.data?.targetLan ?? 'English';
    inputController = TextEditingController(text: widget.data?.text ?? '');
    outputController = TextEditingController(text: widget.result?.data?.translations?[0].translatedText ?? '');


  }

  @override
  void dispose() {
    inputController.dispose();
    outputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10.0),
      width: 500,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildDropdown(selectedSource,
                  //callback func passed to the widget
                //when dropdown item changed this function will be triggered
                  (value){//lambda function defined with ()
                    setState(() {
                      selectedSource = value;
                   });
                  }
            ),

            const SizedBox(height: 25,),
            buildTextField(inputController),
            const SizedBox(height: 25,),
            buildDropdown(selectedTarget,
                    (value) {
                      setState(() {
                        selectedTarget = value;
                      });

                    }
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                    side: BorderSide(color: Colors.green.shade50, width:2),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle: const TextStyle(
                        color: Colors.white, fontSize: 20, fontStyle: FontStyle.normal)
                ),
              onPressed: () {
                locator.get<TranslatorCubit>().fetchTranslatorPage(TranslatorData( selectedSource, selectedTarget,inputController.text));
              },
              child: const Text("Translate")),
          ]

        ),
      ),
    );
  }
}
