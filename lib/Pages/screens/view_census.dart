import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(child: Text(value.isEmpty ? 'N/A' : value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Static placeholder values
    const house_number = 'N/A';
    const firstName = 'N/A';
    const middleName = 'N/A';
    const lastName = 'N/A';
    const suffix = 'N/A';
    const houseNumber = 'N/A';
    const position = 'N/A';
    const gender = 'N/A';
    const civilStatus = 'N/A';
    const birthDate = 'N/A';
    const birthPlace = 'N/A';
    const contact = 'N/A';
    const religion = 'N/A';
    const lengthOfStay = 'N/A';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Census Information'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registered Census Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                  const SizedBox(height: 16),
                  _infoRow('house number', house_number),
                  _infoRow('First Name', firstName),
                  _infoRow('Middle Name', middleName),
                  _infoRow('Last Name', lastName),
                  _infoRow('Suffix', suffix),
                  _infoRow('House # / Address', houseNumber),
                  _infoRow('Position in Family', position),
                  _infoRow('Sex', gender),
                  _infoRow('Civil Status', civilStatus),
                  _infoRow('Date of Birth', birthDate),
                  _infoRow('Place of Birth', birthPlace),
                  _infoRow('Contact #', contact),
                  _infoRow('Religion', religion),
                  _infoRow('Length of Stay', lengthOfStay),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
