import 'package:flutter/material.dart';

class GroomerScreen extends StatelessWidget {
  const GroomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Groomer')),
      body: const Center(child: Text('Groomer Page')),
    );
  }
}
