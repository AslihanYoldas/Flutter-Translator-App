import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container buildLoading(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.75,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      color: Theme.of(context).focusColor,
    ),
  );
}
