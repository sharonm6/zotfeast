import 'package:zotfeast/components/loading.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/screens/authenticate/authenticate.dart';
import 'package:zotfeast/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/services/database.dart';

class Wrapper extends StatefulWidget {
  bool should_notif = false;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    bool should_notif = widget.should_notif;

    void toggleNotif() {
      if (mounted) {
        setState(() => widget.should_notif = !widget.should_notif);
      }
    }
    // // return either the Home or Authenticate widget
    // if (user == null) {
    //   return Authenticate();
    // } else if (user.uid.isEmpty) {
    //   return Loading();
    // } else {
    //   final databaseService = DatabaseService(uid: user.uid);

    //   return Home(user: user, databaseService: databaseService);
    // }

    if (user == null) {
      return Loading();
    } else {
      // User is not null, check the uid
      if (user.uid.isEmpty) {
        return Authenticate(toggleNotif: toggleNotif);
      } else {
        final databaseService = DatabaseService(uid: user.uid);
        return Home(
          user: user,
          databaseService: databaseService,
          showNotif: should_notif,
          toggleNotif: toggleNotif,
        );
      }
    }
  }
}
