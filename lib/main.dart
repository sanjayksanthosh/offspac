import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:offspace/models/user.dart';
import 'package:offspace/view/authentication/loginPage.dart';
import 'package:offspace/view/authentication/wrapper.dart';
import 'package:offspace/view-model/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        home: Wrapper(),
      ),
    );
  }
}
