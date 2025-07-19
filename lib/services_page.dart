import 'package:flutter/material.dart';
import 'veterinarian_page.dart';
import 'grooming_page.dart';
import 'pet_sitters_page.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Hello, How may I help you ?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => VeterinarianPage()));
          },
          child: ServiceCard(
            color: Color(0xFFEAD7F1),
            title: 'Veterinarian',
            imagePath: 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
            services: [
              'Preventive Care',
              'Medical Diagnosis and Treatment',
              'Surgical Procedures'
            ],
          ),
        ),
        const SizedBox(height: 16),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => GroomingPage()));
          },
          child: ServiceCard(
            color: Colors.white,
            title: 'Grooming',
            imagePath: 'https://cdn-icons-png.flaticon.com/512/3003/3003984.png',
            services: [
              'Bathing and Brushing',
              'Hair Trimming and Styling',
              'Nail Clipping and Ear Cleaning'
            ],
          ),
        ),
        const SizedBox(height: 16),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => PetSittersPage()));
          },
          child: ServiceCard(
            color: Color(0xFFE6F2FF),
            title: 'Pet Sitters',
            imagePath: 'https://cdn-icons-png.flaticon.com/512/2921/2921222.png',
            services: [
              'Feeding and Medication',
              'Exercise and Playtime',
              'Basic Care and Companionship'
            ],
          ),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<String> services;
  final Color color;

  const ServiceCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.services,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(imagePath, height: 40, width: 40),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...services.map((s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text('• $s', style: TextStyle(fontSize: 14)),
              )),
        ],
      ),
    );
  }
}
