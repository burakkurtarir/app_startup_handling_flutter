import 'package:app_startup_handling_flutter/shared/firebase.dart';
import 'package:app_startup_handling_flutter/shared/local_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(const StartupLoading());

  Future<void> initializeServices() async {
    try {
      emit(const StartupLoading());
      // Fake delay to see loading view
      await Future.delayed(const Duration(seconds: 2));
      await Firebase.initializeApp();
      await LocalStorage.initialize();
      emit(const StartupCompleted());
    } catch (e) {
      emit(StartupFailure(e.toString()));
    }
  }
}
