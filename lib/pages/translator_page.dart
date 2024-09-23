import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/translator/translator_cubit.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import 'package:flutter_translator_app/model/translator_data.dart';
import 'package:flutter_translator_app/utils/constants.dart';
import '../model/translator_result.dart';


class TranslatorPage extends StatefulWidget {
  final TranslatorResult? result;
  final TranslatorData ?data;


  const TranslatorPage(this.result, this.data, {super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState(result,data);
}

class _TranslatorPageState extends State<TranslatorPage> {


  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  TranslatorResult? result;
  TranslatorData? data;
  String? selectedSource;
  String? selectedTarget;


  _TranslatorPageState(this.result,this.data);

  @override
  void initState() {
    super.initState();
    selectedTarget = widget.data?.targetLan ?? 'English';
    selectedSource = widget.data?.sourceLan ?? 'Turkish';
    inputController.text= widget.data?.text ?? '';
    outputController.text=widget.result?.data!.translations?[0].translatedText ?? '';


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
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              DropdownButton<String>(
                value: selectedSource,
                elevation: 16,
                 dropdownColor: Colors.brown.shade50,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 3,
                  color: Colors.deepPurple.shade100,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSource = newValue!;
                  });
                },
                items: languages.keys.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ]),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                height: 150,
                child: TextField(
                  controller: inputController,
                  style:    const TextStyle(
                    fontSize: 18.0, height: 1.0, color: Colors.black),
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      hintText: 'Enter text',
                      hintStyle: const TextStyle(
                          fontSize: 14.0, height: 2.0, color: Colors.black),
                      border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple.shade100,
                            width: 2.0)
                    )



                      ),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              DropdownButton<String>(
                value: selectedTarget,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                dropdownColor: Colors.brown.shade50,
                underline: Container(
                  height: 3,
                  color: Colors.deepPurple.shade100,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTarget = newValue!;
                  });
                },
                items: languages.keys.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ]),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 150,
              child: TextField(
                  controller: outputController,
                  readOnly: true,
                  style: const TextStyle(
                      fontSize: 18.0, height: 1.0, color: Colors.black),
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple.shade100,
                              width: 2.0),

                  )
              )
            ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                    side: BorderSide(color: Colors.green.shade50, width:2),
                    padding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    textStyle: const TextStyle(
                        color: Colors.white, fontSize: 20, fontStyle: FontStyle.normal),


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
