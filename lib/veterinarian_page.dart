import 'package:flutter/material.dart';
import 'veterinarian_detail_page.dart'; // Create this file for detail screen

class VeterinarianPage extends StatelessWidget {
  final List<Map<String, dynamic>> vets = [
    {
      'name': 'Dr. Janaki Collure',
      'qualification': 'Bachelor of Veterinary Science SL',
      'rating': 4.9,
      'reviews': 120,
      'distance': '2.5 km',
      'experience': '10 years',
      'schedule': 'Monday - Friday at 8:00 a.m - 5:00 p.m',
      'image': 'assets/images/janaki.png', // Add your images here
    },
    {
      'name': 'Dr. Sambuvan',
      'qualification': 'Veterinary Dentist',
      'rating': 5.0,
      'reviews': 100,
      'distance': '3.1 km',
      'experience': '8 years',
      'schedule': 'Monday - Friday at 8:00 a.m - 5:00 p.m',
      'image': 'assets/images/sambuvan.png',
    },
    {
      'name': 'Dr. Nambuvan',
      'qualification': 'Bachelor of Veterinary Science',
      'rating': 5.0,
      'reviews': 160,
      'distance': '2.1 km',
      'experience': '6 years',
      'schedule': 'Monday - Friday at 8:00 a.m - 5:00 p.m',
      'image': 'assets/images/nambuvan.png',
    },
  ];

 VeterinarianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, How may I help you ?"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _sectionTitle("Nearby Veterinarian"),
          ...vets.take(2).map((vet) => _vetCard(context, vet)),
          _sectionTitle("Recommended Veterinarian"),
          ...vets.skip(2).map((vet) => _vetCard(context, vet)),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _vetCard(BuildContext context, Map<String, dynamic> vet) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VeterinarianDetailPage(vet: vet)),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(vet['image']),
                radius: 30,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vet['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(vet['qualification'], style: TextStyle(color: Colors.grey[700])),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Text('${vet['rating']} (${vet['reviews']} reviews)'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('${vet['experience']} of experience • ${vet['distance']}'),
                    Text(vet['schedule'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
