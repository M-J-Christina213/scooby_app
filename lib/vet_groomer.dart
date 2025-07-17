import 'package:flutter/material.dart';
import 'veterinarian_screen.dart';
import 'groomer_screen.dart';
import 'petsitter_screen.dart';

class VetGroomerScreen extends StatelessWidget {
  const VetGroomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet / Groomer'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSectionCard(
              context,
              title: 'Veterinarian',
              color: Colors.deepPurpleAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VeterinarianScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            buildSectionCard(
              context,
              title: 'Groomers',
              color: Colors.indigo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GroomerScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            buildSectionCard(
              context,
              title: 'PetSitters',
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PetSitterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionCard(BuildContext context,
      {required String title, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
