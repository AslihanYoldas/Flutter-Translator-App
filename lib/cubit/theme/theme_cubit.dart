import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/theme.dart';

class ThemeCubit extends Cubit<ThemeData>{
  ThemeCubit():super(lightTheme);


  void toggleTheme(){
    emit(state.brightness == Brightness.light ? darkTheme : lightTheme);
}

}