import 'package:zotfeast/services/auth.dart';
import 'package:zotfeast/config/constants.dart';
import 'package:zotfeast/components/loading.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: ColorConstants.zotfeastBrown,
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Text("Hello Again!",
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(height: 40.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Your email'),
                      validator: (val) => val != null && val.isEmpty
                          ? 'Please enter a valid email'
                          : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val != null && val.length < 6
                          ? 'Please enter a valid password'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 30.0),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorConstants.zotfeastGreen,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20.0),
                          child: Text(
                            'Sign In',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result is firebase_auth.FirebaseAuthException) {
                              setState(() {
                                loading = false;
                                error =
                                    'The email and password combination is incorrect.';
                              });
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    TextButton(
                      child: Text(
                        'Don\'t have an account? Sign Up',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      onPressed: () => widget.toggleView(),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
