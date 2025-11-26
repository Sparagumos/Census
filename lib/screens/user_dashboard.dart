import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final _authService = AuthService();

  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _suffixController = TextEditingController();

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter your Fullname:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _middleNameController,
              decoration: const InputDecoration(labelText: 'Middle Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _suffixController,
              decoration: const InputDecoration(labelText: 'Suffix (optional)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the user’s inputs
                User currentUser = _authService.users.firstWhere(
                      (u) => u.email == 'user@gmail.com', // TODO: replace with logged-in user
                );

                currentUser.firstName = _firstNameController.text.trim();
                currentUser.middleName = _middleNameController.text.trim();
                currentUser.lastName = _lastNameController.text.trim();
                currentUser.suffix =
                _suffixController.text.trim().isEmpty ? null : _suffixController.text.trim();

                // Add to submissions list
                _authService.addSubmission(currentUser);

                setState(() {
                  _message =
                  'Submitted ${currentUser.firstName} ${currentUser.middleName} ${currentUser.lastName} ${currentUser.suffix ?? ''}';
                });
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 10),
            Text(
              _message,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
