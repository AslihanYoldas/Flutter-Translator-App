import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_states.dart';

class BaseCubit<T> extends Cubit<BaseStates> {
  BaseCubit(T initialState) : super(initialState as BaseStates);

  void emitLoading() => emit(LoadingState());
  void emitError(String message) => emit(ErrorState(message));
}