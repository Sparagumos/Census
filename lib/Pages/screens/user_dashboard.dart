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

  // Controllers for form fields
  final _houseNumberController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _suffixController = TextEditingController();
  final _positionController = TextEditingController();
  final _genderController = TextEditingController();
  final _civilStatusController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _contactController = TextEditingController();
  final _religionController = TextEditingController();
  final _lengthOfStayController = TextEditingController();

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Out Census Form'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Barangay 59 - Census Form',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 16),

              // House Number
              TextField(
                controller: _houseNumberController,
                decoration: const InputDecoration(labelText: 'House Number', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Name Fields
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _middleNameController,
                decoration: const InputDecoration(labelText: 'Middle Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _suffixController,
                decoration: const InputDecoration(labelText: 'Suffix (optional)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Position in Family
              TextField(
                controller: _positionController,
                decoration: const InputDecoration(labelText: 'Position in Family', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Gender
              TextField(
                controller: _genderController,
                decoration: const InputDecoration(labelText: 'Sex (M/F)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Civil Status
              TextField(
                controller: _civilStatusController,
                decoration: const InputDecoration(labelText: 'Civil Status', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Date of Birth
              TextField(
                controller: _birthDateController,
                decoration: const InputDecoration(labelText: 'Date of Birth (MM/DD/YYYY)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Place of Birth
              TextField(
                controller: _birthPlaceController,
                decoration: const InputDecoration(labelText: 'Place of Birth', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Contact Number
              TextField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact #', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Religion
              TextField(
                controller: _religionController,
                decoration: const InputDecoration(labelText: 'Religion', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),

              // Length of Stay
              TextField(
                controller: _lengthOfStayController,
                decoration: const InputDecoration(labelText: 'Length of Stay in Barangay', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    User currentUser = _authService.users.firstWhere(
                          (u) => u.email == 'user@gmail.com', // TODO: Replace with actual logged-in user
                      orElse: () => User(email: 'user@gmail.com', password: 'user', role: 'user'),
                    );

                    // Save all fields
                    currentUser.firstName = _firstNameController.text.trim().isEmpty ? 'N/A' : _firstNameController.text.trim();
                    currentUser.middleName = _middleNameController.text.trim().isEmpty ? 'N/A' : _middleNameController.text.trim();
                    currentUser.lastName = _lastNameController.text.trim().isEmpty ? 'N/A' : _lastNameController.text.trim();
                    currentUser.suffix = _suffixController.text.trim().isEmpty ? 'N/A' : _suffixController.text.trim();

                    // Add submission
                    _authService.addSubmission(currentUser);

                    setState(() {
                      _message = 'Census information submitted successfully!';
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Submit', style: TextStyle(fontSize: 16)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(_message, style: const TextStyle(color: Colors.green, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
