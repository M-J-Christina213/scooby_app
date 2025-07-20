import 'package:flutter/material.dart';

class GroomingDetailPage extends StatelessWidget {
  final Map<String, dynamic> groomer;

  const GroomingDetailPage({super.key, required this.groomer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groomer['name']),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(groomer['image']),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(groomer['speciality'], style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text('${groomer['rating']} (${groomer['reviews']} reviews)'),
              ],
            ),
            SizedBox(height: 16),
            Text('Experience: ${groomer['experience']}'),
            Text('Distance: ${groomer['distance']}'),
            Text('Available: ${groomer['schedule']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Optional: Add appointment functionality
              },
              child: Text("Book Grooming Session"),
            ),
          ],
        ),
      ),
    );
  }
}
