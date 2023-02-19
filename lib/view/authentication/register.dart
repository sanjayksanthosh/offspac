import 'package:flutter/material.dart';

import '../../view-model/auth.dart';
import '../../widgets/loading.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({super.key, required this.toggleview});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Register'),
        actions: <Widget>[
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Text Color
              ),
              onPressed: () async => widget.toggleview(),
              child: Text('login'))
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
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'please supply a valid email';
                                loading = false;
                              });
                            }
                          }
                        }),
                        child: Text(
                          "Register",
                        )),
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
