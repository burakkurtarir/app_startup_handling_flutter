import 'package:app_startup_handling_flutter/features/startup/cubit/startup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupFailureView extends StatelessWidget {
  final String error;

  const StartupFailureView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup failed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _StartupFailurePage(error),
    );
  }
}

class _StartupFailurePage extends StatelessWidget {
  final String error;

  const _StartupFailurePage(this.error);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup failed"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error),
            TextButton(
              onPressed: context.read<StartupCubit>().initializeServices,
              child: const Text("Try again"),
            ),
          ],
        ),
      ),
    );
  }
}
