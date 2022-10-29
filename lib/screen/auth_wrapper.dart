import 'dart:async';
import 'dart:convert';

import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/screen/add_post/add_post.dart';
import 'package:cryptopedia/screen/homepage.dart';
import 'package:cryptopedia/screen/on_boarding/on_boarding.dart';
import 'package:cryptopedia/screen/registration/registration.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../utils/constant/api_constant.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  Future<bool> _isRegistered(String? email) async {
    try {
      var res = await http.get(Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.checkRegister}?email=${email ?? ''}"));
      if (res.statusCode == 200) {
        var dataResponse = jsonDecode(res.body);

        if (dataResponse == 1) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    User? user = auth.getUser();
    String? email = user != null ? user.email : "";

    return StreamBuilder<User?>(
      stream: auth.changeState(),
      builder: (context, snapshotStream) {
        // print(snapshotStream.data);
        if (snapshotStream.connectionState == ConnectionState.active) {
          return (snapshotStream.data != null)
              ? FutureBuilder(
                  future: _isRegistered(snapshotStream.data!.email),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBrand,
                          ),
                        ),
                      );
                    } else {
                      if (snapshot.hasData && snapshot.data!) {
                        return const Homepage();
                      } else {
                        return Registration(
                          userEmail: snapshotStream.data!.email,
                        );
                      }
                    }
                  }))
              : const OnBoarding();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBrand,
            ),
          );
        }
      },
    );
  }
}
