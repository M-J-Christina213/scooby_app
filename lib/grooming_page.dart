import 'package:flutter/material.dart';
import 'grooming_detail_page.dart'; // Create this file

class GroomingPage extends StatelessWidget {
  final List<Map<String, dynamic>> groomers = [
    {
      'name': 'Mr. Pradeep',
      'speciality': 'Full Grooming Expert',
      'rating': 4.8,
      'reviews': 80,
      'distance': '1.2 km',
      'experience': '5 years',
      'schedule': 'Monday - Saturday at 9:00 a.m - 6:00 p.m',
      'image': 'assets/images/download (1).jpeg',
    },
    {
      'name': 'Ms. Anjali',
      'speciality': 'Fur Styling Specialist',
      'rating': 4.9,
      'reviews': 95,
      'distance': '2.0 km',
      'experience': '6 years',
      'schedule': 'Monday - Friday at 10:00 a.m - 5:00 p.m',
      'image': 'assets/images/download.jpeg',
    },
    {
      'name': 'Mr. Roshan',
      'speciality': 'Nail Clipping Expert',
      'rating': 5.0,
      'reviews': 70,
      'distance': '2.8 km',
      'experience': '4 years',
      'schedule': 'Tuesday - Sunday at 8:00 a.m - 4:00 p.m',
      'image': 'assets/images/images.jpeg',
    },
  ];

  GroomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grooming Services"),
        backgroundColor: const Color.fromARGB(255, 228, 156, 238),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: groomers.length,
        itemBuilder: (context, index) {
          final groomer = groomers[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GroomingDetailPage(groomer: groomer)),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(groomer['image']),
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(groomer['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(groomer['speciality'], style: TextStyle(color: Colors.grey[700])),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text('${groomer['rating']} (${groomer['reviews']} reviews)'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text('${groomer['experience']} experience • ${groomer['distance']}'),
                          Text(groomer['schedule'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
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
