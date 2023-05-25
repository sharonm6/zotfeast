class User {
  final String uid;
  String name;
  String email;
  bool hasCar;

  User(
      {required this.uid,
      this.name = '',
      this.email = '',
      this.hasCar = false});

  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        name = data['name'] ?? '',
        email = data['email'] ?? '',
        hasCar = data['hasCar'] ?? false;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'hasCar': hasCar,
    };
  }
}
