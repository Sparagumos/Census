import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
            // -------------------- USERS LIST --------------------
            const Text(
              'All Users:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: _authService.users.length,
                itemBuilder: (context, index) {
                  final user = _authService.users[index];
                  return ListTile(
                    title: Text(user.email),
                    subtitle: Text(user.role),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // EDIT BUTTON
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(user);
                          },
                        ),
                        // DELETE BUTTON
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _authService.deleteUser(user);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // -------------------- SUBMISSIONS LIST --------------------
            const Text(
              'User Form Submissions:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            const Text(
              'User@gmail.com',
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              'First name: Example',
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              'Middle name: Example',
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              'Last name: Example',
              style: TextStyle(fontSize: 15),
            ),const Text(
              'Suffix: Sr',
              style: TextStyle(fontSize: 15),
            ),

            Expanded(
              child: ListView.builder(

                itemCount: _authService.submissions.length,
                itemBuilder: (context, index) {
                  final s = _authService.submissions[index];
                  return ListTile(
                    title: Text(s['email'] ?? ''),
                    subtitle: Text(
                          '${s['firstName'] ?? ''} '
                          '${s['middleName'] ?? ''} '
                          '${s['lastName'] ?? ''} '
                          '${s['suffix'] ?? ''}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------- EDIT USER DIALOG --------------------
  void _showEditDialog(User user) {
    final _emailController = TextEditingController(text: user.email);
    final _passwordController = TextEditingController(text: user.password);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit User Credentials'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                user.email = _emailController.text.trim();
                user.password = _passwordController.text.trim();
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
