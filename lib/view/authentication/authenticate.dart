import 'package:flutter/material.dart';
import 'package:offspace/view/authentication/loginPage.dart';
import 'package:offspace/view/authentication/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;

  void toggleview() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignin
          ? LoginPage(toggleview: toggleview)
          : Register(toggleview: toggleview),
    );
  }
}
