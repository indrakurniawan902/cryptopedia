import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text("Berhasil Login"),
          ButtonComponent(
            text: "Logout",
            onClickFunction: () {
              auth.logout();
            },
            isDisable: false,
          ),
          ButtonComponent(
              text: 'Profile',
              onClickFunction: () {
                Navigator.pushNamed(context, '/profile');
              },
              isDisable: false),
          ButtonComponent(
              text: 'Add Post',
              onClickFunction: () {
                Navigator.pushNamed(context, '/add-post');
              },
              isDisable: false),
        ],
      )),
    );
  }
}
