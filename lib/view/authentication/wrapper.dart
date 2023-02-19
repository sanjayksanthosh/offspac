import 'package:flutter/material.dart';
import 'package:offspace/models/user.dart';
import 'package:offspace/view/authentication/authenticate.dart';
import 'package:offspace/view/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Homepage();
    }
  }
}
