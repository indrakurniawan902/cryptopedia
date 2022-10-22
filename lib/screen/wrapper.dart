import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/screen/on_boarding/on_boarding.dart';
import 'package:cryptopedia/screen/registration/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    return StreamBuilder<User?>(
      stream: auth.changeState(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.active) {
          // return (snapshot.data != null && snapshot.data!.emailVerified)
          return (snapshot.data != null) //untuk anonimous login
              ? const Registration()
              : const OnBoarding();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
