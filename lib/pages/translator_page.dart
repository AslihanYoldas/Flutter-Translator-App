import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/translator/translator_cubit.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/model/translator_data.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/text_field_widget.dart';

class TranslatorPage extends StatefulWidget {
  final String? inputData;
  final String? outputData;
  final String? sourceLan;
  final String? targetLan;


  const TranslatorPage(this.inputData, this.outputData, this.sourceLan, this.targetLan, {super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {


  late TextEditingController inputController;
  late TextEditingController outputController;
  String? sourceLan;
  String? targetLan;




  @override
  void initState() {
    super.initState();
    sourceLan = widget.sourceLan ?? 'Turkish';
    targetLan = widget.targetLan ?? 'English';
    inputController = TextEditingController(text: widget.inputData?? '');
    outputController = TextEditingController(text: widget.outputData ?? '');

  }

  // Update input and output when redisplaying page
  @override
  void didUpdateWidget(covariant TranslatorPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.inputData != oldWidget.inputData) {
      inputController.text = widget.inputData ?? '';
    }

    if (widget.outputData != oldWidget.outputData) {
      outputController.text = widget.outputData ?? '';
    }


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
            buildDropdown(context,sourceLan,
                  //callback func passed to the widget
                //when dropdown item changed this function will be triggered
                  (value){//lambda function defined with ()
              setState(() {
                sourceLan=value;
                locator.get<TranslatorCubit>().setLanguages( value,locator.get<TranslatorCubit>().targetLanguage);
              });
                  }
            ),

            const SizedBox(height: 25,),
            buildTextField(context,inputController,widget.sourceLan,widget.targetLan),
            const SizedBox(height: 25,),
            buildDropdown(context,targetLan,
                    (value) {
                    setState(() {
                      targetLan=value;
                      locator.get<TranslatorCubit>().setLanguages(locator.get<TranslatorCubit>().sourceLanguage, value);
                    });
                    }
            ),
            buildTextField(context,outputController, widget.sourceLan,widget.targetLan, readOnly: true),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                locator.get<TranslatorCubit>().fetchResultTranslatorPage((TranslatorData( sourceLan, targetLan,inputController.text)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).focusColor,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  textStyle:
                   TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Translate'),

            ),



          ]

        ),
      ),
    );
  }
}
