import 'package:flutter/material.dart';

class VetGroomerScreen extends StatelessWidget {
  const VetGroomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet / Groomer'),
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text(
          'Welcome, Vet or Groomer!',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
