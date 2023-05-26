import 'package:zotfeast/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid = ''});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String name, String email,
      {bool hasCar = false, bool isDarkMode = false, cookiesSaved = true, localStorageSaved = true, geolocationEnabled = true, isVegetarian = false,isVegan = false}) async {
    return await userCollection
        .doc(uid)
        .set({'name': name, 'email': email, 'hasCar': hasCar, 'isDarkMode': isDarkMode, 'cookiesSaved': cookiesSaved, 'localStorageSaved': localStorageSaved,'geolocationEnabled' : geolocationEnabled,'isVegetarian' : isVegetarian, 'isVegan':isVegan});
  }

  // user data from snapshots
  User _userFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return User(
        uid: uid,
        name: data?['name'],
        email: data?['email'],
        hasCar: data?['hasCar'],
        isDarkMode: data?['isDarkMode'],
        cookiesSaved: data?['cookiesSaved'],
        localStorageSaved: data?['localStorageSaved'],
        geolocationEnabled: data?['geolocationEnabled'],
        isVegetarian: data?['isVegetarian'],
        isVegan: data?['isVegan']);
  }

  Stream<User> get user {
    return userCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _userFromSnapshot(snapshot));
  }
}
