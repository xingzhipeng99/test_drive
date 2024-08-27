class User {
  int id;
  String name;
  Gender? gender;
  DateTime? birthday;

  User(this.id, this.name, [this.gender, this.birthday]);
}

enum Gender { male, female, unset }
