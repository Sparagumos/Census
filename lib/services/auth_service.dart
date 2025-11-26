import '../models/user_model.dart';

class AuthService {
  // In-memory list of users
  final List<User> _users = [
    User(email: 'admin@gmail.com', password: 'admin', role: 'admin'),
    User(email: 'user@gmail.com', password: 'user', role: 'user'),
  ];

  List<User> get users => _users;

  // Signup
  String signup(String email, String password) {
    if (_users.any((u) => u.email == email)) {
      return 'Email already exists';
    }
    _users.add(User(email: email, password: password, role: 'user'));
    return 'Signup successful';
  }

  // Login
  User? login(String email, String password) {
    try {
      final user =
      _users.firstWhere((u) => u.email == email && u.password == password);
      return user;
    } catch (e) {
      return null;
    }
  }

  // Admin CRUD
  void createUser(User user) => _users.add(user);

  void updateUser(User user, String firstName, String middleName, String lastName, String? suffix) {
    user.firstName = firstName;
    user.middleName = middleName;
    user.lastName = lastName;
    user.suffix = suffix;
  }

  void deleteUser(User user) => _users.remove(user);

  // New: store user form submissions
  final List<Map<String, String?>> _submissions = [];

  List<Map<String, String?>> get submissions => _submissions;

  // ... existing signup, login, CRUD methods

  // Add a submission
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
