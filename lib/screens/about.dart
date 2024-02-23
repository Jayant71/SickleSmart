import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Our Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildTeamMember('Name', 'profession', 'abc@gmail.com'),
            buildTeamMember('Name', 'profession', 'abc@gmail.com'),
            buildTeamMember('Name', 'profession', 'abc@gmail.com'),
            const SizedBox(height: 40),
            const Text(
              'Contributing Organization',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Example Organization',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Example Street, 123',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeamMember(String name, String role, String email) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(name),
        subtitle: Text('$role\n$email'),
      ),
    );
  }
}
