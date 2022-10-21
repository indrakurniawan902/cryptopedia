import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:cryptopedia/screen/on_boarding/on_boarding.dart';
import 'package:cryptopedia/screen/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Registration(),
      ),
    );
  }
}
