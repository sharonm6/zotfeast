import 'package:zotfeast/screens/authenticate/register.dart';
import 'package:zotfeast/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  final Function toggleNotif;
  Authenticate({required this.toggleNotif});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = false;
  void toggleView() {
    if (mounted) {
      setState(() => showSignIn = !showSignIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView, toggleNotif: widget.toggleNotif);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
