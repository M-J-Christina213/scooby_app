import 'package:flutter/material.dart';

class PetSitterScreen extends StatelessWidget {
  const PetSitterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet Sitter')),
      body: const Center(child: Text('Pet Sitter Page')),
    );
  }
}
