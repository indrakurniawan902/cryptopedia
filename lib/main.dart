import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/about_app/about_app.dart';
import 'package:cryptopedia/screen/edit_profile/edit_profile.dart';
import 'package:cryptopedia/screen/homepage.dart';
import 'package:cryptopedia/screen/my_profile/my_profile.dart';
import 'package:cryptopedia/screen/profile/profile.dart';
import 'package:cryptopedia/screen/registration/registration_success.dart';
import 'package:cryptopedia/screen/auth_wrapper.dart';
import 'package:cryptopedia/utils/constant/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..getPrefTheme(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeStyles.switchTheme(value.themeValue, context),
            routes: {
              '/': (context) => const AuthWrapper(),
              '/register-success': (context) => const RegistrationSuccess(),
              '/home': (context) => const Homepage(),
              '/profile': (context) => const Profile(),
              '/my-profile': (context) => const MyProfile(),
              '/about-app': (context) => const AboutApp(),
              '/edit-profile': (context) => const EditProfile(),
            },
            initialRoute: '/',
          ),
        ),
      ),
    );
  }
}
