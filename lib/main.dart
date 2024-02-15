import 'package:app_startup_handling_flutter/features/startup/cubit/startup_cubit.dart';
import 'package:app_startup_handling_flutter/features/startup/views/startup_completed_view.dart';
import 'package:app_startup_handling_flutter/features/startup/views/startup_failure_view.dart';
import 'package:app_startup_handling_flutter/features/startup/views/startup_loading_view.dart';
import 'package:app_startup_handling_flutter/shared/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit()..initializeServices(),
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupCubit, StartupState>(
      builder: (context, state) {
        switch (state) {
          case StartupLoading():
            return const StartupLoadingView();
          case StartupCompleted():
            return const StartupCompletedView();
          case StartupFailure(message: final message):
            return StartupFailureView(error: message);
        }
      },
    );
  }
}
