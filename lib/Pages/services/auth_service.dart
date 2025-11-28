import '../models/user_model.dart';

class AuthService {
  // Local in-memory user storage (mock database)
  final List<User> _users = [
    User(email: 'admin@gmail.com', password: 'admin', role: 'admin'),
    User(email: 'user', password: 'user', role: 'user'),
  ];

  List<User> get users => _users;

  // SIGNUP
  String signup(String email, String password) {
    // Prevent duplicate email
    if (_users.any((u) => u.email == email)) {
      return 'Email already exists';
    }

    // Default role = 'user'
    _users.add(User(
      email: email,
      password: password,
      role: 'user',
    ));

    return 'Signup successful';
  }

  // LOGIN
  Future<User?> login(String email, String password) async {
    // Simulate delay (optional)
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      return _users.firstWhere(
            (u) => u.email == email && u.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  // CRUD OPERATIONS
  void createUser(User user) => _users.add(user);

  void deleteUser(User user) => _users.remove(user);

  void updateUser(
      User user,
      String firstName,
      String middleName,
      String lastName,
      String? suffix,
      ) {
    user.firstName = firstName;
    user.middleName = middleName;
    user.lastName = lastName;
    user.suffix = suffix;
  }

  // SUBMISSIONS
  final List<Map<String, String?>> _submissions = [];
  List<Map<String, String?>> get submissions => _submissions;

  void addSubmission(User user) {
    _submissions.add({
      'email': user.email,
      'firstName': user.firstName,
      'middleName': user.middleName,
      'lastName': user.lastName,
      'suffix': user.suffix,
    });
  }
}
