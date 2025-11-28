import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AllUsersDashboard extends StatefulWidget {
  const AllUsersDashboard({super.key});

  @override
  State<AllUsersDashboard> createState() => _AllUsersDashboardState();
}

class _AllUsersDashboardState extends State<AllUsersDashboard> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'All Users',
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
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showEditDialog(user),
                        ),
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
          ],
        ),
      ),
    );
  }

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
