import 'package:app_startup_handling_flutter/features/home/home_page.dart';
import 'package:flutter/material.dart';

class StartupCompletedView extends StatelessWidget {
  const StartupCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
