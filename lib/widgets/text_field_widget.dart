
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
      cursorColor:Theme.of(context).focusColor ,
      style: const TextStyle(fontSize: 18.0, height: 1.0),
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        suffixIcon: readOnly ? null : buildGestureDetector(context,sourceLan,targetLan),
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
 Widget buildGestureDetector(context,String? sourceLan, String? targetLan) {
   return GestureDetector(
     onTap: () async {
       speechBottomSheet(context,"Tap to mic") ;

     },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: CircleAvatar(

          backgroundColor: Theme.of(context).primaryColor,
          radius: 20,
          child:  Icon(
            Icons.mic,
            color:Theme.of(context).focusColor ,
          )),
    ),
  );

 }