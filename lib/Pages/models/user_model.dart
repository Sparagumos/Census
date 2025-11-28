class User {
  String email;
  String password;
  String role; // 'admin' or 'user'
  String? firstName;
  String? middleName;
  String? lastName;
  String? suffix;

  User({
    required this.email,
    required this.password,
    required this.role,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
  });
}
