import 'package:flutter/material.dart';

class VeterinarianScreen extends StatelessWidget {
  const VeterinarianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veterinarian')),
      body: const Center(child: Text('Veterinarian Page')),
    );
  }
}
