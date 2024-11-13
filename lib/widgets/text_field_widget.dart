
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translator_app/widgets/bottom_sheet_widget.dart';
Widget buildTextField(context,TextEditingController controller, String? sourceLan, String? targetLan, {bool readOnly = false}) {
  return SizedBox(
    width: 340,
    height: 160,
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      maxLength: 5000,
      expands: true,
      cursorColor:Theme.of(context).focusColor ,
      style: const TextStyle(fontSize: 14.0, height: 1.0),
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        suffixIcon: readOnly ? buildSuffixIconsOutput(context, controller) : buildSuffixIconsInput(context,controller,sourceLan,targetLan),
        hintText: readOnly ? null : 'Enter text',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),

        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Theme.of(context).focusColor, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),

        ),
      )

  );

}

Widget buildSuffixIconsInput(BuildContext context,
    TextEditingController controller, String? sourceLan, String? targetLan) {
  return IntrinsicWidth(
    child: Container(
      width: 40,
      margin: const EdgeInsets.fromLTRB(30, 50, 10, 10),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              speechBottomSheet(context, "Tap to mic");
            },
              child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 20,
                  child: Icon(
                    Icons.mic,
                    color: Theme.of(context).focusColor,
                  )),
            ),
          buildCopyButton(context, controller),
        ],
      ),
    ),
  );
}

Widget buildSuffixIconsOutput(BuildContext context,
    TextEditingController controller) {
  return IntrinsicWidth(
    child: Container(
      alignment: Alignment.bottomRight,
      width: 40,
      margin: const EdgeInsets.fromLTRB(30, 50, 10, 10),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: buildCopyButton(context, controller),

    ),
  );
}
Widget buildCopyButton(context,TextEditingController controller){
  return IconButton(
    onPressed: (){
      Clipboard.setData(ClipboardData(text: controller.text)).then((result) {
        const snackBar = SnackBar(
          content: Text('Copied to Clipboard'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });;
    },
    icon:Icon(
        Icons.copy,
        color: Theme.of(context).focusColor

    ),
  );
}
