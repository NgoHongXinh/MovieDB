import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/Application/application_notifier.dart';
import 'Screen/Application/application_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationNotifier>(
        create: (context) => ApplicationNotifier(context),
        child: ApplicationScreen()
    );
  }
}


