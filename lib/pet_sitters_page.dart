// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'pet_sitter_detail_page.dart'; // Create this file

class PetSittersPage extends StatelessWidget {
  final List<Map<String, dynamic>> petSitters = [
    {
      'name': 'Ms. Tharushi',
      'speciality': 'Overnight & Weekend Sitter',
      'rating': 4.8,
      'reviews': 70,
      'distance': '1.5 km',
      'experience': '3 years',
      'schedule': 'Available on weekdays & weekends',
      'image': 'assets/images/tharushi.png',
    },
    {
      'name': 'Mr. Nimal',
      'speciality': 'Daily Visit Sitter',
      'rating': 4.6,
      'reviews': 50,
      'distance': '2.2 km',
      'experience': '4 years',
      'schedule': 'Monday - Friday at 9:00 a.m - 5:00 p.m',
      'image': 'assets/images/nimal.png',
    },
    {
      'name': 'Ms. Kaveesha',
      'speciality': 'Weekend & Overnight Care',
      'rating': 5.0,
      'reviews': 85,
      'distance': '1.9 km',
      'experience': '5 years',
      'schedule': 'Friday - Sunday (Overnight)',
      'image': 'assets/images/kaveesha.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Sitter Services"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: petSitters.length,
        itemBuilder: (context, index) {
          final sitter = petSitters[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PetSitterDetailPage(sitter: sitter)),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(sitter['image']),
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(sitter['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(sitter['speciality'], style: TextStyle(color: Colors.grey[700])),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text('${sitter['rating']} (${sitter['reviews']} reviews)'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text('${sitter['experience']} experience • ${sitter['distance']}'),
                          Text(sitter['schedule'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
