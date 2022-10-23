import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:cryptopedia/screen/homepage.dart';
import 'package:cryptopedia/screen/registration/registration.dart';
import 'package:cryptopedia/screen/registration/registration_success.dart';
import 'package:cryptopedia/screen/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Poppins",
          ),
          routes: {
            '/': (context) => const AuthWrapper(),
            '/register-success': (context) => const RegistrationSuccess(),
            '/home': (context) => const Homepage(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}
