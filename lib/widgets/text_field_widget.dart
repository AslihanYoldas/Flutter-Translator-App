
import 'package:flutter/material.dart';
import 'package:flutter_translator_app/widgets/bottom_sheet_widget.dart';
Widget buildTextField(context,TextEditingController controller, String? sourceLan, String? targetLan, {bool readOnly = false}) {
  return SizedBox(
    width: 340,
    height: 120,
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      expands: true,
      style: const TextStyle(fontSize: 18.0, height: 1.0, color: Colors.black),
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 200),
        suffixIcon: readOnly ? null : buildGestureDetector(context,sourceLan,targetLan),
        hintText: readOnly ? null : 'Enter text',
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade100, width: 2.0),
        ),
      ),
    ),
  );
}
 Widget buildGestureDetector(context,String? sourceLan, String? targetLan) {
   return GestureDetector(
     onTap: () async {
       speechBottomSheet(context,"Tap to mic") ;

     },
    child: CircleAvatar(

        backgroundColor: Colors.deepPurple.shade200,
        radius: 5,
        child: const Icon(
          Icons.mic,
          color: Colors.white70,
        )),
  );

 }