import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/bottom_navbar_provider.dart';
import 'package:cryptopedia/provider/coin_provider.dart';
import 'package:cryptopedia/provider/crypto_101_provider.dart';
import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/screen/add_post/add_post.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/about_app/about_app.dart';
import 'package:cryptopedia/screen/bookmark/bookmark.dart';
import 'package:cryptopedia/screen/crypto_101/crypto_101.dart';
import 'package:cryptopedia/screen/crypto_101/detail_crypto_101.dart';
import 'package:cryptopedia/screen/crypto_sharing/detail_crypto_sharing.dart';
import 'package:cryptopedia/screen/edit_profile/edit_profile.dart';
import 'package:cryptopedia/screen/homepage/homepage.dart';
import 'package:cryptopedia/screen/my_post/my_post.dart';
import 'package:cryptopedia/screen/my_profile/my_profile.dart';
import 'package:cryptopedia/screen/navbar/navbar.dart';
import 'package:cryptopedia/screen/profile/profile.dart';
import 'package:cryptopedia/screen/registration/registration_success.dart';
import 'package:cryptopedia/screen/registration/auth_wrapper.dart';
import 'package:cryptopedia/utils/constant/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utils/firebase/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => CoinProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavbarProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => Crypto101Provider()),
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
            navigatorKey: navigatorKey,
            routes: {
              '/': (context) => const AuthWrapper(),
              '/register-success': (context) => const RegistrationSuccess(),
              '/home': (context) => const Homepage(),
              '/profile': (context) => const Profile(),
              '/my-profile': (context) => const MyProfile(),
              '/about-app': (context) => const AboutApp(),
              '/edit-profile': (context) => const EditProfile(),
              '/add-post': (context) => const AddPost(),
              '/bookmark': (context) => const Bookmark(),
              '/my-post': (context) => const MyPost(),
              '/navbar': (context) => const Navbar(),
              '/101-detail': (context) => const DetailCrypto101(),
              '/sharing-detail': (context) => const DetailCryptoSharing(),
            },
            initialRoute: '/',
          ),
        ),
      ),
    );
  }
}
