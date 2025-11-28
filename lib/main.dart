import 'package:flutter/material.dart';
import 'Pages/screens/view_census.dart';
import 'Pages/screens/user_dashboard.dart'; // renamed "User Dashboard" to "Fill Out Census"
import 'Pages/services/login_screen.dart'; // Login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barangay 59 - A Sanpaguita Village Census',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/fillCensus': (context) => const UserDashboard(), // updated route
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barangay 59 - Census Portal'),
        elevation: 2,
      ),
      drawer: const AppSidebar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Welcome Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: const [
                        Text(
                          'Barangay 59 - A Sanpaguita Village',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Welcome to the official Barangay census portal. '
                              'Please fill out the census form. '
                              'If you have already registered, kindly wait while '
                              'Barangay officials review your information.',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Fill Census Form Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/fillCensus');
                    },
                    icon: const Icon(Icons.edit_document, size: 20),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.0),
                      child: Text(
                        'Fill Census Form',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              alignment: Alignment.center,
              color: Colors.blueAccent,
              child: const Text(
                'Barangay 59',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            // Login Button
            ListTile(
              leading: const Icon(Icons.login, color: Colors.blueAccent),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            ),

            // View Your Census (previously Signup)
            ListTile(
              leading: const Icon(Icons.app_registration, color: Colors.blueAccent),
              title: const Text('View Your Census'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/signup');
              },
            ),

            // Fill Out Census (previously New Person)
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.blueAccent),
              title: const Text('Fill Out Census'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fillCensus');
              },
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
