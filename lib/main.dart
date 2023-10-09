import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/main_screen.dart';
import 'service/autoservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainScreen(),
      ),
    );
  }
}
