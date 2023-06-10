import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  // create user obj based on firebase user
  User? _userFromFirebaseUser(firebase_auth.User? user,
      {String name = '', String email = ''}) {
    return User(
        uid: user?.uid ?? '',
        name: name,
        email: email,
        hasCar: false,
        isDarkMode: false,
        cookiesSaved: true,
        localStorageSaved: true,
        geolocationEnabled: true,
        isVegetarian: false,
        isVegan: false,
        schedule: '00000000000000000000000000000000',
        task: 0);
  }

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      firebase_auth.UserCredential result = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      firebase_auth.User? user = result.user;

      final bool should_notif = await checkIfNotif(user);
      print(should_notif);

      return user;
    } catch (error) {
      print(error.toString());
      return error;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      firebase_auth.UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      firebase_auth.User? user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData(name, email);
      return _userFromFirebaseUser(user, name: name, email: email);
    } catch (error) {
      print(error.toString());
      return error;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

Future<double> getCurrDistance(lat, long, task) async {
  final url = Uri.parse(
      'http://zotfeast-backend.vercel.app/api/recommendation/distance');
  final body = {
    'latitude': lat,
    'longitude': long,
    'task': task,
  };

  final response = await http.post(url,
      body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
  final dist = json.decode(response.body)['distance'];

  return dist;
}

Future<bool> checkIfNotif(u) async {
  final user = await DatabaseService(uid: u!.uid).getUserFromId(u!.uid);

  if (user.selectedRecipe == '' || user.schedule == '') {
    return false;
  }

  final recipe = await DatabaseService(uid: user!.uid)
      .getRecipeFromId(user!.selectedRecipe);

  DateTime now = DateTime.now();
  DateTime startTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
  int time = now.difference(startTime).inMinutes ~/ 30;

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  double current_latitude = position?.latitude ?? 0.0;
  double current_longitude = position?.longitude ?? 0.0;

  double dist =
      await getCurrDistance(current_latitude, current_longitude, user.task);

  final url = Uri.parse(
      'http://zotfeast-backend.vercel.app/api/recommendation/notification');
  final body = {
    'schedule': user.schedule,
    'time': time,
    'dist': dist,
    'task': user.task,
    'duration': recipe.cookTime
  };

  final response = await http.post(url,
      body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

  final shouldNotif = json.decode(response.body)['notification'];

  return shouldNotif == 1 ? true : false;
}
