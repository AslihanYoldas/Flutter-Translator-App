
import 'package:flutter/material.dart';
import 'package:flutter_translator_app/widgets/bottom_sheet_widget.dart';
Widget buildTextField(context,TextEditingController controller, String? sourceLan, String? targetLan, {bool readOnly = false}) {
  return TextField(
    controller: controller,
    readOnly: readOnly,
    style: const TextStyle(fontSize: 18.0, height: 1.0, color: Colors.black),
    textInputAction: TextInputAction.newline,
    keyboardType: TextInputType.multiline,
    maxLines: null,
    decoration: InputDecoration(
      suffixIcon: readOnly ? null : buildGestureDetector(context,sourceLan,targetLan),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintText: readOnly ? null : 'Enter text',
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple.shade100, width: 2.0),
      ),
    ),
  );
}
 Widget buildGestureDetector(context,String? sourceLan, String? targetLan) {
   return GestureDetector(
     onTap: () async {
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => speechBottomSheet(context,"Tap to mic") ));

     },
     child: const CircleAvatar(
         child: Icon(Icons.mic)

     ),
   );

 }