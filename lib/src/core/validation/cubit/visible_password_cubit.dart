import 'package:flutter_bloc/flutter_bloc.dart';

class VisiblePasswordCubit extends Cubit<bool> {
  VisiblePasswordCubit() : super(true);
  changeVisiblePassword() {
    if (!state) {
      emit(true);
    } else {
      emit(!state);
    }
  }
}
