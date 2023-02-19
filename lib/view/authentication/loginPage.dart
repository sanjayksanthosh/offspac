import 'package:flutter/material.dart';
import 'package:offspace/view-model/auth.dart';
import 'package:offspace/widgets/loading.dart';

class LoginPage extends StatefulWidget {
  final Function toggleview;
  LoginPage({super.key, required this.toggleview});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final nameController = TextEditingController();
  String email = '';

  String password = '';

  String error = '';

  bool loading = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Text Color
              ),
              onPressed: () async => widget.toggleview(),
              child: Text('Signup'))
        ],
      ),
      body: loading
          ? Loading()
          : SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "enter an email" : null,
                        onChanged: ((value) {
                          setState(() => email = value);
                        })),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) => value!.length < 6
                          ? "enter a password 6+ charecter long"
                          : null,
                      onChanged: (value) {
                        setState(() => password = value);
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: (() async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signinWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not sign in with those credentials';
                                loading = false;
                              });
                            }
                          }
                        }),
                        child: Text("Signin")),
                    SizedBox(
                      height: 12,
                    ),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0))
                  ]),
                ),
              ),
            ),
    );
  }
}
