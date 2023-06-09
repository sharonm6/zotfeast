import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid = ''});

  // collection references

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference recipeCollection =
      FirebaseFirestore.instance.collection('recipes');

  // Users

  Future<void> updateUserData(String name, String email,
      {bool hasCar = false,
      bool isDarkMode = false,
      bool cookiesSaved = true,
      bool localStorageSaved = true,
      bool geolocationEnabled = true,
      bool isVegetarian = false,
      bool isVegan = false,
      String selectedRecipe = '',
      String schedule = '00000000000000000000000000000000',
      int task = 0}) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'hasCar': hasCar,
      'isDarkMode': isDarkMode,
      'cookiesSaved': cookiesSaved,
      'localStorageSaved': localStorageSaved,
      'geolocationEnabled': geolocationEnabled,
      'isVegetarian': isVegetarian,
      'isVegan': isVegan,
      'selectedRecipe': selectedRecipe,
      'schedule': schedule,
      'task': task
    });
  }

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
        isVegan: data?['isVegan'],
        selectedRecipe: data?['selectedRecipe'],
        schedule: data?['schedule'],
        task: data?['task']);
  }

  Stream<User> get user {
    return userCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _userFromSnapshot(snapshot));
  }

  Future<User> getUserFromId(String uid) async {
    return userCollection.doc(uid).get().then(
          (data) => User(
              uid: uid,
              name: data?['name'],
              email: data?['email'],
              hasCar: data?['hasCar'],
              isDarkMode: data?['isDarkMode'],
              cookiesSaved: data?['cookiesSaved'],
              localStorageSaved: data?['localStorageSaved'],
              geolocationEnabled: data?['geolocationEnabled'],
              isVegetarian: data?['isVegetarian'],
              isVegan: data?['isVegan'],
              selectedRecipe: data?['selectedRecipe'],
              schedule: data?['schedule'],
              task: data?['task']),
        );
  }

  // Recipes

  List<Recipe> _recipeFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      return Recipe(
        name: data?['name'],
        cookTime: data?['cookTime'],
        price: data?['price'],
        servings: data?['servings'],
        calories: data?['calories'],
        ingredients: List<String>.from(data?['ingredients']),
        instructions: List<String>.from(data?['instructions']),
        rid: doc.id,
      );
    }).toList();
  }

  Stream<List<Recipe>> get recipe {
    return recipeCollection.snapshots().map(_recipeFromSnapshot);
  }

  Future<Recipe> recipeFromSnapshot(data) async {
    return await Recipe(
      name: data?['name'],
      cookTime: data?['cookTime'],
      price: data?['price'],
      servings: data?['servings'],
      calories: data?['calories'],
      ingredients: List<String>.from(data?['ingredients']),
      instructions: List<String>.from(data?['instructions']),
      rid: data?['rid'],
    );
  }

  Future<Recipe> getRecipeFromId(String rid) async {
    return recipeCollection.doc(rid).get().then((data) => Recipe(
          name: data?['name'],
          cookTime: data?['cookTime'],
          price: data?['price'],
          servings: data?['servings'],
          calories: data?['calories'],
          ingredients: List<String>.from(data?['ingredients']),
          instructions: List<String>.from(data?['instructions']),
          rid: data?['rid'],
        ));
  }
}
